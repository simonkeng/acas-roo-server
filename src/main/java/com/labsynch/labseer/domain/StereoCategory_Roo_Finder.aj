// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StereoCategory;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect StereoCategory_Roo_Finder {
    
    public static Long StereoCategory.countFindStereoCategorysByCodeEquals(String code) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        EntityManager em = StereoCategory.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM StereoCategory AS o WHERE o.code = :code", Long.class);
        q.setParameter("code", code);
        return ((Long) q.getSingleResult());
    }
    
    public static Long StereoCategory.countFindStereoCategorysByCodeLike(String code) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        code = code.replace('*', '%');
        if (code.charAt(0) != '%') {
            code = "%" + code;
        }
        if (code.charAt(code.length() - 1) != '%') {
            code = code + "%";
        }
        EntityManager em = StereoCategory.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM StereoCategory AS o WHERE LOWER(o.code) LIKE LOWER(:code)", Long.class);
        q.setParameter("code", code);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<StereoCategory> StereoCategory.findStereoCategorysByCodeEquals(String code) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        EntityManager em = StereoCategory.entityManager();
        TypedQuery<StereoCategory> q = em.createQuery("SELECT o FROM StereoCategory AS o WHERE o.code = :code", StereoCategory.class);
        q.setParameter("code", code);
        return q;
    }
    
    public static TypedQuery<StereoCategory> StereoCategory.findStereoCategorysByCodeEquals(String code, String sortFieldName, String sortOrder) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        EntityManager em = StereoCategory.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM StereoCategory AS o WHERE o.code = :code");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<StereoCategory> q = em.createQuery(queryBuilder.toString(), StereoCategory.class);
        q.setParameter("code", code);
        return q;
    }
    
    public static TypedQuery<StereoCategory> StereoCategory.findStereoCategorysByCodeLike(String code) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        code = code.replace('*', '%');
        if (code.charAt(0) != '%') {
            code = "%" + code;
        }
        if (code.charAt(code.length() - 1) != '%') {
            code = code + "%";
        }
        EntityManager em = StereoCategory.entityManager();
        TypedQuery<StereoCategory> q = em.createQuery("SELECT o FROM StereoCategory AS o WHERE LOWER(o.code) LIKE LOWER(:code)", StereoCategory.class);
        q.setParameter("code", code);
        return q;
    }
    
    public static TypedQuery<StereoCategory> StereoCategory.findStereoCategorysByCodeLike(String code, String sortFieldName, String sortOrder) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        code = code.replace('*', '%');
        if (code.charAt(0) != '%') {
            code = "%" + code;
        }
        if (code.charAt(code.length() - 1) != '%') {
            code = code + "%";
        }
        EntityManager em = StereoCategory.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM StereoCategory AS o WHERE LOWER(o.code) LIKE LOWER(:code)");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<StereoCategory> q = em.createQuery(queryBuilder.toString(), StereoCategory.class);
        q.setParameter("code", code);
        return q;
    }
    
}