// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.BulkTransferPart1DTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect BulkTransferPart1DTO_Roo_Json {
    
    public String BulkTransferPart1DTO.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static BulkTransferPart1DTO BulkTransferPart1DTO.fromJsonToBulkTransferPart1DTO(String json) {
        return new JSONDeserializer<BulkTransferPart1DTO>().use(null, BulkTransferPart1DTO.class).deserialize(json);
    }
    
    public static String BulkTransferPart1DTO.toJsonArray(Collection<BulkTransferPart1DTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<BulkTransferPart1DTO> BulkTransferPart1DTO.fromJsonArrayToBulkTransferPart1DTO(String json) {
        return new JSONDeserializer<List<BulkTransferPart1DTO>>().use(null, ArrayList.class).use("values", BulkTransferPart1DTO.class).deserialize(json);
    }
    
}
