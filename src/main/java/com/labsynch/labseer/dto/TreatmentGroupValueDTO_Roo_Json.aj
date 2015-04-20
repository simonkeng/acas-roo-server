// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.TreatmentGroupValueDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect TreatmentGroupValueDTO_Roo_Json {
    
    public String TreatmentGroupValueDTO.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static TreatmentGroupValueDTO TreatmentGroupValueDTO.fromJsonToTreatmentGroupValueDTO(String json) {
        return new JSONDeserializer<TreatmentGroupValueDTO>().use(null, TreatmentGroupValueDTO.class).deserialize(json);
    }
    
    public static String TreatmentGroupValueDTO.toJsonArray(Collection<TreatmentGroupValueDTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<TreatmentGroupValueDTO> TreatmentGroupValueDTO.fromJsonArrayToTreatmentGroes(String json) {
        return new JSONDeserializer<List<TreatmentGroupValueDTO>>().use(null, ArrayList.class).use("values", TreatmentGroupValueDTO.class).deserialize(json);
    }
    
}
