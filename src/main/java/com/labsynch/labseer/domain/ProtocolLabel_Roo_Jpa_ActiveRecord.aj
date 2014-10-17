// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ProtocolLabel;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProtocolLabel_Roo_Jpa_ActiveRecord {
    
    public static long ProtocolLabel.countProtocolLabels() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ProtocolLabel o", Long.class).getSingleResult();
    }
    
    public static List<ProtocolLabel> ProtocolLabel.findAllProtocolLabels() {
        return entityManager().createQuery("SELECT o FROM ProtocolLabel o", ProtocolLabel.class).getResultList();
    }
    
    public static List<ProtocolLabel> ProtocolLabel.findProtocolLabelEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ProtocolLabel o", ProtocolLabel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public ProtocolLabel ProtocolLabel.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ProtocolLabel merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
