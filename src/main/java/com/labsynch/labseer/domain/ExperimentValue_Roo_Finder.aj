// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ExperimentState;
import com.labsynch.labseer.domain.ExperimentValue;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ExperimentValue_Roo_Finder {
    
    public static TypedQuery<ExperimentValue> ExperimentValue.findExperimentValuesByLsKindEqualsAndCodeValueLike(String lsKind, String codeValue) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (codeValue == null || codeValue.length() == 0) throw new IllegalArgumentException("The codeValue argument is required");
        codeValue = codeValue.replace('*', '%');
        if (codeValue.charAt(0) != '%') {
            codeValue = "%" + codeValue;
        }
        if (codeValue.charAt(codeValue.length() - 1) != '%') {
            codeValue = codeValue + "%";
        }
        EntityManager em = ExperimentValue.entityManager();
        TypedQuery<ExperimentValue> q = em.createQuery("SELECT o FROM ExperimentValue AS o WHERE o.lsKind = :lsKind  AND LOWER(o.codeValue) LIKE LOWER(:codeValue)", ExperimentValue.class);
        q.setParameter("lsKind", lsKind);
        q.setParameter("codeValue", codeValue);
        return q;
    }
    
    public static TypedQuery<ExperimentValue> ExperimentValue.findExperimentValuesByLsKindEqualsAndDateValueLike(String lsKind, Date dateValue) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (dateValue == null) throw new IllegalArgumentException("The dateValue argument is required");
        EntityManager em = ExperimentValue.entityManager();
        TypedQuery<ExperimentValue> q = em.createQuery("SELECT o FROM ExperimentValue AS o WHERE o.lsKind = :lsKind  AND LOWER(o.dateValue) LIKE LOWER(:dateValue)", ExperimentValue.class);
        q.setParameter("lsKind", lsKind);
        q.setParameter("dateValue", dateValue);
        return q;
    }
    
    public static TypedQuery<ExperimentValue> ExperimentValue.findExperimentValuesByLsKindEqualsAndStringValueLike(String lsKind, String stringValue) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (stringValue == null || stringValue.length() == 0) throw new IllegalArgumentException("The stringValue argument is required");
        stringValue = stringValue.replace('*', '%');
        if (stringValue.charAt(0) != '%') {
            stringValue = "%" + stringValue;
        }
        if (stringValue.charAt(stringValue.length() - 1) != '%') {
            stringValue = stringValue + "%";
        }
        EntityManager em = ExperimentValue.entityManager();
        TypedQuery<ExperimentValue> q = em.createQuery("SELECT o FROM ExperimentValue AS o WHERE o.lsKind = :lsKind  AND LOWER(o.stringValue) LIKE LOWER(:stringValue)", ExperimentValue.class);
        q.setParameter("lsKind", lsKind);
        q.setParameter("stringValue", stringValue);
        return q;
    }
    
    public static TypedQuery<ExperimentValue> ExperimentValue.findExperimentValuesByLsState(ExperimentState lsState) {
        if (lsState == null) throw new IllegalArgumentException("The lsState argument is required");
        EntityManager em = ExperimentValue.entityManager();
        TypedQuery<ExperimentValue> q = em.createQuery("SELECT o FROM ExperimentValue AS o WHERE o.lsState = :lsState", ExperimentValue.class);
        q.setParameter("lsState", lsState);
        return q;
    }
    
    public static TypedQuery<ExperimentValue> ExperimentValue.findExperimentValuesByLsStateAndIgnoredNotAndLsKindEqualsAndLsTypeEqualsAndStringValueEquals(ExperimentState lsState, boolean ignored, String lsKind, String lsType, String stringValue) {
        if (lsState == null) throw new IllegalArgumentException("The lsState argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (stringValue == null || stringValue.length() == 0) throw new IllegalArgumentException("The stringValue argument is required");
        EntityManager em = ExperimentValue.entityManager();
        TypedQuery<ExperimentValue> q = em.createQuery("SELECT o FROM ExperimentValue AS o WHERE o.lsState = :lsState AND o.ignored IS NOT :ignored  AND o.lsKind = :lsKind  AND o.lsType = :lsType  AND o.stringValue = :stringValue", ExperimentValue.class);
        q.setParameter("lsState", lsState);
        q.setParameter("ignored", ignored);
        q.setParameter("lsKind", lsKind);
        q.setParameter("lsType", lsType);
        q.setParameter("stringValue", stringValue);
        return q;
    }
    
}
