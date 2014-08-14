package com.labsynch.labseer.service;


import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvBeanReader;
import org.supercsv.io.ICsvBeanReader;
import org.supercsv.prefs.CsvPreference;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupLabel;
import com.labsynch.labseer.domain.AnalysisGroupState;
import com.labsynch.labseer.domain.AnalysisGroupValue;
import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.Subject;
import com.labsynch.labseer.domain.SubjectLabel;
import com.labsynch.labseer.domain.SubjectState;
import com.labsynch.labseer.domain.SubjectValue;
import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.domain.TreatmentGroupLabel;
import com.labsynch.labseer.domain.TreatmentGroupState;
import com.labsynch.labseer.domain.TreatmentGroupValue;
import com.labsynch.labseer.dto.FlatThingCsvDTO;
import com.labsynch.labseer.dto.TempThingDTO;
import com.labsynch.labseer.utils.PropertiesUtilService;

@Service
@Transactional
public class AnalysisGroupServiceImpl implements AnalysisGroupService {

	private static final Logger logger = LoggerFactory.getLogger(AnalysisGroupServiceImpl.class);

	@Autowired
	private PropertiesUtilService propertiesUtilService;
	
	@Autowired
	private AutoLabelService autoLabelService;
	
	@Autowired
	private TreatmentGroupService treatmentGroupService;
		
	@Autowired
	private SubjectService subjectService;
		
	@Override
	@Transactional
	public boolean saveLsAnalysisGroupFromCsv(String analysisGroupFilePath, String treatmentGroupFilePath, String subjectFilePath){
		
		boolean successfulLoad = true;
		HashMap<String, TempThingDTO> output2 = null;
		try {
			HashMap<String, TempThingDTO> output = createAnalysisGroupsFromCSV(analysisGroupFilePath );
			if (treatmentGroupFilePath != null && !treatmentGroupFilePath.equalsIgnoreCase("")) {
				output2 = treatmentGroupService.createTreatmentGroupsFromCSV(treatmentGroupFilePath, output);
			}
			if (output2 != null && subjectFilePath != null && !subjectFilePath.equalsIgnoreCase("")){
				HashMap<String, TempThingDTO> output3 = subjectService.createSubjectsFromCSV(subjectFilePath, output2);
			}
		} catch (IOException e) {
			logger.error("Unable to open file " + e);
			successfulLoad = false;
		}

		return successfulLoad;
				
	}
	
