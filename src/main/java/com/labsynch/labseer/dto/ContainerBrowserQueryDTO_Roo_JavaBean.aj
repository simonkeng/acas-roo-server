// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.ContainerBrowserQueryDTO;
import com.labsynch.labseer.dto.ContainerQueryDTO;

privileged aspect ContainerBrowserQueryDTO_Roo_JavaBean {
    
    public String ContainerBrowserQueryDTO.getQueryString() {
        return this.queryString;
    }
    
    public void ContainerBrowserQueryDTO.setQueryString(String queryString) {
        this.queryString = queryString;
    }
    
    public ContainerQueryDTO ContainerBrowserQueryDTO.getQueryDTO() {
        return this.queryDTO;
    }
    
    public void ContainerBrowserQueryDTO.setQueryDTO(ContainerQueryDTO queryDTO) {
        this.queryDTO = queryDTO;
    }
    
}
