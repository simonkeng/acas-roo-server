package com.labsynch.labseer.domain;

import javax.persistence.Entity;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;

@Entity
@RooJavaBean

@RooJpaActiveRecord(sequenceName = "LSSEQ_CONTAINER_PKSEQ" )
public class LsSeqContainer {
	
	
}