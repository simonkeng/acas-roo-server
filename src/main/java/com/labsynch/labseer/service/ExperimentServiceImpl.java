package com.labsynch.labseer.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupValue;
import com.labsynch.labseer.domain.DDictValue;
import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ExperimentLabel;
import com.labsynch.labseer.domain.ExperimentState;
import com.labsynch.labseer.domain.ExperimentValue;
import com.labsynch.labseer.domain.ItxProtocolProtocol;
import com.labsynch.labseer.domain.LsTag;
import com.labsynch.labseer.domain.Protocol;
import com.labsynch.labseer.domain.ProtocolLabel;
import com.labsynch.labseer.domain.ProtocolValue;
import com.labsynch.labseer.dto.AnalysisGroupValueDTO;
import com.labsynch.labseer.dto.AutoLabelDTO;
import com.labsynch.labseer.dto.ExperimentFilterDTO;
import com.labsynch.labseer.dto.ExperimentFilterSearchDTO;
import com.labsynch.labseer.dto.ExperimentSearchRequestDTO;
import com.labsynch.labseer.dto.JSTreeNodeDTO;
import com.labsynch.labseer.dto.StringCollectionDTO;
import com.labsynch.labseer.dto.ValueTypeKindDTO;
import com.labsynch.labseer.exceptions.UniqueExperimentNameException;
import com.labsynch.labseer.utils.PropertiesUtilService;


@Service
@Transactional
public class ExperimentServiceImpl implements ExperimentService {

	@Autowired
	private PropertiesUtilService propertiesUtilService;

	@Autowired
	private AnalysisGroupService analysisGroupService;
	
	@Autowired
	private ProtocolService protocolService;

	@Autowired
	private AutoLabelService autoLabelService;
	
	@Autowired
	private ExperimentValueService experimentValueService;

	private static final Logger logger = LoggerFactory.getLogger(ExperimentServiceImpl.class);

	
	@Override
	public void deleteLsExperiment(Experiment experiment){
		logger.debug("incoming meta experiment: " + experiment.toJson());

	}

	
	@Override
	@Transactional
	public Experiment updateExperiment(Experiment jsonExperiment){
		logger.debug("incoming meta experiment: " + jsonExperiment.toPrettyJson());
		logger.debug("recorded by: " + jsonExperiment.getRecordedBy());

		Experiment updatedExperiment = Experiment.update(jsonExperiment);
		if (jsonExperiment.getLsLabels() != null) {
			for(ExperimentLabel experimentLabel : jsonExperiment.getLsLabels()){
				logger.debug("Label in hand: " + experimentLabel.getLabelText());			
				if (experimentLabel.getId() == null){
					ExperimentLabel newExperimentLabel = new ExperimentLabel(experimentLabel);
					newExperimentLabel.setExperiment(updatedExperiment);
					newExperimentLabel.persist();						
				} else {
					ExperimentLabel updatedLabel = ExperimentLabel.update(experimentLabel);
					logger.debug("updated experiment label " + updatedLabel.getId());
				}
			}			
		} else {
			logger.debug("No experiment labels to update");
		}

		if(jsonExperiment.getLsStates() != null){
			for(ExperimentState experimentState : jsonExperiment.getLsStates()){
				ExperimentState updatedExperimentState;
				if (experimentState.getId() == null){
					updatedExperimentState = new ExperimentState(experimentState);
					updatedExperimentState.setExperiment(updatedExperiment);
					updatedExperimentState.persist();
				} else {
					updatedExperimentState = ExperimentState.update(experimentState);
					logger.debug("updated experiment state " + experimentState.getId());

				}
				if (experimentState.getLsValues() != null){
					for(ExperimentValue experimentValue : experimentState.getLsValues()){
						ExperimentValue updatedExperimentValue;
						if (experimentValue.getId() == null){
							updatedExperimentValue = ExperimentValue.create(experimentValue);
							updatedExperimentValue.setLsState(ExperimentState.findExperimentState(experimentState.getId()));
							updatedExperimentValue.persist();
						} else {
							updatedExperimentValue = ExperimentValue.update(experimentValue);
							logger.debug("updated experiment value " + updatedExperimentValue.getId());
						}
					}	
				} else {
					logger.debug("No experiment values to update");
				}
			}
		}

		logger.debug("updatedExperiment: " + updatedExperiment.toPrettyJson());
		return updatedExperiment;

	}

