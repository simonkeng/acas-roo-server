// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.AnalysisGroupCodeDTO;
import com.labsynch.labseer.dto.ExperimentCodeDTO;
import java.util.Collection;

privileged aspect AnalysisGroupCodeDTO_Roo_JavaBean {
    
    public String AnalysisGroupCodeDTO.getAnalysisGroupCode() {
        return this.analysisGroupCode;
    }
    
    public void AnalysisGroupCodeDTO.setAnalysisGroupCode(String analysisGroupCode) {
        this.analysisGroupCode = analysisGroupCode;
    }
    
    public Collection<ExperimentCodeDTO> AnalysisGroupCodeDTO.getExperimentCodes() {
        return this.experimentCodes;
    }
    
    public void AnalysisGroupCodeDTO.setExperimentCodes(Collection<ExperimentCodeDTO> experimentCodes) {
        this.experimentCodes = experimentCodes;
    }
    
}
