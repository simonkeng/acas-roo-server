// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LotAlias;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect LotAlias_Roo_Jpa_Entity {
    
    declare @type: LotAlias: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long LotAlias.id;
    
    @Version
    @Column(name = "version")
    private Integer LotAlias.version;
    
    public Long LotAlias.getId() {
        return this.id;
    }
    
    public void LotAlias.setId(Long id) {
        this.id = id;
    }
    
    public Integer LotAlias.getVersion() {
        return this.version;
    }
    
    public void LotAlias.setVersion(Integer version) {
        this.version = version;
    }
    
}