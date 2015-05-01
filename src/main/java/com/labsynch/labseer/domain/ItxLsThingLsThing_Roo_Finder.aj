// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxLsThingLsThing;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ItxLsThingLsThing_Roo_Finder {
    
    public static TypedQuery<ItxLsThingLsThing> ItxLsThingLsThing.findItxLsThingLsThingsByCodeNameEquals(String codeName) {
        if (codeName == null || codeName.length() == 0) throw new IllegalArgumentException("The codeName argument is required");
        EntityManager em = ItxLsThingLsThing.entityManager();
        TypedQuery<ItxLsThingLsThing> q = em.createQuery("SELECT o FROM ItxLsThingLsThing AS o WHERE o.codeName = :codeName", ItxLsThingLsThing.class);
        q.setParameter("codeName", codeName);
        return q;
    }
    
}