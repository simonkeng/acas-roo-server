// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.InteractionKind;
import com.labsynch.labseer.domain.InteractionType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect InteractionKind_Roo_Finder {
    
    public static TypedQuery<InteractionKind> InteractionKind.findInteractionKindsByKindNameEquals(String kindName) {
        if (kindName == null || kindName.length() == 0) throw new IllegalArgumentException("The kindName argument is required");
        EntityManager em = InteractionKind.entityManager();
        TypedQuery<InteractionKind> q = em.createQuery("SELECT o FROM InteractionKind AS o WHERE o.kindName = :kindName", InteractionKind.class);
        q.setParameter("kindName", kindName);
        return q;
    }
    
    public static TypedQuery<InteractionKind> InteractionKind.findInteractionKindsByKindNameEqualsAndLsType(String kindName, InteractionType lsType) {
        if (kindName == null || kindName.length() == 0) throw new IllegalArgumentException("The kindName argument is required");
        if (lsType == null) throw new IllegalArgumentException("The lsType argument is required");
        EntityManager em = InteractionKind.entityManager();
        TypedQuery<InteractionKind> q = em.createQuery("SELECT o FROM InteractionKind AS o WHERE o.kindName = :kindName  AND o.lsType = :lsType", InteractionKind.class);
        q.setParameter("kindName", kindName);
        q.setParameter("lsType", lsType);
        return q;
    }
    
}
