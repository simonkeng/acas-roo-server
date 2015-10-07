// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.LsThingValidationDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect LsThingValidationDTO_Roo_Json {
    
    public String LsThingValidationDTO.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static LsThingValidationDTO LsThingValidationDTO.fromJsonToLsThingValidationDTO(String json) {
        return new JSONDeserializer<LsThingValidationDTO>().use(null, LsThingValidationDTO.class).deserialize(json);
    }
    
    public static String LsThingValidationDTO.toJsonArray(Collection<LsThingValidationDTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<LsThingValidationDTO> LsThingValidationDTO.fromJsonArrayToLsThingValidatioes(String json) {
        return new JSONDeserializer<List<LsThingValidationDTO>>().use(null, ArrayList.class).use("values", LsThingValidationDTO.class).deserialize(json);
    }
    
}