	@Override
	@Transactional
	public Experiment saveLsExperiment(Experiment experiment) throws UniqueExperimentNameException{
		logger.debug("incoming meta experiment: " + experiment.toJson());

		//check if experiment with the same name exists
		boolean checkExperimentName = propertiesUtilService.getUniqueExperimentName();
		if (checkExperimentName){
			boolean experimentExists = false;
			Set<ExperimentLabel> exptLabels = experiment.getLsLabels();
			for (ExperimentLabel label : exptLabels){
				String labelText = label.getLabelText();
				long protocolId = experiment.getProtocol().getId();
				List<ExperimentLabel> experimentLabels = ExperimentLabel.findExperimentLabelsByNameAndProtocol(labelText, protocolId).getResultList();	
				for (ExperimentLabel el : experimentLabels){
					Experiment exp = el.getExperiment();
					if (!exp.isIgnored()){
						experimentExists = true;
					}
				}
			}

			if (experimentExists){
				throw new UniqueExperimentNameException("Experiment with the same name exists");							
			}
		}

		Experiment newExperiment = new Experiment(experiment);

		newExperiment.setProtocol(Protocol.findProtocol(experiment.getProtocol().getId()));
		if (newExperiment.getCodeName() == null){
			newExperiment.setCodeName(autoLabelService.getExperimentCodeName());
		}
		newExperiment.persist();
		logger.debug("persisted the newExperiment: " + newExperiment.toJson());


		if (experiment.getLsLabels() != null) {
			Set<ExperimentLabel> lsLabels = new HashSet<ExperimentLabel>();
			for(ExperimentLabel experimentLabel : experiment.getLsLabels()){
				ExperimentLabel newExperimentLabel = new ExperimentLabel(experimentLabel);
				newExperimentLabel.setExperiment(newExperiment);
				logger.debug("here is the newExperimentLabel before save: " + newExperimentLabel.toJson());
				newExperimentLabel.persist();
				lsLabels.add(newExperimentLabel);
			}
			newExperiment.setLsLabels(lsLabels);
		} else {
			logger.debug("No experiment labels to save");
		}

		if(experiment.getLsStates() != null){
			Set<ExperimentState> lsStates = new HashSet<ExperimentState>();
			for(ExperimentState experimentState : experiment.getLsStates()){
				ExperimentState newExperimentState = new ExperimentState(experimentState);
				newExperimentState.setExperiment(newExperiment);
				logger.debug("here is the newExperimentState before save: " + newExperimentState.toJson());
				newExperimentState.persist();
				logger.debug("persisted the newExperimentState: " + newExperimentState.toJson());
				if (experimentState.getLsValues() != null){
					Set<ExperimentValue> lsValues = new HashSet<ExperimentValue>();
					for(ExperimentValue experimentValue : experimentState.getLsValues()){
						logger.debug("experimentValue: " + experimentValue.toJson());
						experimentValue.setLsState(newExperimentState);
						experimentValue.persist();
						lsValues.add(experimentValue);
						logger.debug("persisted the experimentValue: " + experimentValue.toJson());
					}	
					newExperimentState.setLsValues(lsValues);
				} else {
					logger.debug("No experiment values to save");
				}
				lsStates.add(newExperimentState);
			}
			newExperiment.setLsStates(lsStates);
		}
		if(experiment.getAnalysisGroups() != null){
			Set<AnalysisGroup> analysisGroups = new HashSet<AnalysisGroup>();
			for(AnalysisGroup analysisGroup : experiment.getAnalysisGroups()){
				analysisGroup.getExperiments().add(newExperiment);
				AnalysisGroup newAnalysisGroup = analysisGroupService.saveLsAnalysisGroup(analysisGroup);
				analysisGroups.add(newAnalysisGroup);
				logger.debug("persisted the newAnalysisGroup: " + newAnalysisGroup.toJson());
			}
			newExperiment.setAnalysisGroups(analysisGroups);
		}

		return newExperiment;
	}


	@Override
	public Experiment getFullExperiment(Experiment queryExperiment){
		Experiment experiment = Experiment.findExperiment(queryExperiment.getId());
		Set<ExperimentLabel> lsLabels = new HashSet<ExperimentLabel>();
		for (ExperimentLabel experimentLabel : ExperimentLabel.findExperimentLabelsByExperiment(experiment).getResultList()){
			lsLabels.add(experimentLabel);
		}
		experiment.setLsLabels(lsLabels);
		Set<ExperimentState> lsStates = new HashSet<ExperimentState>();
		for (ExperimentState experimentState : ExperimentState.findExperimentStatesByExperiment(experiment).getResultList()){
			for (ExperimentValue experimentValue : ExperimentValue.findExperimentValuesByLsState(experimentState).getResultList()){

			}
			lsStates.add(experimentState);
		}	
		experiment.setLsStates(lsStates);
		Set<AnalysisGroup> analysisGroups = new HashSet<AnalysisGroup>();
		Set<Experiment> experiments = new HashSet<Experiment>();
		experiments.add(experiment);
		for (AnalysisGroup analysisGroup : AnalysisGroup.findAnalysisGroupsByExperiments(experiments).getResultList()){
			analysisGroups.add(analysisGroup);
		}
		experiment.setAnalysisGroups(analysisGroups);

		return experiment;
	}

