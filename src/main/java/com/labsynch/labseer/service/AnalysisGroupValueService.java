package com.labsynch.labseer.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.labsynch.labseer.domain.AnalysisGroupValue;

@Service
public interface AnalysisGroupValueService {

	public List<AnalysisGroupValue> getAnalysisGroupValuesByExperimentIdAndStateTypeKind(Long experimentId, String stateType, 
			String stateKind);
	
	public List<AnalysisGroupValue> getAnalysisGroupValuesByExperimentIdAndStateTypeKindAndValueTypeKind(Long experimentId, String stateType,
			String stateKind, String valueType, String valueKind);

	public String getCsvList(List<AnalysisGroupValue> AnalysisGroupValues);
	
}