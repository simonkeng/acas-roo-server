// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.BulkLoadTemplate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect BulkLoadTemplate_Roo_Jpa_Entity {
    
    declare @type: BulkLoadTemplate: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long BulkLoadTemplate.id;
    
    @Version
    @Column(name = "version")
    private Integer BulkLoadTemplate.version;
    
    public Long BulkLoadTemplate.getId() {
        return this.id;
    }
    
    public void BulkLoadTemplate.setId(Long id) {
        this.id = id;
    }
    
    public Integer BulkLoadTemplate.getVersion() {
        return this.version;
    }
    
    public void BulkLoadTemplate.setVersion(Integer version) {
        this.version = version;
    }
    
}
