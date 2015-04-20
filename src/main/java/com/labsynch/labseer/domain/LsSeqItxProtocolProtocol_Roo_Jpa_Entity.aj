// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LsSeqItxProtocolProtocol;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect LsSeqItxProtocolProtocol_Roo_Jpa_Entity {
    
    declare @type: LsSeqItxProtocolProtocol: @Entity;
    
    @Id
    @SequenceGenerator(name = "lsSeqItxProtocolProtocolGen", sequenceName = "LSSEQ_ITXPROTPROT_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "lsSeqItxProtocolProtocolGen")
    @Column(name = "id")
    private Long LsSeqItxProtocolProtocol.id;
    
    @Version
    @Column(name = "version")
    private Integer LsSeqItxProtocolProtocol.version;
    
    public Long LsSeqItxProtocolProtocol.getId() {
        return this.id;
    }
    
    public void LsSeqItxProtocolProtocol.setId(Long id) {
        this.id = id;
    }
    
    public Integer LsSeqItxProtocolProtocol.getVersion() {
        return this.version;
    }
    
    public void LsSeqItxProtocolProtocol.setVersion(Integer version) {
        this.version = version;
    }
    
}
