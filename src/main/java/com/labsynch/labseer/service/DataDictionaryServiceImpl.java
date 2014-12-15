package com.labsynch.labseer.service;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.labsynch.labseer.domain.DDictKind;
import com.labsynch.labseer.domain.DDictType;
import com.labsynch.labseer.domain.DDictValue;
import com.labsynch.labseer.dto.CodeTableDTO;

@Service
@Transactional
public class DataDictionaryServiceImpl implements DataDictionaryService {

	@Autowired
	private AutoLabelService autoLabelService;

	private static final Logger logger = LoggerFactory.getLogger(DataDictionaryServiceImpl.class);


	@Override
	public DDictValue saveDataDictionaryValue(DDictValue dDict, Boolean createTypeAndKind) {
		logger.debug("here is the incoming ddict value: " + dDict.toJson());
		List<DDictValue> dDictVals = DDictValue.findDDictValuesByLsTypeEqualsAndLsKindEqualsAndShortNameEquals(dDict.getLsType(), dDict.getLsKind(), dDict.getShortName()).getResultList();
		DDictValue dDictVal ;
		
		if (dDictVals.size() == 0){
			if (createTypeAndKind){
				getOrCreateDDictType(dDict.getLsType());
				getOrCreateDDictKind(dDict.getLsType(), dDict.getLsKind());
			}
			dDictVal = new DDictValue(dDict);
			dDictVal.setCodeName(autoLabelService.getDataDictionaryCodeName());
			dDictVal.persist();						

//			if (DDictValue.validate(dDict)){
//				dDictVal.persist();						
//			} else {
//				logger.error("ERROR: invalid dDictVal." + dDictVal.toJson());
//				dDictVal = null;
//			}
		} else if (dDictVals.size() == 1){
			dDictVal = dDictVals.get(0); 
		} else {
			dDictVal = null;
			logger.error("ERROR: found multiple DDictValue entries: " + DDictValue.toJsonArray(dDictVals));
		}
		
		return dDictVal;
	}
	

	private void getOrCreateDDictKind(String lsType, String lsKind) {
		int dDictKindsSize = DDictKind.findDDictKindsByLsTypeEqualsAndNameEquals(lsType, lsKind).getMaxResults();
		if (dDictKindsSize == 0){
			DDictKind dDictKind = new DDictKind();
			dDictKind.setLsType(lsType);
			dDictKind.setName(lsKind);
			dDictKind.persist();
			logger.info("INFO: created a new DDictKind: " + dDictKind.toJson());
		}
	}


	private void getOrCreateDDictType(String lsType) {
		int dDictTypesSize = DDictType.findDDictTypesByNameEquals(lsType).getMaxResults();
		if (dDictTypesSize == 0){
			DDictType newDDictType = new DDictType();
			newDDictType.setName(lsType);
			newDDictType.persist();
			logger.info("INFO: created a new DDictType: " + newDDictType.toJson());
		}
	}
	
	@Override
	public Collection<DDictValue> saveDataDictionaryValues(Collection<DDictValue> dDictValues, Boolean createTypeAndKind) {
		List<DDictValue> newDDictValues = new ArrayList<DDictValue>();
		for (DDictValue dDictVal : dDictValues){
			DDictValue newDDictVal = saveDataDictionaryValue(dDictVal, createTypeAndKind);
			if (newDDictVal != null){
				newDDictValues.add(newDDictVal);
			}
		}
		
		return newDDictValues;
	}



	@Override
	public List<CodeTableDTO> getDataDictionaryCodeTableListByTypeKind(String lsType, String lsKind) {
		List<CodeTableDTO> codeTableList = new ArrayList<CodeTableDTO>();
		for (DDictValue val : DDictValue.findDDictValuesByLsTypeEqualsAndLsKindEquals(lsType, lsKind).getResultList()) {
			if (!val.isIgnored()) {
				CodeTableDTO codeTable = new CodeTableDTO(val);
				codeTableList.add(codeTable);
			}
		}
		return codeTableList;
	}

