// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.domain.ContainerState;
import com.labsynch.labseer.dto.ContainerCodeNameStateDTO;

privileged aspect ContainerCodeNameStateDTO_Roo_JavaBean {
    
    public String ContainerCodeNameStateDTO.getContainerCodeName() {
        return this.containerCodeName;
    }
    
    public void ContainerCodeNameStateDTO.setContainerCodeName(String containerCodeName) {
        this.containerCodeName = containerCodeName;
    }
    
    public ContainerState ContainerCodeNameStateDTO.getLsState() {
        return this.lsState;
    }
    
    public void ContainerCodeNameStateDTO.setLsState(ContainerState lsState) {
        this.lsState = lsState;
    }
    
}
