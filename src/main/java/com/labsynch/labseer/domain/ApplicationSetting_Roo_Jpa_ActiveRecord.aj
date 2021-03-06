// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ApplicationSetting;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationSetting_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ApplicationSetting.entityManager;
    
    public static final EntityManager ApplicationSetting.entityManager() {
        EntityManager em = new ApplicationSetting().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ApplicationSetting.countApplicationSettings() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ApplicationSetting o", Long.class).getSingleResult();
    }
    
    public static List<ApplicationSetting> ApplicationSetting.findAllApplicationSettings() {
        return entityManager().createQuery("SELECT o FROM ApplicationSetting o", ApplicationSetting.class).getResultList();
    }
    
    public static ApplicationSetting ApplicationSetting.findApplicationSetting(Long id) {
        if (id == null) return null;
        return entityManager().find(ApplicationSetting.class, id);
    }
    
    public static List<ApplicationSetting> ApplicationSetting.findApplicationSettingEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ApplicationSetting o", ApplicationSetting.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ApplicationSetting.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ApplicationSetting.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ApplicationSetting attached = ApplicationSetting.findApplicationSetting(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ApplicationSetting.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ApplicationSetting.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ApplicationSetting ApplicationSetting.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ApplicationSetting merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
