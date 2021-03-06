// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AnalysisGroupState;
import com.labsynch.labseer.domain.AnalysisGroupValue;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect AnalysisGroupValue_Roo_Finder {
    
    public static TypedQuery<AnalysisGroupValue> AnalysisGroupValue.findAnalysisGroupValuesByCodeValueEquals(String codeValue) {
        if (codeValue == null || codeValue.length() == 0) throw new IllegalArgumentException("The codeValue argument is required");
        EntityManager em = AnalysisGroupValue.entityManager();
        TypedQuery<AnalysisGroupValue> q = em.createQuery("SELECT o FROM AnalysisGroupValue AS o WHERE o.codeValue = :codeValue", AnalysisGroupValue.class);
        q.setParameter("codeValue", codeValue);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupValue> AnalysisGroupValue.findAnalysisGroupValuesByIgnoredNotAndCodeValueEquals(boolean ignored, String codeValue) {
        if (codeValue == null || codeValue.length() == 0) throw new IllegalArgumentException("The codeValue argument is required");
        EntityManager em = AnalysisGroupValue.entityManager();
        TypedQuery<AnalysisGroupValue> q = em.createQuery("SELECT o FROM AnalysisGroupValue AS o WHERE o.ignored IS NOT :ignored  AND o.codeValue = :codeValue", AnalysisGroupValue.class);
        q.setParameter("ignored", ignored);
        q.setParameter("codeValue", codeValue);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupValue> AnalysisGroupValue.findAnalysisGroupValuesByLsState(AnalysisGroupState lsState) {
        if (lsState == null) throw new IllegalArgumentException("The lsState argument is required");
        EntityManager em = AnalysisGroupValue.entityManager();
        TypedQuery<AnalysisGroupValue> q = em.createQuery("SELECT o FROM AnalysisGroupValue AS o WHERE o.lsState = :lsState", AnalysisGroupValue.class);
        q.setParameter("lsState", lsState);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupValue> AnalysisGroupValue.findAnalysisGroupValuesByLsTransactionEquals(Long lsTransaction) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = AnalysisGroupValue.entityManager();
        TypedQuery<AnalysisGroupValue> q = em.createQuery("SELECT o FROM AnalysisGroupValue AS o WHERE o.lsTransaction = :lsTransaction", AnalysisGroupValue.class);
        q.setParameter("lsTransaction", lsTransaction);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupValue> AnalysisGroupValue.findAnalysisGroupValuesByLsTypeEqualsAndLsKindEquals(String lsType, String lsKind) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = AnalysisGroupValue.entityManager();
        TypedQuery<AnalysisGroupValue> q = em.createQuery("SELECT o FROM AnalysisGroupValue AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind", AnalysisGroupValue.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupValue> AnalysisGroupValue.findAnalysisGroupValuesByLsTypeEqualsAndLsKindEqualsAndStringValueLikeAndIgnoredNot(String lsType, String lsKind, String stringValue, boolean ignored) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (stringValue == null || stringValue.length() == 0) throw new IllegalArgumentException("The stringValue argument is required");
        stringValue = stringValue.replace('*', '%');
        if (stringValue.charAt(0) != '%') {
            stringValue = "%" + stringValue;
        }
        if (stringValue.charAt(stringValue.length() - 1) != '%') {
            stringValue = stringValue + "%";
        }
        EntityManager em = AnalysisGroupValue.entityManager();
        TypedQuery<AnalysisGroupValue> q = em.createQuery("SELECT o FROM AnalysisGroupValue AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind  AND LOWER(o.stringValue) LIKE LOWER(:stringValue)  AND o.ignored IS NOT :ignored", AnalysisGroupValue.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("stringValue", stringValue);
        q.setParameter("ignored", ignored);
        return q;
    }
    
}
