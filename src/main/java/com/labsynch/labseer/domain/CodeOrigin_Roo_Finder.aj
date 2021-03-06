// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.CodeOrigin;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect CodeOrigin_Roo_Finder {
    
    public static TypedQuery<CodeOrigin> CodeOrigin.findCodeOriginsByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = CodeOrigin.entityManager();
        TypedQuery<CodeOrigin> q = em.createQuery("SELECT o FROM CodeOrigin AS o WHERE o.name = :name", CodeOrigin.class);
        q.setParameter("name", name);
        return q;
    }
    
}
