// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.CorpName;

privileged aspect CorpName_Roo_JavaBean {
    
    public String CorpName.getParentCorpName() {
        return this.parentCorpName;
    }
    
    public void CorpName.setParentCorpName(String parentCorpName) {
        this.parentCorpName = parentCorpName;
    }
    
    public String CorpName.getComment() {
        return this.comment;
    }
    
    public void CorpName.setComment(String comment) {
        this.comment = comment;
    }
    
    public Boolean CorpName.getIgnore() {
        return this.ignore;
    }
    
    public void CorpName.setIgnore(Boolean ignore) {
        this.ignore = ignore;
    }
    
}
