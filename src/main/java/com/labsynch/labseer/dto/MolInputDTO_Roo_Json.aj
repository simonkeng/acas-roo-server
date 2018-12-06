// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.MolInputDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect MolInputDTO_Roo_Json {
    
    public String MolInputDTO.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String MolInputDTO.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static MolInputDTO MolInputDTO.fromJsonToMolInputDTO(String json) {
        return new JSONDeserializer<MolInputDTO>()
        .use(null, MolInputDTO.class).deserialize(json);
    }
    
    public static String MolInputDTO.toJsonArray(Collection<MolInputDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String MolInputDTO.toJsonArray(Collection<MolInputDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<MolInputDTO> MolInputDTO.fromJsonArrayToMoes(String json) {
        return new JSONDeserializer<List<MolInputDTO>>()
        .use("values", MolInputDTO.class).deserialize(json);
    }
    
}
