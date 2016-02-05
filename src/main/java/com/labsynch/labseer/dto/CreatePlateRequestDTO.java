package com.labsynch.labseer.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooJson
public class CreatePlateRequestDTO {

	private String barcode;
	
	private String definition;
	
	private String template;
	
	private String supplier;
	
	private String recordedBy;
	
	private Collection<WellContentDTO> wells = new ArrayList<WellContentDTO>();
	
	public String toJson() {
        return new JSONSerializer().include("wells").exclude("*.class").serialize(this);
    }
	
}
