// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.AuthorQueryResultDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect AuthorQueryResultDTO_Roo_Json {
    
    public static AuthorQueryResultDTO AuthorQueryResultDTO.fromJsonToAuthorQueryResultDTO(String json) {
        return new JSONDeserializer<AuthorQueryResultDTO>().use(null, AuthorQueryResultDTO.class).deserialize(json);
    }
    
    public static String AuthorQueryResultDTO.toJsonArray(Collection<AuthorQueryResultDTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<AuthorQueryResultDTO> AuthorQueryResultDTO.fromJsonArrayToAuthoes(String json) {
        return new JSONDeserializer<List<AuthorQueryResultDTO>>().use(null, ArrayList.class).use("values", AuthorQueryResultDTO.class).deserialize(json);
    }
    
}