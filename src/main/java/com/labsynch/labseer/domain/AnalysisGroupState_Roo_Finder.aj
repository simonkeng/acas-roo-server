// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupState;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect AnalysisGroupState_Roo_Finder {
    
    public static TypedQuery<AnalysisGroupState> AnalysisGroupState.findAnalysisGroupStatesByAnalysisGroup(AnalysisGroup analysisGroup) {
        if (analysisGroup == null) throw new IllegalArgumentException("The analysisGroup argument is required");
        EntityManager em = AnalysisGroupState.entityManager();
        TypedQuery<AnalysisGroupState> q = em.createQuery("SELECT o FROM AnalysisGroupState AS o WHERE o.analysisGroup = :analysisGroup", AnalysisGroupState.class);
        q.setParameter("analysisGroup", analysisGroup);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupState> AnalysisGroupState.findAnalysisGroupStatesByLsTransactionEquals(Long lsTransaction) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = AnalysisGroupState.entityManager();
        TypedQuery<AnalysisGroupState> q = em.createQuery("SELECT o FROM AnalysisGroupState AS o WHERE o.lsTransaction = :lsTransaction", AnalysisGroupState.class);
        q.setParameter("lsTransaction", lsTransaction);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupState> AnalysisGroupState.findAnalysisGroupStatesByLsTypeAndKindEquals(String lsTypeAndKind) {
        if (lsTypeAndKind == null || lsTypeAndKind.length() == 0) throw new IllegalArgumentException("The lsTypeAndKind argument is required");
        EntityManager em = AnalysisGroupState.entityManager();
        TypedQuery<AnalysisGroupState> q = em.createQuery("SELECT o FROM AnalysisGroupState AS o WHERE o.lsTypeAndKind = :lsTypeAndKind", AnalysisGroupState.class);
        q.setParameter("lsTypeAndKind", lsTypeAndKind);
        return q;
    }
    
    public static TypedQuery<AnalysisGroupState> AnalysisGroupState.findAnalysisGroupStatesByLsTypeEqualsAndLsKindEquals(String lsType, String lsKind) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = AnalysisGroupState.entityManager();
        TypedQuery<AnalysisGroupState> q = em.createQuery("SELECT o FROM AnalysisGroupState AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind", AnalysisGroupState.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
}