	@Override
	@Transactional
	public AnalysisGroup saveLsAnalysisGroup(AnalysisGroup analysisGroup){

		logger.debug("incoming meta analysisGroup: " + analysisGroup.toJson());
		int batchSize = propertiesUtilService.getBatchSize();
		Date recordedDate = new Date();
		AnalysisGroup newAnalysisGroup = new AnalysisGroup(analysisGroup);
		logger.debug("incoming experiment: " + analysisGroup.getExperiment().toJson());
		newAnalysisGroup.setExperiment(Experiment.findExperiment(analysisGroup.getExperiment().getId()));
//		logger.debug("set experiment = " + newAnalysisGroup.getExperiment().getId());
		if (newAnalysisGroup.getRecordedDate() == null) { newAnalysisGroup.setRecordedDate(recordedDate);}
		if (newAnalysisGroup.getRecordedBy() == null) { newAnalysisGroup.setRecordedBy(analysisGroup.getExperiment().getRecordedBy()); }
		newAnalysisGroup.persist();
		logger.debug("persisted the newAnalysisGroup: " + newAnalysisGroup.toJson());

		if (analysisGroup.getLsLabels() != null) {
			int i = 0;
			for(AnalysisGroupLabel analysisGroupLabel : analysisGroup.getLsLabels()){
				AnalysisGroupLabel newAnalysisGroupLabel = new AnalysisGroupLabel(analysisGroupLabel);
				newAnalysisGroupLabel.setAnalysisGroup(newAnalysisGroup);
				//logger.debug("here is the newAnalysisGroupLabel before save: " + newAnalysisGroupLabel.toJson());				
				newAnalysisGroupLabel.persist();
			    if ( i % batchSize == 0 ) { // same as the JDBC batch size
			    	newAnalysisGroupLabel.flush();
			    	newAnalysisGroupLabel.clear();
			    }
			    i++;
			}			
		} 
		
		if (analysisGroup.getLsStates() != null){
			int i = 0;
			for(AnalysisGroupState analysisGroupState : analysisGroup.getLsStates()){
				AnalysisGroupState newAnalysisGroupState = new AnalysisGroupState(analysisGroupState);
				newAnalysisGroupState.setAnalysisGroup(newAnalysisGroup);
				if (newAnalysisGroupState.getRecordedDate() == null) {newAnalysisGroupState.setRecordedDate(recordedDate);}		
				if (newAnalysisGroupState.getRecordedBy() == null) { newAnalysisGroupState.setRecordedBy(newAnalysisGroupState.getAnalysisGroup().getRecordedBy()); }
				logger.debug("here is the ag state: " + newAnalysisGroupState.toJson());
				newAnalysisGroupState.persist();
				logger.debug("persisted the newAnalysisGroupState: " + newAnalysisGroupState.toJson());
				if (analysisGroupState.getLsValues() != null){
					for(AnalysisGroupValue analysisGroupValue : analysisGroupState.getLsValues()){
						if (analysisGroupValue.getRecordedDate() == null) {analysisGroupValue.setRecordedDate(recordedDate);}
						analysisGroupValue.setLsState(newAnalysisGroupState);
						analysisGroupValue.persist();
						logger.debug("persisted the analysisGroupValue: " + analysisGroupValue.toJson());
					}				
				}
			    if ( i % batchSize == 0 ) { //50, same as the JDBC batch size
			    	newAnalysisGroupState.flush();
			    	newAnalysisGroupState.clear();
			    }
			    i++;
			}		
		}

		if (analysisGroup.getTreatmentGroups() != null){
			logger.debug("number of treatmentGroups " + analysisGroup.getTreatmentGroups().size());
			int i = 0;
			for(TreatmentGroup treatmentGroup : analysisGroup.getTreatmentGroups()){
				TreatmentGroup newTreatmentGroup = new TreatmentGroup(treatmentGroup);
				newTreatmentGroup.setAnalysisGroup(newAnalysisGroup);
				newTreatmentGroup.persist();
				if (treatmentGroup.getLsLabels() != null) {
					for(TreatmentGroupLabel treatmentGroupLabel : treatmentGroup.getLsLabels()){
						TreatmentGroupLabel newTreatmentGroupLabel = new TreatmentGroupLabel(treatmentGroupLabel);
						newTreatmentGroupLabel.setTreatmentGroup(newTreatmentGroup);
						newTreatmentGroupLabel.persist();	
					}		
				}
				if (treatmentGroup.getLsStates() != null){
					for(TreatmentGroupState treatmentGroupState : treatmentGroup.getLsStates()){
						TreatmentGroupState newTreatmentGroupState = new TreatmentGroupState(treatmentGroupState);
						newTreatmentGroupState.setTreatmentGroup(newTreatmentGroup);
						newTreatmentGroupState.persist();
						if (treatmentGroupState.getLsValues() != null){
							for(TreatmentGroupValue treatmentGroupValue : treatmentGroupState.getLsValues()){
								treatmentGroupValue.setLsState(newTreatmentGroupState);
								treatmentGroupValue.persist();
								logger.debug("persisted the treatmentGroupValue: " + treatmentGroupValue.toJson());
							}										
						}
					}					
				}
			    if ( i % batchSize == 0 ) { //50, same as the JDBC batch size
			    	newTreatmentGroup.flush();
			    	newTreatmentGroup.clear();
			    }
			    i++;

				if (treatmentGroup.getSubjects() != null){
					int j = 0;
					for(Subject subject : treatmentGroup.getSubjects()){
						Subject newSubject = new Subject(subject);
						newSubject.setTreatmentGroup(newTreatmentGroup);
						newSubject.persist();
						if (subject.getLsLabels() != null) {
							for(SubjectLabel subjectLabel : subject.getLsLabels()){
								SubjectLabel newSubjectLabel = new SubjectLabel(subjectLabel);
								newSubjectLabel.setSubject(newSubject);
								newSubjectLabel.persist();	
							}		
						}
						if (subject.getLsStates() != null){
							for(SubjectState subjectState : subject.getLsStates()){
								SubjectState newSubjectState = new SubjectState(subjectState);
								newSubjectState.setSubject(newSubject);
								newSubjectState.persist();
								if (subjectState.getLsValues() != null){
									for (SubjectValue subjectValue : subjectState.getLsValues()){
										subjectValue.setLsState(newSubjectState);
										subjectValue.persist();
									}								
								}
							}
						}
					    if ( j % batchSize == 0 ) { 
					    	newSubject.flush();
					    	newSubject.clear();
					    }
					    j++;
					}
				}
			}
		}
	
		return newAnalysisGroup;

//		return AnalysisGroup.findAnalysisGroup(newAnalysisGroup.getId());
	}