	@Override
	public Collection<ExperimentFilterDTO> getExperimentFilters(Collection<String> experimentCodes){
		Collection<ExperimentFilterDTO> eftSet = new HashSet<ExperimentFilterDTO>();
		for (String experimentCode : experimentCodes){
			logger.debug("searching for : " + experimentCode);
			List<Experiment> experiments = Experiment.findExperimentsByCodeNameEquals(experimentCode).getResultList();
			Experiment experiment = null;
			if (experiments.size() == 1){
				experiment = experiments.get(0);
				ExperimentFilterDTO eft = new ExperimentFilterDTO();
				eft.setExperimentId(experiment.getId());
				eft.setExperimentCode(experimentCode);
				List<ExperimentLabel> experimentNames = ExperimentLabel.findExperimentPreferredName(experiment.getId()).getResultList();
				if (experimentNames.size() == 1){
					eft.setExperimentName(experimentNames.get(0).getLabelText());
				} else if (experimentNames.size() > 1) {
					logger.error("found mulitiple preferred names");
				} else {
					logger.error("no preferred names");
				}
				Collection<ValueTypeKindDTO> valueTypes = AnalysisGroupValue.findAnalysisGroupValueTypeKindDTO(experimentCode).getResultList();
				eft.setValueKinds(valueTypes);
				eftSet.add(eft);
			} else {
				logger.error("ERROR. Did not find a single experiment for : " + experimentCode + "  found: " + experiments.size());
			}

		}

		logger.debug(ExperimentFilterDTO.toPrettyJsonArray(eftSet));

		return eftSet;

	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<JSTreeNodeDTO> getExperimentNodes(Collection<String> codeValues){
		List<Experiment> experiments;
		if (codeValues == null || codeValues.size() == 0){
			experiments = Experiment.findAllExperiments();
		} else {
			experiments = Experiment.findExperimentsByBatchCodes(codeValues).getResultList();
		}

		logger.debug("number of experiments found: " + experiments.size());

		Set<Protocol> protocols = new LinkedHashSet<Protocol>();
		Set<JSTreeNodeDTO> nodes = new LinkedHashSet<JSTreeNodeDTO>();
		for (Experiment exp : experiments){
			protocols.add(Protocol.findProtocol(exp.getProtocol().getId()));

			String experimentLabel;
			List<ExperimentLabel> experimentNames = ExperimentLabel.findExperimentPreferredName(exp.getId()).getResultList();
			if (experimentNames.size() < 1){
				String errorMessage = "expected a single preferred experiment name. Found " + experimentNames.size();
				logger.error(errorMessage);
				//throw new RuntimeException(errorMessage);
				experimentLabel = "NO PREFERRED EXPERIMENT NAME";
			} else if (experimentNames.size() > 1){
				String errorMessage = "expected a single preferred experiment name. Found " + experimentNames.size();
				logger.error(errorMessage);
				//				throw new RuntimeException(errorMessage);
				experimentLabel = "MULTIPLE PREFERRED EXPERIMENT NAME";
			} else {
				experimentLabel = experimentNames.get(0).getLabelText();
			}

			JSTreeNodeDTO node = new JSTreeNodeDTO();
			node.setDescription(exp.getShortDescription());
			node.setId(exp.getCodeName());
			node.setParent(exp.getProtocol().getCodeName());
			node.setLsTags(exp.getLsTags());
			node.setText(new StringBuilder().append(exp.getCodeName()).append(" ").append(experimentLabel).toString());
			nodes.add(node);

			StringBuilder allTagText = new StringBuilder();
			boolean firstTag = true;
			for (LsTag tag : exp.getLsTags()){
				if (firstTag){
					allTagText.append("Keywords: ").append(tag.getTagText());
					firstTag = false;
				} else {
					allTagText.append("; ").append(tag.getTagText());
				}
			}
			if (exp.getLsTags().size() > 0){
				JSTreeNodeDTO tagNode = new JSTreeNodeDTO();
				tagNode.setId("tags_" + exp.getCodeName());
				tagNode.setParent(exp.getCodeName());
				tagNode.setText(allTagText.toString());
				nodes.add(tagNode);
			}

			//			JSTreeNodeDTO descriptionNode = new JSTreeNodeDTO();
			//			descriptionNode.setId("desc_" + exp.getCodeName());
			//			descriptionNode.setParent(exp.getCodeName());
			//			descriptionNode.setText(exp.getShortDescription());
			//			nodes.add(descriptionNode);
		}

		JSTreeNodeDTO rootNode = new JSTreeNodeDTO();
		rootNode.setId("Root Node");
		rootNode.setParent("#");
		rootNode.setText("All Protocols");
		rootNode.setDescription("Root Node for All Protocols");
		nodes.add(rootNode);

		logger.debug("number of protocols found: " + protocols.size());
		for (Protocol prot : protocols){

			String protocolLabel;
			List<ProtocolLabel> protocolNames = ProtocolLabel.findProtocolPreferredName(prot.getId()).getResultList();
			if (protocolNames.size() < 1){
				String errorMessage = "expected a single preferred protocol name. Found " + protocolNames.size();
				logger.error(errorMessage);
				//throw new RuntimeException(errorMessage);
				protocolLabel = "NO PREFERRED EXPERIMENT NAME";
			} else if (protocolNames.size() > 1){
				String errorMessage = "expected a single preferred protocol name. Found " + protocolNames.size();
				logger.error(errorMessage);
				//				throw new RuntimeException(errorMessage);
				protocolLabel = "MULTIPLE PREFERRED PROTOCOL NAME";
			} else {
				protocolLabel = protocolNames.get(0).getLabelText();
			}

			JSTreeNodeDTO node = new JSTreeNodeDTO();
			node.setId(prot.getCodeName());
			node.setDescription(prot.getShortDescription());
			node.setParent(prot.getLsKind());
			node.setLsTags(prot.getLsTags());
			node.setText(new StringBuilder().append(protocolLabel).toString());

			nodes.add(node);

			JSTreeNodeDTO protocolKindNode = new JSTreeNodeDTO();
			protocolKindNode.setId(prot.getLsKind());
			protocolKindNode.setParent("Root Node");
			protocolKindNode.setText(prot.getLsKind());
			protocolKindNode.setDescription("Protocol Kind");
			nodes.add(protocolKindNode);
		}

		logger.debug("number of nodes made: " + nodes.size());
		logger.debug(JSTreeNodeDTO.toPrettyJsonArray(nodes));

		return nodes;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<JSTreeNodeDTO> getExperimentNodesByProtocolTree(Collection<String> codeValues){
		List<Experiment> experiments;
		if (codeValues == null || codeValues.size() == 0){
			experiments = Experiment.findAllExperiments();
		} else {
			experiments = Experiment.findExperimentsByBatchCodes(codeValues).getResultList();
		}

		logger.debug("number of experiments found: " + experiments.size());

		Set<Protocol> protocols = new LinkedHashSet<Protocol>();
		Set<JSTreeNodeDTO> nodes = new LinkedHashSet<JSTreeNodeDTO>();
		for (Experiment exp : experiments){
			protocols.add(Protocol.findProtocol(exp.getProtocol().getId()));

			String experimentLabel;
			List<ExperimentLabel> experimentNames = ExperimentLabel.findExperimentPreferredName(exp.getId()).getResultList();
			if (experimentNames.size() < 1){
				String errorMessage = "expected a single preferred experiment name. Found " + experimentNames.size();
				logger.error(errorMessage);
				//throw new RuntimeException(errorMessage);
				experimentLabel = "NO PREFERRED EXPERIMENT NAME";
			} else if (experimentNames.size() > 1){
				String errorMessage = "expected a single preferred experiment name. Found " + experimentNames.size();
				logger.error(errorMessage);
				//				throw new RuntimeException(errorMessage);
				experimentLabel = "MULTIPLE PREFERRED EXPERIMENT NAME";
			} else {
				experimentLabel = experimentNames.get(0).getLabelText();
			}

			JSTreeNodeDTO node = new JSTreeNodeDTO();
			node.setDescription(exp.getShortDescription());
			node.setId(exp.getCodeName());
			node.setParent(exp.getProtocol().getCodeName());
			node.setLsTags(exp.getLsTags());
			node.setText(new StringBuilder().append(experimentLabel).toString());
			nodes.add(node);

			StringBuilder allTagText = new StringBuilder();
			boolean firstTag = true;
			for (LsTag tag : exp.getLsTags()){
				if (firstTag){
					allTagText.append("Keywords: ").append(tag.getTagText());
					firstTag = false;
				} else {
					allTagText.append("; ").append(tag.getTagText());
				}
			}
			if (exp.getLsTags().size() > 0){
				JSTreeNodeDTO tagNode = new JSTreeNodeDTO();
				tagNode.setId("tags_" + exp.getCodeName());
				tagNode.setParent(exp.getCodeName());
				tagNode.setText(allTagText.toString());
				nodes.add(tagNode);
			}

		}

		JSTreeNodeDTO rootNode = new JSTreeNodeDTO();
		rootNode.setId("Root Node");
		rootNode.setParent("#");
		rootNode.setText("All Protocols");
		rootNode.setDescription("Root Node for All Protocols");
		nodes.add(rootNode);

		logger.debug("number of protocols found: " + protocols.size());
		for (Protocol prot : protocols){

			String protocolLabel;
			List<ProtocolLabel> protocolNames = ProtocolLabel.findProtocolPreferredName(prot.getId()).getResultList();
			if (protocolNames.size() < 1){
				String errorMessage = "expected a single preferred protocol name. Found " + protocolNames.size();
				logger.error(errorMessage);
				//throw new RuntimeException(errorMessage);
				protocolLabel = "NO PREFERRED EXPERIMENT NAME";
			} else if (protocolNames.size() > 1){
				String errorMessage = "expected a single preferred protocol name. Found " + protocolNames.size();
				logger.error(errorMessage);
				//				throw new RuntimeException(errorMessage);
				protocolLabel = "MULTIPLE PREFERRED PROTOCOL NAME";
			} else {
				protocolLabel = protocolNames.get(0).getLabelText();
			}

			if (ItxProtocolProtocol.findItxProtocolProtocolsBySecondProtocol(prot).getResultList().size() > 0){
				List<String> protocolNodeList = new ArrayList<String>();
				List<String> nodeNameList = lookupProtocolTree(prot, protocolNodeList);
				int nodeIndex = 0;
				for (String nodeName : nodeNameList){
					logger.debug("here is the nodeName: " + nodeName + "  index:" + nodeIndex );
					nodeIndex++; //incrementing to the next

					JSTreeNodeDTO protocolNode = new JSTreeNodeDTO();
					protocolNode.setId(nodeName);
					protocolNode.setDescription(prot.getShortDescription());
					protocolNode.setLsTags(prot.getLsTags());
					protocolNode.setText(new StringBuilder().append(protocolLabel).toString());
					if (nodeIndex < nodeNameList.size()){
						protocolNode.setParent(nodeNameList.get(nodeIndex));
					} else {
						protocolNode.setParent("Root Node");
					}

					nodes.add(protocolNode);
				}
			} else {
				logger.debug("this protocol is not attached by a protocol tree. set to default node");
				JSTreeNodeDTO protocolNode = new JSTreeNodeDTO();
				protocolNode.setId(prot.getCodeName());
				protocolNode.setDescription(prot.getShortDescription());
				protocolNode.setLsTags(prot.getLsTags());
				protocolNode.setText(new StringBuilder().append(protocolLabel).toString());
				protocolNode.setParent("Root Node");
				nodes.add(protocolNode);

			}


			//			JSTreeNodeDTO node = new JSTreeNodeDTO();
			//			node.setId(prot.getCodeName());
			//			node.setDescription(prot.getShortDescription());
			//			node.setParent(prot.getLsKind());
			//			node.setLsTags(prot.getLsTags());
			//			node.setText(new StringBuilder().append(protocolLabel).toString());

			//
			//			JSTreeNodeDTO protocolKindNode = new JSTreeNodeDTO();
			//			protocolKindNode.setId(prot.getLsKind());
			//			protocolKindNode.setParent("Root Node");
			//			protocolKindNode.setText(prot.getLsKind());
			//			protocolKindNode.setDescription("Protocol Kind");
			//			nodes.add(protocolKindNode);
		}

		logger.debug("number of nodes made: " + nodes.size());
		logger.debug(JSTreeNodeDTO.toPrettyJsonArray(nodes));

		return nodes;
	}



	//a recursive function to walk up the protocol tree
	private List<String> lookupProtocolTree(Protocol protocol, List<String> protocolNodeList) {
		List<ItxProtocolProtocol> ipps = ItxProtocolProtocol.findItxProtocolProtocolsBySecondProtocol(protocol).getResultList();
		if (ipps.size() > 1){
			logger.error("ERROR: there is more than a single protocol interacation. " + ipps.size());
		}
		for (ItxProtocolProtocol ipp : ipps){
			if (ipp.getFirstProtocol().getLsType().equalsIgnoreCase("protocolTree")){
				protocolNodeList.add(ipp.getFirstProtocol().getLsKind());
				lookupProtocolTree(ipp.getFirstProtocol(), protocolNodeList);
			}
		}
		return protocolNodeList;
	}

	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public List<AnalysisGroupValueDTO> getFilteredAGData(ExperimentSearchRequestDTO searchRequest){

		searchRequest.getBatchCodeList().removeAll(Collections.singleton(null));
		searchRequest.getExperimentCodeList().removeAll(Collections.singleton(null));


		Set<String> uniqueBatchCodes = new HashSet<String>();
		if (searchRequest.getBatchCodeList() != null && searchRequest.getBatchCodeList().size() > 0 ){
			uniqueBatchCodes.addAll(searchRequest.getBatchCodeList());
			logger.debug("size of uniqueBatchCodes: " + uniqueBatchCodes.size());
		}

		List<String> batchCodes = null;
		Collection<String> collectionOfCodes = null;

		boolean filteredGeneData = false;

		if (searchRequest.getBooleanFilter() != null && searchRequest.getBooleanFilter().equalsIgnoreCase("ADVANCED")){
			//DO SQL substitutions for now. Try to do something more elegant later
			collectionOfCodes = AnalysisGroupValue.findBatchCodeBySearchFilter(searchRequest.getAdvancedFilterSQL()).getResultList();
			if (uniqueBatchCodes.size() > 0){
				collectionOfCodes = CollectionUtils.intersection(collectionOfCodes, uniqueBatchCodes);				
			}
			collectionOfCodes.removeAll(Collections.singleton(null));
			filteredGeneData = true;
		} else if (searchRequest.getBooleanFilter() != null && searchRequest.getSearchFilters() != null && searchRequest.getSearchFilters().size() > 0){
			filteredGeneData = true;
			boolean firstPass = true;		
			for (ExperimentFilterSearchDTO singleSearchFilter : searchRequest.getSearchFilters()){
				if (firstPass){
					collectionOfCodes = AnalysisGroupValue.findBatchCodeBySearchFilter(searchRequest.getBatchCodeList(), searchRequest.getExperimentCodeList(), singleSearchFilter).getResultList();
					logger.debug("size of firstBatchCodes: " + collectionOfCodes.size());
					firstPass = false;
				} else {
					batchCodes = AnalysisGroupValue.findBatchCodeBySearchFilter(searchRequest.getBatchCodeList(), searchRequest.getExperimentCodeList(), singleSearchFilter).getResultList();
					logger.debug("size of firstBatchCodes: " + collectionOfCodes.size());
					logger.debug("size of secondBatchCodes: " + batchCodes.size());
					if (searchRequest.getBooleanFilter().equalsIgnoreCase("AND")){
						collectionOfCodes = CollectionUtils.intersection(collectionOfCodes, batchCodes);
					} else {
						collectionOfCodes = CollectionUtils.union(collectionOfCodes, batchCodes);
					}
					logger.debug("size of intersectCodes: " + collectionOfCodes.size());
				}
			}
		} else {
			collectionOfCodes = uniqueBatchCodes;
		}

		Set<String> finalUniqueBatchCodes = new HashSet<String>();

		if (collectionOfCodes != null){
			logger.debug("size of all intersectCodes: " + collectionOfCodes.size());
			finalUniqueBatchCodes.addAll(collectionOfCodes);
			logger.debug("number of unique batchCodes found: " + finalUniqueBatchCodes.size());
		}

		finalUniqueBatchCodes.removeAll(Collections.singleton(null));



		List<AnalysisGroupValueDTO> agValues = null;
		if (finalUniqueBatchCodes.size() > 0){
			logger.debug("looking by expriment codes and batch codes");
			agValues = AnalysisGroupValue.findAnalysisGroupValueDTO(finalUniqueBatchCodes, searchRequest.getExperimentCodeList()).getResultList();
			logger.debug("number of agValues found: " + agValues.size());
		} else if (!filteredGeneData && finalUniqueBatchCodes.size() == 0) {
			logger.debug("looking by expriment codes only");
			agValues = AnalysisGroupValue.findAnalysisGroupValueDTOByExperiments(searchRequest.getExperimentCodeList()).getResultList();
			logger.debug("number of agValues found: " + agValues.size());
		} else if (filteredGeneData && finalUniqueBatchCodes.size() == 0){
			logger.debug("no results found with the search filters");
			agValues = new ArrayList<AnalysisGroupValueDTO>();
		}

		return agValues;


		//		if (searchRequest.getBooleanFilter() != null && searchRequest.getBooleanFilter().equalsIgnoreCase("ADVANCED")){
		//			// not implemented yet -- do same as AND for now
		//			searchRequest.getBatchCodeList().removeAll(Collections.singleton(null));
		//			List<String> batchCodes = AnalysisGroupValue.findBatchCodeBySearchFilters(searchRequest.getBatchCodeList(), searchRequest.getExperimentCodeList(), searchRequest.getSearchFilters()).getResultList();			
		//			Set<String> uniqueBatchCodes = new HashSet<String>();
		//			uniqueBatchCodes.addAll(batchCodes);
		//			uniqueBatchCodes.removeAll(Collections.singleton(null));
		//
		//			logger.debug("number of batchCodes found: " + batchCodes.size());
		//			logger.debug("number of uniqueBatchCodes found: " + uniqueBatchCodes.size());
		//
		//			if (uniqueBatchCodes.size() > 0){
		//				logger.debug("looking by expriment codes and batch codes in default AND block");
		//				agValues = AnalysisGroupValue.findAnalysisGroupValueDTO(uniqueBatchCodes, searchRequest.getExperimentCodeList()).getResultList();
		//				logger.debug("number of agValues found: " + agValues.size());
		//
		//			} else {
		//				logger.debug("looking by expriment codes only");
		//				agValues = AnalysisGroupValue.findAnalysisGroupValueDTOByExperiments(searchRequest.getExperimentCodeList()).getResultList();	
		//			}
		//		} else if (searchRequest.getBooleanFilter() != null && searchRequest.getBooleanFilter().equalsIgnoreCase("OR")){
		//			searchRequest.getBatchCodeList().removeAll(Collections.singleton(null));
		//			Set<String> uniqueBatchCodes = new HashSet<String>();
		//			if (searchRequest.getBatchCodeList() != null && searchRequest.getBatchCodeList().size() > 0) {
		//				uniqueBatchCodes.addAll(searchRequest.getBatchCodeList());				
		//			}
		//			for (ExperimentFilterSearchDTO filter : searchRequest.getSearchFilters()){
		//				List<String> batchCodes = AnalysisGroupValue.findBatchCodeBySearchFilter(searchRequest.getBatchCodeList(), searchRequest.getExperimentCodeList(), filter).getResultList();
		//				uniqueBatchCodes.addAll(batchCodes);
		//			}
		//			uniqueBatchCodes.removeAll(Collections.singleton(null));
		//			if (uniqueBatchCodes.size() > 0){
		//				logger.debug("looking by expriment codes and batch codes in OR block");
		//				agValues = AnalysisGroupValue.findAnalysisGroupValueDTO(uniqueBatchCodes, searchRequest.getExperimentCodeList()).getResultList();
		//			} else {
		//				logger.debug("looking by expriment codes only");
		//				agValues = AnalysisGroupValue.findAnalysisGroupValueDTOByExperiments(searchRequest.getExperimentCodeList()).getResultList();	
		//			}		
		//		} else {
		//			//default is the AND			
		//			logger.info("this is the default AND filter block. 2014-03-27");
		//			searchRequest.getBatchCodeList().removeAll(Collections.singleton(null));
		//			
		//			
		//			
		//			
		//			List<String> batchCodes = AnalysisGroupValue.findBatchCodeBySearchFilters(searchRequest.getBatchCodeList(), searchRequest.getExperimentCodeList(), searchRequest.getSearchFilters()).getResultList();			
		//			Set<String> uniqueBatchCodes = new HashSet<String>();
		//			uniqueBatchCodes.addAll(batchCodes);
		//			uniqueBatchCodes.removeAll(Collections.singleton(null));
		//
		//			logger.debug("number of batchCodes found: " + batchCodes.size());
		//			logger.debug("number of uniqueBatchCodes found: " + uniqueBatchCodes.size());
		//
		//			if (uniqueBatchCodes.size() > 0){
		//				logger.debug("looking by expriment codes and batch codes in default AND block");
		//				agValues = AnalysisGroupValue.findAnalysisGroupValueDTO(uniqueBatchCodes, searchRequest.getExperimentCodeList()).getResultList();
		//				logger.debug("number of agValues found: " + agValues.size());
		//
		//			} else {
		//				logger.debug("looking by expriment codes only");
		//				agValues = AnalysisGroupValue.findAnalysisGroupValueDTOByExperiments(searchRequest.getExperimentCodeList()).getResultList();	
		//			}
		//
		//
		//		}

	}

	public Collection<Experiment> findExperimentsByGenericMetaDataSearch(String queryString) {
		//make our HashSets: experimentIdList will be filled/cleared/refilled for each term
		//experimentList is the final search result
		HashSet<Long> experimentIdList = new HashSet<Long>();
		HashSet<Long> experimentAllIdList = new HashSet<Long>();
		Collection<Experiment> experimentList = new HashSet<Experiment>();
		//Split the query up on spaces
		String[] splitQuery = queryString.split("\\s+");
		logger.debug("Number of search terms: " + splitQuery.length);
		//Make the Map of terms and HashSets of experiment id's then fill. We will run intersect logic later.
		Map<String, HashSet<Long>> resultsByTerm = new HashMap<String, HashSet<Long>>();
		for (String term : splitQuery) {
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "CODENAME"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "NAME"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "SCIENTIST"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "KIND"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "STATUS"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "PROTOCOL TYPE"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "PROTOCOL KIND"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "PROTOCOL NAME"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "DATE"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "NOTEBOOK"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "KEYWORD"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "ASSAY ACTIVITY"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "MOLECULAR TARGET"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "ASSAY TYPE"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "ASSAY TECHNOLOGY"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "CELL LINE"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "TARGET ORIGIN"));
			experimentIdList.addAll(findExperimentIdsByMetadata(term, "ASSAY STAGE"));
			
			resultsByTerm.put(term, new HashSet<Long>(experimentIdList));
			experimentAllIdList.addAll(experimentIdList);
			experimentIdList.clear();
		}
		//Here is the intersect logic
		for (String term: splitQuery) {
			experimentAllIdList.retainAll(resultsByTerm.get(term));
		}
		for (Long id: experimentAllIdList) experimentList.add(Experiment.findExperiment(id));
		return experimentList;
	}

