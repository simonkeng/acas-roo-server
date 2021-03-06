// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ThingPageArchive;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect ThingPageArchive_Roo_Jpa_Entity {
    
    declare @type: ThingPageArchive: @Entity;
    
    @Id
    @SequenceGenerator(name = "thingPageArchiveGen", sequenceName = "THING_PAGE_ARCHIVE_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "thingPageArchiveGen")
    @Column(name = "id")
    private Long ThingPageArchive.id;
    
    @Version
    @Column(name = "version")
    private Integer ThingPageArchive.version;
    
    public Long ThingPageArchive.getId() {
        return this.id;
    }
    
    public void ThingPageArchive.setId(Long id) {
        this.id = id;
    }
    
    public Integer ThingPageArchive.getVersion() {
        return this.version;
    }
    
    public void ThingPageArchive.setVersion(Integer version) {
        this.version = version;
    }
    
}