	@Override
	@Transactional
	public AnalysisGroup updateLsAnalysisGroup(AnalysisGroup analysisGroup){

		logger.debug("incoming meta analysisGroup to update: " + analysisGroup.toJson());
		AnalysisGroup updatedAnalysisGroup = AnalysisGroup.update(analysisGroup);

		if (analysisGroup.getLsLabels() != null) {
			for(AnalysisGroupLabel analysisGroupLabel : analysisGroup.getLsLabels()){
				if (analysisGroupLabel.getId() == null){
					AnalysisGroupLabel newAnalysisGroupLabel = new AnalysisGroupLabel(analysisGroupLabel);
					newAnalysisGroupLabel.setAnalysisGroup(updatedAnalysisGroup);
					newAnalysisGroupLabel.persist();
				} else {
					AnalysisGroupLabel updatedAnalysisGroupLabel = AnalysisGroupLabel.update(analysisGroupLabel);
				}
			}			
		} 
		
		
		if (analysisGroup.getLsStates() != null){
			for(AnalysisGroupState analysisGroupState : analysisGroup.getLsStates()){
				if (analysisGroupState.getId() == null){
					AnalysisGroupState newAnalysisGroupState = new AnalysisGroupState(analysisGroupState);
					newAnalysisGroupState.setAnalysisGroup(updatedAnalysisGroup);
					if (newAnalysisGroupState.getRecordedDate() == null) {newAnalysisGroupState.setRecordedDate(new Date());}		
					if (newAnalysisGroupState.getRecordedBy() == null) { newAnalysisGroupState.setRecordedBy(updatedAnalysisGroup.getRecordedBy()); }
					newAnalysisGroupState.persist();
					logger.debug("persisted the newAnalysisGroupState: " + newAnalysisGroupState.toJson());					
				} else {
					AnalysisGroupState updatedAnalysisGroupState = AnalysisGroupState.update(analysisGroupState);
				}
				if (analysisGroupState.getLsValues() != null){
					for(AnalysisGroupValue analysisGroupValue : analysisGroupState.getLsValues()){
						if (analysisGroupValue.getId() == null){
							if (analysisGroupValue.getRecordedDate() == null) {analysisGroupValue.setRecordedDate(new Date());}
							analysisGroupValue.setLsState(AnalysisGroupState.findAnalysisGroupState(analysisGroupState.getId()));
							analysisGroupValue.persist();
							logger.debug("persisted the analysisGroupValue: " + analysisGroupValue.toJson());							
						} else {
							AnalysisGroupValue updatedAnalysisGroupValue = AnalysisGroupValue.update(analysisGroupValue);
						}

					}				
				}
			}		
		}

		if (analysisGroup.getTreatmentGroups() != null){
			logger.debug("number of treatmentGroups " + analysisGroup.getTreatmentGroups().size());
			for(TreatmentGroup treatmentGroup : analysisGroup.getTreatmentGroups()){
				treatmentGroupService.updateTreatmentGroup(treatmentGroup);
			}

		}

		return AnalysisGroup.findAnalysisGroup(updatedAnalysisGroup.getId());
	}
	
	@Transactional
	public HashMap<String, TempThingDTO> createLsAnalysisGroupsFromCSV(String analysisGroupCSV, String treatmentGroupCSV, String subjectCSV) throws IOException{
		
		HashMap<String, TempThingDTO> analysisGroupMap = createAnalysisGroupsFromCSV(analysisGroupCSV);
		
		if (treatmentGroupCSV != null){
			
			HashMap<String, TempThingDTO> treatmentGroupMap = treatmentGroupService.createLsTreatmentGroupsFromCSV(analysisGroupMap, treatmentGroupCSV, subjectCSV);
			
		}
		
		return analysisGroupMap;


	}
	