	private Collection<Long> findExperimentIdsByMetadata(String queryString, String searchBy) {
		Collection<Long> experimentIdList = new HashSet<Long>();
		if (searchBy == "CODENAME") {
			List<Experiment> experiments = Experiment.findExperimentsByCodeNameLike(queryString).getResultList();
			if (!experiments.isEmpty()){
				for (Experiment experiment:experiments) {
					experimentIdList.add(experiment.getId());
				}
			}
			experiments.clear();
		}
		if (searchBy == "TYPE") {
			List<Experiment> experiments = Experiment.findExperimentsByLsTypeLike(queryString).getResultList();
			if (!experiments.isEmpty()){
				for (Experiment experiment:experiments) {
					experimentIdList.add(experiment.getId());
				}
			}
			experiments.clear();
		}
		if (searchBy == "KIND") {
			List<Experiment> experiments = Experiment.findExperimentsByLsKindLike(queryString).getResultList();
			if (!experiments.isEmpty()){
				for (Experiment experiment:experiments) {
					experimentIdList.add(experiment.getId());
				}
			}
			experiments.clear();
		}
		if (searchBy == "NAME") {
			List<ExperimentLabel> experimentLabels = ExperimentLabel.findExperimentLabelsByLabelTextLike(queryString).getResultList();
			if (!experimentLabels.isEmpty()) {
				for (ExperimentLabel experimentLabel: experimentLabels) {
					experimentIdList.add(experimentLabel.getExperiment().getId());
				}
			}
			experimentLabels.clear();
		}
		
		if (searchBy == "SCIENTIST") {
			Collection<ExperimentValue> experimentValues = ExperimentValue.findExperimentValuesByLsKindEqualsAndStringValueLike("scientist", queryString).getResultList();
			if (!experimentValues.isEmpty()){
				for (ExperimentValue experimentValue : experimentValues) {
					experimentIdList.add(experimentValue.getLsState().getExperiment().getId());
				}
			}
			experimentValues.clear();
		}
		if (searchBy == "STATUS") {
			Collection<ExperimentValue> experimentValues = ExperimentValue.findExperimentValuesByLsKindEqualsAndStringValueLike("status", queryString).getResultList();
			if (!experimentValues.isEmpty()){
				for (ExperimentValue experimentValue : experimentValues) {
					experimentIdList.add(experimentValue.getLsState().getExperiment().getId());
				}
			}
			experimentValues.clear();
		}
		if (searchBy == "PROTOCOL KIND") {
			Collection<Long> protocolIds = protocolService.findProtocolIdsByMetadata(queryString, "KIND");
			Set<Experiment> experiments = new HashSet<Experiment>();
			if (!protocolIds.isEmpty()) {
				for (Long id: protocolIds) {
					experiments.addAll(Experiment.findExperimentsByProtocol(Protocol.findProtocol(id)).getResultList());
				}
			}
			if (!experiments.isEmpty()){
				for (Experiment experiment: experiments) {
					experimentIdList.add(experiment.getId());
				}
			}
			experiments.clear();
		}
		if (searchBy == "PROTOCOL NAME") {
			Collection<Long> protocolIds = protocolService.findProtocolIdsByMetadata(queryString, "NAME");
			Set<Experiment> experiments = new HashSet<Experiment>();
			if (!protocolIds.isEmpty()) {
				for (Long id: protocolIds) {
					experiments.addAll(Experiment.findExperimentsByProtocol(Protocol.findProtocol(id)).getResultList());
				}
			}
			if (!experiments.isEmpty()){
				for (Experiment experiment: experiments) {
					experimentIdList.add(experiment.getId());
				}
			}
			experiments.clear();
		}
		if (searchBy == "PROTOCOL TYPE") {
			Collection<Long> protocolIds = protocolService.findProtocolIdsByMetadata(queryString, "TYPE");
			Set<Experiment> experiments = new HashSet<Experiment>();
			if (!protocolIds.isEmpty()) {
				for (Long id: protocolIds) {
					experiments.addAll(Experiment.findExperimentsByProtocol(Protocol.findProtocol(id)).getResultList());
				}
			}
			if (!experiments.isEmpty()){
				for (Experiment experiment: experiments) {
					experimentIdList.add(experiment.getId());
				}
			}
			experiments.clear();
		}
		if (searchBy == "PROTOCOL CODENAME") {
			Collection<Long> protocolIds = protocolService.findProtocolIdsByMetadata(queryString, "CODENAME");
			Set<Experiment> experiments = new HashSet<Experiment>();
			if (!protocolIds.isEmpty()) {
				for (Long id: protocolIds) {
					experiments.addAll(Experiment.findExperimentsByProtocol(Protocol.findProtocol(id)).getResultList());
				}
			}
			if (!experiments.isEmpty()){
				for (Experiment experiment: experiments) {
					experimentIdList.add(experiment.getId());
				}
			}
			experiments.clear();
		}
		if (searchBy == "DATE") {
			Collection<ExperimentValue> experimentValues = new HashSet<ExperimentValue>();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
			DateFormat df2 = new SimpleDateFormat("MM-dd-yyyy", Locale.ENGLISH);
			try {
				Date date = df.parse(queryString);
				experimentValues = ExperimentValue.findExperimentValuesByLsKindEqualsAndDateValueLike("creation date", date).getResultList();
			} catch (Exception e) {
				try {
					Date date = df2.parse(queryString);
					experimentValues = ExperimentValue.findExperimentValuesByLsKindEqualsAndDateValueLike("creation date", date).getResultList();
				} catch (Exception e2) {
					//do nothing
				}
			}
			if (!experimentValues.isEmpty()) {
				for (ExperimentValue experimentValue : experimentValues) {
					experimentIdList.add(experimentValue.getLsState().getExperiment().getId());
				}
			}
			experimentValues.clear();
		}
		if (searchBy == "NOTEBOOK") {
			Collection<ExperimentValue> experimentValues = ExperimentValue.findExperimentValuesByLsKindEqualsAndStringValueLike("notebook", queryString).getResultList();
			if (!experimentValues.isEmpty()) {
				for (ExperimentValue experimentValue : experimentValues) {
					experimentIdList.add(experimentValue.getLsState().getExperiment().getId());
				}
			}
			experimentValues.clear();
		}
		if (searchBy == "KEYWORD") {
			Collection<LsTag> tags = LsTag.findLsTagsByTagTextLike(queryString).getResultList();
			if (!tags.isEmpty()) {
				for (LsTag tag: tags) {
					Collection<Experiment> experiments = tag.getExperiments();
					if (!experiments.isEmpty()) {
						for (Experiment experiment:experiments) {
							experimentIdList.add(experiment.getId());
						}
					}
					experiments.clear();
				}
			}
			tags.clear();
		}
		if (searchBy == "ASSAY ACTIVITY" || searchBy == "MOLECULAR TARGET" || searchBy == "ASSAY TYPE" || searchBy == "ASSAY TECHNOLOGY" || searchBy == "CELL LINE" || searchBy == "TARGET ORIGIN" || searchBy == "ASSAY STAGE") {
			Collection<DDictValue> ddictValues = DDictValue.findDDictValuesByLabelTextLike(queryString).getResultList();
			if (!ddictValues.isEmpty()) {
				for (DDictValue ddictvalue : ddictValues) {
					if (ddictvalue.getShortName() != null) {
						Collection<ExperimentValue> experimentValues = ExperimentValue.findExperimentValuesByLsKindEqualsAndCodeValueLike(searchBy.toLowerCase(), ddictvalue.getShortName()).getResultList();
						if (!experimentValues.isEmpty()) {
							for (ExperimentValue experimentValue : experimentValues) {
								experimentIdList.add(experimentValue.getLsState().getExperiment().getId());
							}
						}
						experimentValues.clear();
					}
				}
			}
		}
		
		return experimentIdList;
	}
	

