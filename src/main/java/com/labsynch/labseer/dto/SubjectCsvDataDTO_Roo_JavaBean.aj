// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.SubjectCsvDataDTO;
import java.util.List;

privileged aspect SubjectCsvDataDTO_Roo_JavaBean {
    
    public List<Long> SubjectCsvDataDTO.getTreatmentGroupIds() {
        return this.treatmentGroupIds;
    }
    
    public void SubjectCsvDataDTO.setTreatmentGroupIds(List<Long> treatmentGroupIds) {
        this.treatmentGroupIds = treatmentGroupIds;
    }
    
    public String SubjectCsvDataDTO.getSubjectCsvFilePath() {
        return this.subjectCsvFilePath;
    }
    
    public void SubjectCsvDataDTO.setSubjectCsvFilePath(String subjectCsvFilePath) {
        this.subjectCsvFilePath = subjectCsvFilePath;
    }
    
}
