// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.ContainerLocationTreeDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ContainerLocationTreeDTO_Roo_Json {
    
    public String ContainerLocationTreeDTO.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static ContainerLocationTreeDTO ContainerLocationTreeDTO.fromJsonToContainerLocationTreeDTO(String json) {
        return new JSONDeserializer<ContainerLocationTreeDTO>().use(null, ContainerLocationTreeDTO.class).deserialize(json);
    }
    
    public static String ContainerLocationTreeDTO.toJsonArray(Collection<ContainerLocationTreeDTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<ContainerLocationTreeDTO> ContainerLocationTreeDTO.fromJsonArrayToContainerLocatioes(String json) {
        return new JSONDeserializer<List<ContainerLocationTreeDTO>>().use(null, ArrayList.class).use("values", ContainerLocationTreeDTO.class).deserialize(json);
    }
    
}
