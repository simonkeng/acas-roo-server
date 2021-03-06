// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.CodeKind;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CodeKind_Roo_Json {
    
    public String CodeKind.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static CodeKind CodeKind.fromJsonToCodeKind(String json) {
        return new JSONDeserializer<CodeKind>().use(null, CodeKind.class).deserialize(json);
    }
    
    public static String CodeKind.toJsonArray(Collection<CodeKind> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<CodeKind> CodeKind.fromJsonArrayToCodeKinds(String json) {
        return new JSONDeserializer<List<CodeKind>>().use(null, ArrayList.class).use("values", CodeKind.class).deserialize(json);
    }
    
}
