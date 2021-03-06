// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ContainerState;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContainerState_Roo_Jpa_ActiveRecord {
    
    public static long ContainerState.countContainerStates() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ContainerState o", Long.class).getSingleResult();
    }
    
    public static List<ContainerState> ContainerState.findAllContainerStates() {
        return entityManager().createQuery("SELECT o FROM ContainerState o", ContainerState.class).getResultList();
    }
    
    public static ContainerState ContainerState.findContainerState(Long id) {
        if (id == null) return null;
        return entityManager().find(ContainerState.class, id);
    }
    
    public static List<ContainerState> ContainerState.findContainerStateEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ContainerState o", ContainerState.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public ContainerState ContainerState.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ContainerState merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
