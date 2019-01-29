// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.PurgeFileDependencyCheckResponseDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect PurgeFileDependencyCheckResponseDTO_Roo_Json {
    
    public static PurgeFileDependencyCheckResponseDTO PurgeFileDependencyCheckResponseDTO.fromJsonToPurgeFileDependencyCheckResponseDTO(String json) {
        return new JSONDeserializer<PurgeFileDependencyCheckResponseDTO>()
        .use(null, PurgeFileDependencyCheckResponseDTO.class).deserialize(json);
    }
    
    public static String PurgeFileDependencyCheckResponseDTO.toJsonArray(Collection<PurgeFileDependencyCheckResponseDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String PurgeFileDependencyCheckResponseDTO.toJsonArray(Collection<PurgeFileDependencyCheckResponseDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<PurgeFileDependencyCheckResponseDTO> PurgeFileDependencyCheckResponseDTO.fromJsonArrayToPurgeFileDependencyCheckRespoes(String json) {
        return new JSONDeserializer<List<PurgeFileDependencyCheckResponseDTO>>()
        .use("values", PurgeFileDependencyCheckResponseDTO.class).deserialize(json);
    }
    
}