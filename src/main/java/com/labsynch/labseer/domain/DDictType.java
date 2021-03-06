package com.labsynch.labseer.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(sequenceName = "DDICT_TYPE_PKSEQ", finders = { "findDDictTypesByNameEquals"})
public class DDictType {

    private static final Logger logger = LoggerFactory.getLogger(DDictType.class);

    @NotNull
    @Column(unique = true)
    @Size(max = 255)
    private String name;

    @Size(max = 512)
    private String description;

    @Size(max = 512)
    private String comments;
    
	@NotNull
	private boolean ignored;

	private Integer displayOrder;

	

}
