// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.QcCompound;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect QcCompound_Roo_Jpa_Entity {
    
    declare @type: QcCompound: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long QcCompound.id;
    
    @Version
    @Column(name = "version")
    private Integer QcCompound.version;
    
    public Long QcCompound.getId() {
        return this.id;
    }
    
    public void QcCompound.setId(Long id) {
        this.id = id;
    }
    
    public Integer QcCompound.getVersion() {
        return this.version;
    }
    
    public void QcCompound.setVersion(Integer version) {
        this.version = version;
    }
    
}