	@Override
	public List<CodeTableDTO> getDataDictionaryCodeTableListByType(String lsType) {
		List<CodeTableDTO> codeTableList = new ArrayList<CodeTableDTO>();
		for (DDictValue val : DDictValue.findDDictValuesByLsTypeEquals(lsType).getResultList()) {
			if (!val.isIgnored()) {
				CodeTableDTO codeTable = new CodeTableDTO(val);
				codeTableList.add(codeTable);
			}
		}
		return codeTableList;
	}
	

	@Override
	public CodeTableDTO getDataDictionaryCodeTable(DDictValue dDictValue) {
		CodeTableDTO codeTable = new CodeTableDTO(dDictValue);
		return codeTable;
	}


	@Override
	public String getCsvList(List<DDictValue> dDictValues) {
		StringWriter outFile = new StringWriter();
		ICsvBeanWriter beanWriter = null;
		try {
			beanWriter = new CsvBeanWriter(outFile, CsvPreference.STANDARD_PREFERENCE);
			final String[] header = DDictValue.getColumns();
			final CellProcessor[] processors = DDictValue.getProcessors();
			beanWriter.writeHeader(header);
			for (final DDictValue dDictValue : dDictValues) {
				beanWriter.write(dDictValue, header, processors);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (beanWriter != null) {
				try {
					beanWriter.close();
					outFile.flush();
					outFile.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return outFile.toString();
	}


	@Override
	public List<CodeTableDTO> convertToCodeTables(List<DDictValue> dDictResults) {
		List<CodeTableDTO> codeTableList = new ArrayList<CodeTableDTO>();
		for (DDictValue val : dDictResults) {
			CodeTableDTO codeTable = new CodeTableDTO(val);
			codeTableList.add(codeTable);
		}
		return codeTableList;	
	}



	@Override
	public CodeTableDTO saveCodeTableValue(String lsType, String lsKind, CodeTableDTO codeTableValue, Boolean createTypeAndKind) {
		List<DDictValue> dDictVals = DDictValue.findDDictValuesByLsTypeEqualsAndLsKindEqualsAndShortNameEquals(lsType, lsKind, codeTableValue.getCode()).getResultList();
		
		DDictValue dDictVal ;
		if (dDictVals.size() == 0){
			dDictVal = new DDictValue(codeTableValue, lsType, lsKind);
			dDictVal = saveDataDictionaryValue(dDictVal, createTypeAndKind);
		} else {
			dDictVal = null;
			logger.error("ERROR: found exisiting DDictValue entries: " + DDictValue.toJsonArray(dDictVals));
		}
		
		if (dDictVal == null) {
			return null;
		} else {
			return new CodeTableDTO(dDictVal);
		}
	}
	
	@Override
	public Collection<CodeTableDTO> saveCodeTableValueArray(String lsType, String lsKind, List<CodeTableDTO> codeTableDTOs, Boolean createTypeAndKind) {
		List<CodeTableDTO> codeTables = new ArrayList<CodeTableDTO>();
		for (CodeTableDTO codeTableDTO : codeTableDTOs){
			CodeTableDTO codeTable = saveCodeTableValue(lsKind, lsKind, codeTableDTO, createTypeAndKind);
			if (codeTable != null){
				codeTables.add(codeTable);
			}
		}
		
		return codeTables;
	}

	

	@Override
	public CodeTableDTO updateCodeTableValue(String lsType, String lsKind, CodeTableDTO codeTableValue) {	
		DDictValue oldDDictValue = DDictValue.findDDictValue(codeTableValue.getId());
		if (oldDDictValue == null){
			return null;
		} else  {
			oldDDictValue.setShortName(codeTableValue.getCode());
			oldDDictValue.setLabelText(codeTableValue.getName());
			oldDDictValue.merge();
			return new CodeTableDTO(oldDDictValue);			
		} 
	}


	@Override
	public Collection<CodeTableDTO> updateCodeTableValueArray(String lsType, String lsKind, List<CodeTableDTO> codeTableDTOs) {
		List<CodeTableDTO> codeTables = new ArrayList<CodeTableDTO>();
		for (CodeTableDTO codeTableDTO : codeTableDTOs){
			CodeTableDTO codeTable = updateCodeTableValue(lsKind, lsKind, codeTableDTO);
			if (codeTable != null){
				codeTables.add(codeTable);
			}
		}
		
		return codeTables;
	}






}
