// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.CodeKind;
import com.labsynch.labseer.domain.CodeType;

privileged aspect CodeKind_Roo_JavaBean {
    
    public CodeType CodeKind.getLsType() {
        return this.lsType;
    }
    
    public void CodeKind.setLsType(CodeType lsType) {
        this.lsType = lsType;
    }
    
    public String CodeKind.getKindName() {
        return this.kindName;
    }
    
    public void CodeKind.setKindName(String kindName) {
        this.kindName = kindName;
    }
    
    public String CodeKind.getLsTypeAndKind() {
        return this.lsTypeAndKind;
    }
    
    public void CodeKind.setLsTypeAndKind(String lsTypeAndKind) {
        this.lsTypeAndKind = lsTypeAndKind;
    }
    
}
