// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ValueKind;
import com.labsynch.labseer.domain.ValueType;

privileged aspect ValueKind_Roo_JavaBean {
    
    public ValueType ValueKind.getLsType() {
        return this.lsType;
    }
    
    public void ValueKind.setLsType(ValueType lsType) {
        this.lsType = lsType;
    }
    
    public String ValueKind.getKindName() {
        return this.kindName;
    }
    
    public void ValueKind.setKindName(String kindName) {
        this.kindName = kindName;
    }
    
    public String ValueKind.getLsTypeAndKind() {
        return this.lsTypeAndKind;
    }
    
    public void ValueKind.setLsTypeAndKind(String lsTypeAndKind) {
        this.lsTypeAndKind = lsTypeAndKind;
    }
    
}
