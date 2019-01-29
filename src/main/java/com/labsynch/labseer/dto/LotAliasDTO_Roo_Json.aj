// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.LotAliasDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect LotAliasDTO_Roo_Json {
    
    public String LotAliasDTO.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String LotAliasDTO.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static LotAliasDTO LotAliasDTO.fromJsonToLotAliasDTO(String json) {
        return new JSONDeserializer<LotAliasDTO>()
        .use(null, LotAliasDTO.class).deserialize(json);
    }
    
    public static String LotAliasDTO.toJsonArray(Collection<LotAliasDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String LotAliasDTO.toJsonArray(Collection<LotAliasDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<LotAliasDTO> LotAliasDTO.fromJsonArrayToLoes(String json) {
        return new JSONDeserializer<List<LotAliasDTO>>()
        .use("values", LotAliasDTO.class).deserialize(json);
    }
    
}