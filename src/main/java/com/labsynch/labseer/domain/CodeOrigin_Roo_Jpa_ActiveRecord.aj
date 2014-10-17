// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.CodeOrigin;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CodeOrigin_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CodeOrigin.entityManager;
    
    public static final EntityManager CodeOrigin.entityManager() {
        EntityManager em = new CodeOrigin().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CodeOrigin.countCodeOrigins() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CodeOrigin o", Long.class).getSingleResult();
    }
    
    public static List<CodeOrigin> CodeOrigin.findAllCodeOrigins() {
        return entityManager().createQuery("SELECT o FROM CodeOrigin o", CodeOrigin.class).getResultList();
    }
    
    public static CodeOrigin CodeOrigin.findCodeOrigin(Long id) {
        if (id == null) return null;
        return entityManager().find(CodeOrigin.class, id);
    }
    
    public static List<CodeOrigin> CodeOrigin.findCodeOriginEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CodeOrigin o", CodeOrigin.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CodeOrigin.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CodeOrigin.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CodeOrigin attached = CodeOrigin.findCodeOrigin(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CodeOrigin.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CodeOrigin.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CodeOrigin CodeOrigin.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CodeOrigin merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}