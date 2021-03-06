// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AnalysisGroup;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AnalysisGroup_Roo_Jpa_ActiveRecord {
    
    public static long AnalysisGroup.countAnalysisGroups() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AnalysisGroup o", Long.class).getSingleResult();
    }
    
    public static List<AnalysisGroup> AnalysisGroup.findAllAnalysisGroups() {
        return entityManager().createQuery("SELECT o FROM AnalysisGroup o", AnalysisGroup.class).getResultList();
    }
    
    public static AnalysisGroup AnalysisGroup.findAnalysisGroup(Long id) {
        if (id == null) return null;
        return entityManager().find(AnalysisGroup.class, id);
    }
    
    public static List<AnalysisGroup> AnalysisGroup.findAnalysisGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AnalysisGroup o", AnalysisGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public AnalysisGroup AnalysisGroup.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AnalysisGroup merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
