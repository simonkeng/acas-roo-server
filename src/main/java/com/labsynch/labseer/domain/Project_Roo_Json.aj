// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Project;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Project_Roo_Json {
    
    public String Project.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Project.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Project Project.fromJsonToProject(String json) {
        return new JSONDeserializer<Project>()
        .use(null, Project.class).deserialize(json);
    }
    
    public static String Project.toJsonArray(Collection<Project> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Project.toJsonArray(Collection<Project> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Project> Project.fromJsonArrayToProjects(String json) {
        return new JSONDeserializer<List<Project>>()
        .use("values", Project.class).deserialize(json);
    }
    
}
