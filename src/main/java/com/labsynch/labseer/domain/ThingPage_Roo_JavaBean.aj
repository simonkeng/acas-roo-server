// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AbstractThing;
import com.labsynch.labseer.domain.LsTransaction;
import com.labsynch.labseer.domain.ThingPage;
import java.util.Date;

privileged aspect ThingPage_Roo_JavaBean {
    
    public String ThingPage.getPageName() {
        return this.pageName;
    }
    
    public void ThingPage.setPageName(String pageName) {
        this.pageName = pageName;
    }
    
    public String ThingPage.getRecordedBy() {
        return this.recordedBy;
    }
    
    public void ThingPage.setRecordedBy(String recordedBy) {
        this.recordedBy = recordedBy;
    }
    
    public Date ThingPage.getRecordedDate() {
        return this.recordedDate;
    }
    
    public void ThingPage.setRecordedDate(Date recordedDate) {
        this.recordedDate = recordedDate;
    }
    
    public String ThingPage.getPageContent() {
        return this.pageContent;
    }
    
    public void ThingPage.setPageContent(String pageContent) {
        this.pageContent = pageContent;
    }
    
    public String ThingPage.getModifiedBy() {
        return this.modifiedBy;
    }
    
    public void ThingPage.setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
    public Date ThingPage.getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void ThingPage.setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    
    public String ThingPage.getCurrentEditor() {
        return this.currentEditor;
    }
    
    public void ThingPage.setCurrentEditor(String currentEditor) {
        this.currentEditor = currentEditor;
    }
    
    public boolean ThingPage.isIgnored() {
        return this.ignored;
    }
    
    public void ThingPage.setIgnored(boolean ignored) {
        this.ignored = ignored;
    }
    
    public boolean ThingPage.isArchived() {
        return this.archived;
    }
    
    public void ThingPage.setArchived(boolean archived) {
        this.archived = archived;
    }
    
    public LsTransaction ThingPage.getLsTransaction() {
        return this.lsTransaction;
    }
    
    public void ThingPage.setLsTransaction(LsTransaction lsTransaction) {
        this.lsTransaction = lsTransaction;
    }
    
    public AbstractThing ThingPage.getThing() {
        return this.thing;
    }
    
    public void ThingPage.setThing(AbstractThing thing) {
        this.thing = thing;
    }
    
}
