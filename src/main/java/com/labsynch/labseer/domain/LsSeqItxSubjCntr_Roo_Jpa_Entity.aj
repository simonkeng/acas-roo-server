// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LsSeqItxSubjCntr;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect LsSeqItxSubjCntr_Roo_Jpa_Entity {
    
    @Id
    @SequenceGenerator(name = "lsSeqItxSubjCntrGen", sequenceName = "LSSEQ_ITXSUBJCNTR_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "lsSeqItxSubjCntrGen")
    @Column(name = "id")
    private Long LsSeqItxSubjCntr.id;
    
    @Version
    @Column(name = "version")
    private Integer LsSeqItxSubjCntr.version;
    
    public Long LsSeqItxSubjCntr.getId() {
        return this.id;
    }
    
    public void LsSeqItxSubjCntr.setId(Long id) {
        this.id = id;
    }
    
    public Integer LsSeqItxSubjCntr.getVersion() {
        return this.version;
    }
    
    public void LsSeqItxSubjCntr.setVersion(Integer version) {
        this.version = version;
    }
    
}