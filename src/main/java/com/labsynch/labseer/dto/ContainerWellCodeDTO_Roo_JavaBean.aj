// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.ContainerWellCodeDTO;
import java.util.List;

privileged aspect ContainerWellCodeDTO_Roo_JavaBean {
    
    public String ContainerWellCodeDTO.getRequestCodeName() {
        return this.requestCodeName;
    }
    
    public void ContainerWellCodeDTO.setRequestCodeName(String requestCodeName) {
        this.requestCodeName = requestCodeName;
    }
    
    public List<String> ContainerWellCodeDTO.getWellCodeNames() {
        return this.wellCodeNames;
    }
    
    public void ContainerWellCodeDTO.setWellCodeNames(List<String> wellCodeNames) {
        this.wellCodeNames = wellCodeNames;
    }
    
}
