// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LsTransaction;
import com.labsynch.labseer.domain.LsTransactionDataOnDemand;
import com.labsynch.labseer.domain.LsTransactionStatus;
import com.labsynch.labseer.domain.LsTransactionType;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect LsTransactionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LsTransactionDataOnDemand: @Component;
    
    private Random LsTransactionDataOnDemand.rnd = new SecureRandom();
    
    private List<LsTransaction> LsTransactionDataOnDemand.data;
    
    public LsTransaction LsTransactionDataOnDemand.getNewTransientLsTransaction(int index) {
        LsTransaction obj = new LsTransaction();
        setComments(obj, index);
        setRecordedBy(obj, index);
        setRecordedDate(obj, index);
        setStatus(obj, index);
        setType(obj, index);
        return obj;
    }
    
    public void LsTransactionDataOnDemand.setComments(LsTransaction obj, int index) {
        String comments = "comments_" + index;
        if (comments.length() > 255) {
            comments = comments.substring(0, 255);
        }
        obj.setComments(comments);
    }
    
    public void LsTransactionDataOnDemand.setRecordedBy(LsTransaction obj, int index) {
        String recordedBy = "recordedBy_" + index;
        if (recordedBy.length() > 255) {
            recordedBy = recordedBy.substring(0, 255);
        }
        obj.setRecordedBy(recordedBy);
    }
    
    public void LsTransactionDataOnDemand.setRecordedDate(LsTransaction obj, int index) {
        Date recordedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRecordedDate(recordedDate);
    }
    
    public void LsTransactionDataOnDemand.setStatus(LsTransaction obj, int index) {
        LsTransactionStatus status = LsTransactionStatus.class.getEnumConstants()[0];
        obj.setStatus(status);
    }
    
    public void LsTransactionDataOnDemand.setType(LsTransaction obj, int index) {
        LsTransactionType type = LsTransactionType.class.getEnumConstants()[0];
        obj.setType(type);
    }
    
    public LsTransaction LsTransactionDataOnDemand.getSpecificLsTransaction(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        LsTransaction obj = data.get(index);
        Long id = obj.getId();
        return LsTransaction.findLsTransaction(id);
    }
    
    public LsTransaction LsTransactionDataOnDemand.getRandomLsTransaction() {
        init();
        LsTransaction obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return LsTransaction.findLsTransaction(id);
    }
    
    public boolean LsTransactionDataOnDemand.modifyLsTransaction(LsTransaction obj) {
        return false;
    }
    
    public void LsTransactionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = LsTransaction.findLsTransactionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'LsTransaction' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<LsTransaction>();
        for (int i = 0; i < 10; i++) {
            LsTransaction obj = getNewTransientLsTransaction(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
