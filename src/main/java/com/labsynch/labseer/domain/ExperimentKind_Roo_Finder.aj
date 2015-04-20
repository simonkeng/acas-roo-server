// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ExperimentKind;
import com.labsynch.labseer.domain.ExperimentType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ExperimentKind_Roo_Finder {
    
    public static TypedQuery<ExperimentKind> ExperimentKind.findExperimentKindsByLsTypeEqualsAndKindNameEquals(ExperimentType lsType, String kindName) {
        if (lsType == null) throw new IllegalArgumentException("The lsType argument is required");
        if (kindName == null || kindName.length() == 0) throw new IllegalArgumentException("The kindName argument is required");
        EntityManager em = ExperimentKind.entityManager();
        TypedQuery<ExperimentKind> q = em.createQuery("SELECT o FROM ExperimentKind AS o WHERE o.lsType = :lsType  AND o.kindName = :kindName", ExperimentKind.class);
        q.setParameter("lsType", lsType);
        q.setParameter("kindName", kindName);
        return q;
    }
    
}
