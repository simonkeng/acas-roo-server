// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ExperimentState;
import com.labsynch.labseer.domain.ExperimentValue;

privileged aspect ExperimentValue_Roo_JavaBean {
    
    public ExperimentState ExperimentValue.getLsState() {
        return this.lsState;
    }
    
    public void ExperimentValue.setLsState(ExperimentState lsState) {
        this.lsState = lsState;
    }
    
}
