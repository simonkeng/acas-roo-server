// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StateKind;
import com.labsynch.labseer.domain.StateType;

privileged aspect StateKind_Roo_JavaBean {
    
    public StateType StateKind.getLsType() {
        return this.lsType;
    }
    
    public void StateKind.setLsType(StateType lsType) {
        this.lsType = lsType;
    }
    
    public String StateKind.getKindName() {
        return this.kindName;
    }
    
    public void StateKind.setKindName(String kindName) {
        this.kindName = kindName;
    }
    
    public String StateKind.getLsTypeAndKind() {
        return this.lsTypeAndKind;
    }
    
    public void StateKind.setLsTypeAndKind(String lsTypeAndKind) {
        this.lsTypeAndKind = lsTypeAndKind;
    }
    
}
