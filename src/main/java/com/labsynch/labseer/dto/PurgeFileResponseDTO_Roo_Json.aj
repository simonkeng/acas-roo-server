// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.PurgeFileResponseDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect PurgeFileResponseDTO_Roo_Json {
    
    public static PurgeFileResponseDTO PurgeFileResponseDTO.fromJsonToPurgeFileResponseDTO(String json) {
        return new JSONDeserializer<PurgeFileResponseDTO>()
        .use(null, PurgeFileResponseDTO.class).deserialize(json);
    }
    
    public static String PurgeFileResponseDTO.toJsonArray(Collection<PurgeFileResponseDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String PurgeFileResponseDTO.toJsonArray(Collection<PurgeFileResponseDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<PurgeFileResponseDTO> PurgeFileResponseDTO.fromJsonArrayToPurgeFileRespoes(String json) {
        return new JSONDeserializer<List<PurgeFileResponseDTO>>()
        .use("values", PurgeFileResponseDTO.class).deserialize(json);
    }
    
}
