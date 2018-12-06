// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ParentAliasKind;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ParentAliasKind_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ParentAliasKind.entityManager;
    
    public static final List<String> ParentAliasKind.fieldNames4OrderClauseFilter = java.util.Arrays.asList("lsType", "kindName");
    
    public static final EntityManager ParentAliasKind.entityManager() {
        EntityManager em = new ParentAliasKind().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ParentAliasKind.countParentAliasKinds() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ParentAliasKind o", Long.class).getSingleResult();
    }
    
    public static List<ParentAliasKind> ParentAliasKind.findAllParentAliasKinds() {
        return entityManager().createQuery("SELECT o FROM ParentAliasKind o", ParentAliasKind.class).getResultList();
    }
    
    public static List<ParentAliasKind> ParentAliasKind.findAllParentAliasKinds(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ParentAliasKind o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ParentAliasKind.class).getResultList();
    }
    
    public static ParentAliasKind ParentAliasKind.findParentAliasKind(Long id) {
        if (id == null) return null;
        return entityManager().find(ParentAliasKind.class, id);
    }
    
    public static List<ParentAliasKind> ParentAliasKind.findParentAliasKindEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ParentAliasKind o", ParentAliasKind.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ParentAliasKind> ParentAliasKind.findParentAliasKindEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ParentAliasKind o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ParentAliasKind.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ParentAliasKind.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ParentAliasKind.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ParentAliasKind attached = ParentAliasKind.findParentAliasKind(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ParentAliasKind.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ParentAliasKind.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ParentAliasKind ParentAliasKind.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ParentAliasKind merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
