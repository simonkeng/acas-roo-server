// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.ContainerCodeNameStateDTO;
import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ContainerCodeNameStateDTO_Roo_Json {
    
    public static ContainerCodeNameStateDTO ContainerCodeNameStateDTO.fromJsonToContainerCodeNameStateDTO(String json) {
        return new JSONDeserializer<ContainerCodeNameStateDTO>()
        .use(null, ContainerCodeNameStateDTO.class).deserialize(json);
    }
    
    public static Collection<ContainerCodeNameStateDTO> ContainerCodeNameStateDTO.fromJsonArrayToContainerCoes(String json) {
        return new JSONDeserializer<List<ContainerCodeNameStateDTO>>()
        .use("values", ContainerCodeNameStateDTO.class).deserialize(json);
    }
    
}
