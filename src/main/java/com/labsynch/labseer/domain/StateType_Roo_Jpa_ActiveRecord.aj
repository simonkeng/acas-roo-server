// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StateType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StateType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager StateType.entityManager;
    
    public static final EntityManager StateType.entityManager() {
        EntityManager em = new StateType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long StateType.countStateTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM StateType o", Long.class).getSingleResult();
    }
    
    public static List<StateType> StateType.findAllStateTypes() {
        return entityManager().createQuery("SELECT o FROM StateType o", StateType.class).getResultList();
    }
    
    public static StateType StateType.findStateType(Long id) {
        if (id == null) return null;
        return entityManager().find(StateType.class, id);
    }
    
    public static List<StateType> StateType.findStateTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM StateType o", StateType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void StateType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void StateType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            StateType attached = StateType.findStateType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void StateType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void StateType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public StateType StateType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StateType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
