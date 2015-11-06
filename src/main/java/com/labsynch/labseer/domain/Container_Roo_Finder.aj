// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Container;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Container_Roo_Finder {
    
    public static TypedQuery<Container> Container.findContainersByLsTypeEqualsAndLsKindEquals(String lsType, String lsKind) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = Container.entityManager();
        TypedQuery<Container> q = em.createQuery("SELECT o FROM Container AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind", Container.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
}
