// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ChemStructure;
import java.util.Date;

privileged aspect ChemStructure_Roo_JavaBean {
    
    public String ChemStructure.getCodeName() {
        return this.codeName;
    }
    
    public void ChemStructure.setCodeName(String codeName) {
        this.codeName = codeName;
    }
    
    public String ChemStructure.getMolStructure() {
        return this.molStructure;
    }
    
    public void ChemStructure.setMolStructure(String molStructure) {
        this.molStructure = molStructure;
    }
    
    public String ChemStructure.getSmiles() {
        return this.smiles;
    }
    
    public void ChemStructure.setSmiles(String smiles) {
        this.smiles = smiles;
    }
    
    public String ChemStructure.getLsType() {
        return this.lsType;
    }
    
    public void ChemStructure.setLsType(String lsType) {
        this.lsType = lsType;
    }
    
    public String ChemStructure.getLsKind() {
        return this.lsKind;
    }
    
    public void ChemStructure.setLsKind(String lsKind) {
        this.lsKind = lsKind;
    }
    
    public String ChemStructure.getLsTypeAndKind() {
        return this.lsTypeAndKind;
    }
    
    public void ChemStructure.setLsTypeAndKind(String lsTypeAndKind) {
        this.lsTypeAndKind = lsTypeAndKind;
    }
    
    public boolean ChemStructure.isIgnored() {
        return this.ignored;
    }
    
    public void ChemStructure.setIgnored(boolean ignored) {
        this.ignored = ignored;
    }
    
    public boolean ChemStructure.isDeleted() {
        return this.deleted;
    }
    
    public void ChemStructure.setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
    
    public String ChemStructure.getRecordedBy() {
        return this.recordedBy;
    }
    
    public void ChemStructure.setRecordedBy(String recordedBy) {
        this.recordedBy = recordedBy;
    }
    
    public Date ChemStructure.getRecordedDate() {
        return this.recordedDate;
    }
    
    public void ChemStructure.setRecordedDate(Date recordedDate) {
        this.recordedDate = recordedDate;
    }
    
    public String ChemStructure.getModifiedBy() {
        return this.modifiedBy;
    }
    
    public void ChemStructure.setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
    public Date ChemStructure.getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void ChemStructure.setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    
    public Long ChemStructure.getLsTransaction() {
        return this.lsTransaction;
    }
    
    public void ChemStructure.setLsTransaction(Long lsTransaction) {
        this.lsTransaction = lsTransaction;
    }
    
}