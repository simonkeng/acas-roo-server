// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Container;
import com.labsynch.labseer.domain.ContainerState;
import com.labsynch.labseer.domain.ContainerValue;
import java.util.Set;

privileged aspect ContainerState_Roo_JavaBean {
    
    public Container ContainerState.getContainer() {
        return this.container;
    }
    
    public void ContainerState.setContainer(Container container) {
        this.container = container;
    }
    
    public Set<ContainerValue> ContainerState.getLsValues() {
        return this.lsValues;
    }
    
    public void ContainerState.setLsValues(Set<ContainerValue> lsValues) {
        this.lsValues = lsValues;
    }
    
}
