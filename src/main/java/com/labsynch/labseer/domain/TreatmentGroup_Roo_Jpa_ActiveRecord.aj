// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.TreatmentGroup;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TreatmentGroup_Roo_Jpa_ActiveRecord {
    
    public static long TreatmentGroup.countTreatmentGroups() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TreatmentGroup o", Long.class).getSingleResult();
    }
    
    public static List<TreatmentGroup> TreatmentGroup.findAllTreatmentGroups() {
        return entityManager().createQuery("SELECT o FROM TreatmentGroup o", TreatmentGroup.class).getResultList();
    }
    
    public static TreatmentGroup TreatmentGroup.findTreatmentGroup(Long id) {
        if (id == null) return null;
        return entityManager().find(TreatmentGroup.class, id);
    }
    
    public static List<TreatmentGroup> TreatmentGroup.findTreatmentGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TreatmentGroup o", TreatmentGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public TreatmentGroup TreatmentGroup.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TreatmentGroup merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
