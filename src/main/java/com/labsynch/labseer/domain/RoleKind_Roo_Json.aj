// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.RoleKind;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect RoleKind_Roo_Json {
    
    public String RoleKind.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static RoleKind RoleKind.fromJsonToRoleKind(String json) {
        return new JSONDeserializer<RoleKind>().use(null, RoleKind.class).deserialize(json);
    }
    
    public static String RoleKind.toJsonArray(Collection<RoleKind> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<RoleKind> RoleKind.fromJsonArrayToRoleKinds(String json) {
        return new JSONDeserializer<List<RoleKind>>().use(null, ArrayList.class).use("values", RoleKind.class).deserialize(json);
    }
    
}
