// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.BulkLoadFile;
import com.labsynch.labseer.domain.CompoundType;
import com.labsynch.labseer.domain.Parent;
import com.labsynch.labseer.domain.ParentAlias;
import com.labsynch.labseer.domain.ParentAnnotation;
import com.labsynch.labseer.domain.SaltForm;
import com.labsynch.labseer.domain.StereoCategory;
import java.util.Date;
import java.util.Set;

privileged aspect Parent_Roo_JavaBean {
    
    public String Parent.getCorpName() {
        return this.corpName;
    }
    
    public void Parent.setCorpName(String corpName) {
        this.corpName = corpName;
    }
    
    public long Parent.getParentNumber() {
        return this.parentNumber;
    }
    
    public void Parent.setParentNumber(long parentNumber) {
        this.parentNumber = parentNumber;
    }
    
    public String Parent.getChemist() {
        return this.chemist;
    }
    
    public void Parent.setChemist(String chemist) {
        this.chemist = chemist;
    }
    
    public String Parent.getCommonName() {
        return this.commonName;
    }
    
    public void Parent.setCommonName(String commonName) {
        this.commonName = commonName;
    }
    
    public StereoCategory Parent.getStereoCategory() {
        return this.stereoCategory;
    }
    
    public void Parent.setStereoCategory(StereoCategory stereoCategory) {
        this.stereoCategory = stereoCategory;
    }
    
    public String Parent.getStereoComment() {
        return this.stereoComment;
    }
    
    public void Parent.setStereoComment(String stereoComment) {
        this.stereoComment = stereoComment;
    }
    
    public String Parent.getMolStructure() {
        return this.molStructure;
    }
    
    public void Parent.setMolStructure(String molStructure) {
        this.molStructure = molStructure;
    }
    
    public Double Parent.getMolWeight() {
        return this.molWeight;
    }
    
    public void Parent.setMolWeight(Double molWeight) {
        this.molWeight = molWeight;
    }
    
    public Double Parent.getExactMass() {
        return this.exactMass;
    }
    
    public void Parent.setExactMass(Double exactMass) {
        this.exactMass = exactMass;
    }
    
    public String Parent.getMolFormula() {
        return this.molFormula;
    }
    
    public void Parent.setMolFormula(String molFormula) {
        this.molFormula = molFormula;
    }
    
    public int Parent.getCdId() {
        return this.CdId;
    }
    
    public void Parent.setCdId(int CdId) {
        this.CdId = CdId;
    }
    
    public Date Parent.getRegistrationDate() {
        return this.registrationDate;
    }
    
    public void Parent.setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }
    
    public String Parent.getRegisteredBy() {
        return this.registeredBy;
    }
    
    public void Parent.setRegisteredBy(String registeredBy) {
        this.registeredBy = registeredBy;
    }
    
    public Date Parent.getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void Parent.setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    
    public String Parent.getModifiedBy() {
        return this.modifiedBy;
    }
    
    public void Parent.setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
    public Boolean Parent.getIgnore() {
        return this.ignore;
    }
    
    public void Parent.setIgnore(Boolean ignore) {
        this.ignore = ignore;
    }
    
    public Set<SaltForm> Parent.getSaltForms() {
        return this.saltForms;
    }
    
    public void Parent.setSaltForms(Set<SaltForm> saltForms) {
        this.saltForms = saltForms;
    }
    
    public Set<ParentAlias> Parent.getParentAliases() {
        return this.parentAliases;
    }
    
    public void Parent.setParentAliases(Set<ParentAlias> parentAliases) {
        this.parentAliases = parentAliases;
    }
    
    public BulkLoadFile Parent.getBulkLoadFile() {
        return this.bulkLoadFile;
    }
    
    public void Parent.setBulkLoadFile(BulkLoadFile bulkLoadFile) {
        this.bulkLoadFile = bulkLoadFile;
    }
    
    public ParentAnnotation Parent.getParentAnnotation() {
        return this.parentAnnotation;
    }
    
    public void Parent.setParentAnnotation(ParentAnnotation parentAnnotation) {
        this.parentAnnotation = parentAnnotation;
    }
    
    public CompoundType Parent.getCompoundType() {
        return this.compoundType;
    }
    
    public void Parent.setCompoundType(CompoundType compoundType) {
        this.compoundType = compoundType;
    }
    
    public String Parent.getComment() {
        return this.comment;
    }
    
    public void Parent.setComment(String comment) {
        this.comment = comment;
    }
    
    public Boolean Parent.getIsMixture() {
        return this.isMixture;
    }
    
    public void Parent.setIsMixture(Boolean isMixture) {
        this.isMixture = isMixture;
    }
    
}