	@Override
	public Collection<Experiment> findExperimentsByMetadataJson(String json) {
		Collection<Experiment> experimentList = new HashSet<Experiment>();
		Collection<StringCollectionDTO> metaDataList = StringCollectionDTO.fromJsonArrayToStringCollectioes(json);
		for (StringCollectionDTO metaData : metaDataList){
			Collection<Experiment> experiments = findExperimentByMetadata(metaData.getName());
			if (experiments.size() > 0){
				experimentList.addAll(experiments);
			}
		}
		
		return experimentList;
	}


	private Collection<Experiment> findExperimentByMetadata(String queryString) {
		Collection<Experiment> experimentList = new HashSet<Experiment>();
		
		//find by experiment codeName
		List<Experiment> experiments = Experiment.findExperimentsByCodeNameEquals(queryString).getResultList();
		if (!experiments.isEmpty()){
			experimentList.addAll(experiments);
		}
		
		//find by experiment name
		Collection<Experiment> experimentsByName = Experiment.findExperimentByName(queryString);
		if (!experimentsByName.isEmpty()){
			experimentList.addAll(experimentsByName);
		}
		
		return experimentList;
	}
	
	public Collection<Experiment> findExperimentsByMetadata(String queryString, String searchBy) {
		Collection<Experiment> experimentList = new HashSet<Experiment>();
		Collection<Long> experimentIdList = findExperimentIdsByMetadata(queryString, searchBy);
		if (!experimentIdList.isEmpty()) {
			for (Long id: experimentIdList) {
				experimentList.add(Experiment.findExperiment(id));
			}
		}
		return experimentList;
	}