	@Override
	@Transactional
	public HashMap<String, TempThingDTO> createAnalysisGroupsFromCSV(String absoluteFilePath) throws IOException{
		
		int batchSize = propertiesUtilService.getBatchSize();
		ICsvBeanReader beanReader = null;
		HashMap<String, TempThingDTO> analysisGroupMap = new HashMap<String, TempThingDTO>();
		HashMap<String, TempThingDTO> analysisStateMap = new HashMap<String, TempThingDTO>();
		HashMap<String, TempThingDTO> analysisValueMap = new HashMap<String, TempThingDTO>();

		try {
			logger.info("read csv delimited file");
			//InputStream is = CreateAnalysisGroupsFromCSVFileTests.class.getClassLoader().getResourceAsStream(inputFileName);
			InputStream is = new FileInputStream(absoluteFilePath);  
			InputStreamReader isr = new InputStreamReader(is);  
			BufferedReader br = new BufferedReader(isr);

			beanReader = new CsvBeanReader(br, CsvPreference.TAB_PREFERENCE);
			String[] headerText = beanReader.getHeader(true);

			List<String> headerList = new ArrayList<String>();
			int position = 0;
			for (String head : headerText){
				logger.info("header column: " + position + "  " + head);
				headerList.add(head);
				position++;
			}

			logger.info("size of header list  " + headerList.size());
			String[] header = new String[headerList.size()];
			headerList.toArray(header);

			for (String head : header){
				logger.debug("header column array : " + position + "  " + head);
				position++;
			}

			final CellProcessor[] processors = FlatThingCsvDTO.getProcessors();

			FlatThingCsvDTO analysisGroupDTO;
			AnalysisGroup analysisGroup;
			AnalysisGroupState analysisGroupState;
			AnalysisGroupValue analysisGroupValue;

			// note: we want to allow creation of anlysisGroups with no states or values
			// thus the code must create the analysisGroups first. (modification to input file ??) 
			// try leaning on stateType and stateKind or valueType and valueKind
			// if both null -- then do not create an entry
			
			long rowIndex = 1;
			while( (analysisGroupDTO = beanReader.read(FlatThingCsvDTO.class, header, processors)) != null ) {
				logger.debug(String.format("lineNo=%s, rowNo=%s, bulkData=%s", beanReader.getLineNumber(), beanReader.getRowNumber(), analysisGroupDTO));

				if (analysisGroupDTO.getLsType() == null) analysisGroupDTO.setLsType("default");
				if (analysisGroupDTO.getLsKind() == null) analysisGroupDTO.setLsKind("default");
				if (analysisGroupDTO.getTempId() == null) analysisGroupDTO.setTempId(analysisGroupDTO.getId().toString());

				analysisGroup = getOrCreateAnalysisGroup(analysisGroupDTO, analysisGroupMap);
				if (analysisGroup != null){
					analysisGroup.persist();
					logger.debug("saved the new analysis group: " + analysisGroup.getId() + " " + analysisGroup.getCodeName());
					logger.debug("saved the new analysis group: " + analysisGroup.toJson());

////				    if ( rowIndex % batchSize == 0 ) {
////				    	analysisGroup.flush();
////				    	analysisGroup.clear();
////				    }
					analysisGroupMap = saveTempAnalysisGroup(analysisGroup, analysisGroupDTO, analysisGroupMap);
				}
			
				if (analysisGroupDTO.getStateType() != null && analysisGroupDTO.getStateKind() != null){
					if (analysisGroupDTO.getTempStateId() == null) analysisGroupDTO.setTempStateId(analysisGroupDTO.getStateId().toString());
					analysisGroupState = getOrCreateAnalysisState(analysisGroupDTO, analysisStateMap, analysisGroupMap);
					if (analysisGroupState != null){
						analysisGroupState.persist();
						logger.debug("saved the new analysis group state: " + analysisGroupState.getId());
						logger.debug("saved the new analysis group state: " + analysisGroupState.toJson());

//					    if ( rowIndex % batchSize == 0 ) {
//					    	analysisGroupState.flush();
//					    	analysisGroupState.clear();
//					    }
					    analysisStateMap = saveTempAnalysisState(analysisGroupState, analysisGroupDTO, analysisStateMap);
					}

					if (analysisGroupDTO.getValueType() != null && analysisGroupDTO.getValueKind() != null){
						if (analysisGroupDTO.getTempValueId() == null) analysisGroupDTO.setTempValueId(Long.toString(rowIndex));
						analysisGroupValue = getOrCreateAnalysisValue(analysisGroupDTO, analysisValueMap, analysisStateMap);
						if (analysisGroupValue != null){
							analysisGroupValue.persist();
							logger.debug("saved the analysisGroupValue: " + analysisGroupValue.toJson());
						    if ( rowIndex % batchSize == 0 ) {
						    	analysisGroupValue.flush();
						    	analysisGroupValue.clear();
						    }
						    analysisValueMap = saveTempAnalysisValue(analysisGroupValue, analysisGroupDTO, analysisValueMap);
						}
					}
				} else {
					logger.debug("---------- not saving a new analysis group state: " + analysisGroupDTO.getStateType());
				}
				
				rowIndex++;
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			beanReader.close();
		}
		
		return analysisGroupMap;
	}

	private HashMap<String, TempThingDTO> saveTempAnalysisValue(
			AnalysisGroupValue analysisGroupValue,
			FlatThingCsvDTO analysisGroupDTO,
			HashMap<String, TempThingDTO> analysisValueMap) {

		TempThingDTO tempThingDTO = new TempThingDTO();
		tempThingDTO.setId(analysisGroupValue.getId());
		tempThingDTO.setTempId(analysisGroupDTO.getTempValueId());
		analysisValueMap.put(analysisGroupDTO.getTempValueId(), tempThingDTO);
		return analysisValueMap;
	}

	private HashMap<String, TempThingDTO> saveTempAnalysisState(
			AnalysisGroupState analysisGroupState,
			FlatThingCsvDTO analysisGroupDTO,
			HashMap<String, TempThingDTO> analysisStateMap) {

		TempThingDTO tempThingDTO = new TempThingDTO();
		tempThingDTO.setId(analysisGroupState.getId());
		tempThingDTO.setTempId(analysisGroupDTO.getTempStateId());
		analysisStateMap.put(analysisGroupDTO.getTempStateId(), tempThingDTO);

		return analysisStateMap;
	}

	private HashMap<String, TempThingDTO> saveTempAnalysisGroup(
				AnalysisGroup analysisGroup,
				FlatThingCsvDTO analysisGroupDTO, 
				HashMap<String, TempThingDTO> analysisGroupMap) {
		
		TempThingDTO tempThingDTO = new TempThingDTO();
		tempThingDTO.setId(analysisGroup.getId());
		tempThingDTO.setCodeName(analysisGroup.getCodeName());
		tempThingDTO.setTempId(analysisGroupDTO.getTempId().toString());
		analysisGroupMap.put(analysisGroupDTO.getTempId(), tempThingDTO);
		return analysisGroupMap;
	}

	private AnalysisGroupValue getOrCreateAnalysisValue(
			FlatThingCsvDTO analysisGroupDTO,
			HashMap<String, TempThingDTO> analysisValueMap, HashMap<String, TempThingDTO> analysisStateMap) {

		logger.debug("searching for analysisGroupDTO.id ---- " + analysisGroupDTO.getId());
		AnalysisGroupValue analysisGroupValue = null;
		if (!analysisValueMap.containsKey(analysisGroupDTO.getTempValueId())){
			analysisGroupValue = new AnalysisGroupValue(analysisGroupDTO);
			AnalysisGroupState ags = AnalysisGroupState.findAnalysisGroupState(analysisStateMap.get(analysisGroupDTO.getTempStateId()).getId());
			analysisGroupValue.setLsState(ags);
		} else {
			logger.debug("skipping the saved analysisGroupValue --------- " + analysisGroupDTO.getStateId());
		}

		return analysisGroupValue;
	}

	private AnalysisGroupState getOrCreateAnalysisState(
			FlatThingCsvDTO analysisGroupDTO,
			HashMap<String, TempThingDTO> analysisStateMap, HashMap<String, TempThingDTO> analysisGroupMap) {

		AnalysisGroupState analysisGroupState = null;
		if (!analysisStateMap.containsKey(analysisGroupDTO.getTempStateId())){
			if (analysisGroupDTO.getStateId() == null){
				analysisGroupState = new AnalysisGroupState(analysisGroupDTO);
				analysisGroupState.setAnalysisGroup(AnalysisGroup.findAnalysisGroup(analysisGroupMap.get(analysisGroupDTO.getTempId()).getId()));				
			} else {
				analysisGroupState = AnalysisGroupState.findAnalysisGroupState(analysisGroupDTO.getStateId());
			}
		} else {
			logger.debug("skipping the saved analysisGroupState --------- " + analysisGroupDTO.getStateId());
		}

		return analysisGroupState;
	}


	private AnalysisGroup getOrCreateAnalysisGroup(
			FlatThingCsvDTO analysisGroupDTO, 
			HashMap<String, TempThingDTO> analysisGroupMap) {

		AnalysisGroup analysisGroup = null;
		if (!analysisGroupMap.containsKey(analysisGroupDTO.getTempId())){
			if (analysisGroupDTO.getId() == null){
				analysisGroup = new AnalysisGroup(analysisGroupDTO);
				analysisGroup.setExperiment(Experiment.findExperiment(analysisGroupDTO.getParentId()));
				if (analysisGroup.getCodeName() == null){
					analysisGroup.setCodeName(autoLabelService.getAnalysisGroupCodeName());
				}
				//analysisGroup = saveLsAnalysisGroup(analysisGroup);
			} else {
				analysisGroup = AnalysisGroup.findAnalysisGroup(analysisGroupDTO.getId());
			}
		} else {
			logger.debug("skipping the previously saved analysisGroup --------- " + analysisGroupDTO.getCodeName());
		}

		return analysisGroup;
	}



}
