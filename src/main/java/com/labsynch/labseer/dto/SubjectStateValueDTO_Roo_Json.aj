// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.SubjectStateValueDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect SubjectStateValueDTO_Roo_Json {
    
    public String SubjectStateValueDTO.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static SubjectStateValueDTO SubjectStateValueDTO.fromJsonToSubjectStateValueDTO(String json) {
        return new JSONDeserializer<SubjectStateValueDTO>().use(null, SubjectStateValueDTO.class).deserialize(json);
    }
    
    public static String SubjectStateValueDTO.toJsonArray(Collection<SubjectStateValueDTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<SubjectStateValueDTO> SubjectStateValueDTO.fromJsonArrayToSubjectStateValueDTO(String json) {
        return new JSONDeserializer<List<SubjectStateValueDTO>>().use(null, ArrayList.class).use("values", SubjectStateValueDTO.class).deserialize(json);
    }
    
}
