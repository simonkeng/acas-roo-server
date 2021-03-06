// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LsInteraction;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LsInteraction_Roo_Jpa_ActiveRecord {
    
    public static long LsInteraction.countLsInteractions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM LsInteraction o", Long.class).getSingleResult();
    }
    
    public static List<LsInteraction> LsInteraction.findAllLsInteractions() {
        return entityManager().createQuery("SELECT o FROM LsInteraction o", LsInteraction.class).getResultList();
    }
    
    public static LsInteraction LsInteraction.findLsInteraction(Long id) {
        if (id == null) return null;
        return entityManager().find(LsInteraction.class, id);
    }
    
    public static List<LsInteraction> LsInteraction.findLsInteractionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM LsInteraction o", LsInteraction.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public LsInteraction LsInteraction.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        LsInteraction merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
