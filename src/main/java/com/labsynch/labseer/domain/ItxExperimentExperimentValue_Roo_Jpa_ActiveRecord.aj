// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxExperimentExperimentValue;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ItxExperimentExperimentValue_Roo_Jpa_ActiveRecord {
    
    public static long ItxExperimentExperimentValue.countItxExperimentExperimentValues() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ItxExperimentExperimentValue o", Long.class).getSingleResult();
    }
    
    public static List<ItxExperimentExperimentValue> ItxExperimentExperimentValue.findAllItxExperimentExperimentValues() {
        return entityManager().createQuery("SELECT o FROM ItxExperimentExperimentValue o", ItxExperimentExperimentValue.class).getResultList();
    }
    
    public static ItxExperimentExperimentValue ItxExperimentExperimentValue.findItxExperimentExperimentValue(Long id) {
        if (id == null) return null;
        return entityManager().find(ItxExperimentExperimentValue.class, id);
    }
    
    public static List<ItxExperimentExperimentValue> ItxExperimentExperimentValue.findItxExperimentExperimentValueEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ItxExperimentExperimentValue o", ItxExperimentExperimentValue.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public ItxExperimentExperimentValue ItxExperimentExperimentValue.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ItxExperimentExperimentValue merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
