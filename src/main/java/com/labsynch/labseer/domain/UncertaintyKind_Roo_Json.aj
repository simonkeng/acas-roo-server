// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.UncertaintyKind;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect UncertaintyKind_Roo_Json {
    
    public String UncertaintyKind.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static UncertaintyKind UncertaintyKind.fromJsonToUncertaintyKind(String json) {
        return new JSONDeserializer<UncertaintyKind>().use(null, UncertaintyKind.class).deserialize(json);
    }
    
    public static String UncertaintyKind.toJsonArray(Collection<UncertaintyKind> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<UncertaintyKind> UncertaintyKind.fromJsonArrayToUncertaintyKinds(String json) {
        return new JSONDeserializer<List<UncertaintyKind>>().use(null, ArrayList.class).use("values", UncertaintyKind.class).deserialize(json);
    }
    
}
