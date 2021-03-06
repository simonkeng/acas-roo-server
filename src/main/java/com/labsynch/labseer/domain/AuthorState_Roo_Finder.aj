// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Author;
import com.labsynch.labseer.domain.AuthorState;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect AuthorState_Roo_Finder {
    
    public static TypedQuery<AuthorState> AuthorState.findAuthorStatesByAuthor(Author author) {
        if (author == null) throw new IllegalArgumentException("The author argument is required");
        EntityManager em = AuthorState.entityManager();
        TypedQuery<AuthorState> q = em.createQuery("SELECT o FROM AuthorState AS o WHERE o.author = :author", AuthorState.class);
        q.setParameter("author", author);
        return q;
    }
    
    public static TypedQuery<AuthorState> AuthorState.findAuthorStatesByAuthorAndLsTypeEqualsAndLsKindEqualsAndIgnoredNot(Author author, String lsType, String lsKind, boolean ignored) {
        if (author == null) throw new IllegalArgumentException("The author argument is required");
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = AuthorState.entityManager();
        TypedQuery<AuthorState> q = em.createQuery("SELECT o FROM AuthorState AS o WHERE o.author = :author AND o.lsType = :lsType  AND o.lsKind = :lsKind  AND o.ignored IS NOT :ignored", AuthorState.class);
        q.setParameter("author", author);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("ignored", ignored);
        return q;
    }
    
    public static TypedQuery<AuthorState> AuthorState.findAuthorStatesByLsTransactionEquals(Long lsTransaction) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = AuthorState.entityManager();
        TypedQuery<AuthorState> q = em.createQuery("SELECT o FROM AuthorState AS o WHERE o.lsTransaction = :lsTransaction", AuthorState.class);
        q.setParameter("lsTransaction", lsTransaction);
        return q;
    }
    
    public static TypedQuery<AuthorState> AuthorState.findAuthorStatesByLsTypeAndKindEquals(String lsTypeAndKind) {
        if (lsTypeAndKind == null || lsTypeAndKind.length() == 0) throw new IllegalArgumentException("The lsTypeAndKind argument is required");
        EntityManager em = AuthorState.entityManager();
        TypedQuery<AuthorState> q = em.createQuery("SELECT o FROM AuthorState AS o WHERE o.lsTypeAndKind = :lsTypeAndKind", AuthorState.class);
        q.setParameter("lsTypeAndKind", lsTypeAndKind);
        return q;
    }
    
    public static TypedQuery<AuthorState> AuthorState.findAuthorStatesByLsTypeEqualsAndLsKindEquals(String lsType, String lsKind) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = AuthorState.entityManager();
        TypedQuery<AuthorState> q = em.createQuery("SELECT o FROM AuthorState AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind", AuthorState.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
}