	@Override
	public Set<Experiment> findExperimentsByRequestMetadata(
			Map<String, String> requestParams) {
		
        Set<Experiment> result = new HashSet<Experiment>();
        
        if (requestParams.isEmpty()) {
        	result.addAll(Experiment.findAllExperiments());
        	return result;
        }
        
		Set<Experiment> resultByProtocolKind = new HashSet<Experiment>();
        Set<Experiment> resultByProtocolType = new HashSet<Experiment>();
        Set<Experiment> resultByProtocolName = new HashSet<Experiment>();
        Set<Experiment> resultByProtocolCodeName = new HashSet<Experiment>();
        Set<Experiment> resultByKind = new HashSet<Experiment>();
        Set<Experiment> resultByType = new HashSet<Experiment>();
        Set<Experiment> resultByName = new HashSet<Experiment>();
        Set<Experiment> resultByCodeName = new HashSet<Experiment>();
        if (requestParams.containsKey("protocolKind"))resultByProtocolKind.addAll(findExperimentsByMetadata(requestParams.get("protocolKind"), "PROTOCOL KIND"));
        if (requestParams.containsKey("protocolType")) resultByProtocolType.addAll(findExperimentsByMetadata(requestParams.get("protocolType"), "PROTOCOL TYPE"));
        if (requestParams.containsKey("protocolName")) resultByProtocolName.addAll(findExperimentsByMetadata(requestParams.get("protocolName"), "PROTOCOL NAME"));
        if (requestParams.containsKey("protocolCodeName")) resultByProtocolCodeName.addAll(findExperimentsByMetadata(requestParams.get("protocolCodeName"), "PROTOCOL CODENAME"));
        if (requestParams.containsKey("kind"))resultByKind.addAll(findExperimentsByMetadata(requestParams.get("kind"), "KIND"));
        if (requestParams.containsKey("type")) resultByType.addAll(findExperimentsByMetadata(requestParams.get("type"), "TYPE"));
        if (requestParams.containsKey("name")) resultByName.addAll(findExperimentsByMetadata(requestParams.get("name"), "NAME"));
        if (requestParams.containsKey("codeName")) resultByCodeName.addAll(findExperimentsByMetadata(requestParams.get("codeName"), "CODENAME"));

        result.addAll(resultByProtocolKind);
        result.addAll(resultByProtocolType);
        result.addAll(resultByProtocolName);
        result.addAll(resultByProtocolCodeName);
        result.addAll(resultByKind);
        result.addAll(resultByType);
        result.addAll(resultByName);
        result.addAll(resultByCodeName);
        
        if (requestParams.containsKey("protocolKind")) result.retainAll(resultByProtocolKind);
        if (requestParams.containsKey("protocolType")) result.retainAll(resultByProtocolType);
        if (requestParams.containsKey("protocolName")) result.retainAll(resultByProtocolName);
        if (requestParams.containsKey("protocolCodeName")) result.retainAll(resultByProtocolCodeName);
        if (requestParams.containsKey("kind")) result.retainAll(resultByKind);
        if (requestParams.containsKey("type")) result.retainAll(resultByType);
        if (requestParams.containsKey("name")) result.retainAll(resultByName);
        if (requestParams.containsKey("codeName")) result.retainAll(resultByCodeName);
        
        return result;
	}


	@Override
	public boolean isSoftDeleted(Experiment experiment) {
		Long experimentId = experiment.getId();
		List<ExperimentValue> experimentValues = experimentValueService.getExperimentValuesByExperimentIdAndStateTypeKindAndValueTypeKind(experimentId, "metadata", "experiment metadata", "stringValue", "status");
		boolean isSoftDeleted = false;
		for (ExperimentValue experimentValue : experimentValues) {
			if (experimentValue.getStringValue().equals("Deleted")) isSoftDeleted = true;
		}
		return isSoftDeleted;
	}

}
