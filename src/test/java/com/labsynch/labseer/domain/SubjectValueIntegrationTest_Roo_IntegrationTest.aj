// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.SubjectValue;
import com.labsynch.labseer.domain.SubjectValueDataOnDemand;
import com.labsynch.labseer.domain.SubjectValueIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SubjectValueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SubjectValueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SubjectValueIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SubjectValueIntegrationTest: @Transactional;
    
    @Autowired
    SubjectValueDataOnDemand SubjectValueIntegrationTest.dod;
    
    @Test
    public void SubjectValueIntegrationTest.testCountSubjectValues() {
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", dod.getRandomSubjectValue());
        long count = SubjectValue.countSubjectValues();
        Assert.assertTrue("Counter for 'SubjectValue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SubjectValueIntegrationTest.testFindSubjectValue() {
        SubjectValue obj = dod.getRandomSubjectValue();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to provide an identifier", id);
        obj = SubjectValue.findSubjectValue(id);
        Assert.assertNotNull("Find method for 'SubjectValue' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SubjectValue' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SubjectValueIntegrationTest.testFindAllSubjectValues() {
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", dod.getRandomSubjectValue());
        long count = SubjectValue.countSubjectValues();
        Assert.assertTrue("Too expensive to perform a find all test for 'SubjectValue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SubjectValue> result = SubjectValue.findAllSubjectValues();
        Assert.assertNotNull("Find all method for 'SubjectValue' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SubjectValue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SubjectValueIntegrationTest.testFindSubjectValueEntries() {
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", dod.getRandomSubjectValue());
        long count = SubjectValue.countSubjectValues();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SubjectValue> result = SubjectValue.findSubjectValueEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SubjectValue' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SubjectValue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SubjectValueIntegrationTest.testFlush() {
        SubjectValue obj = dod.getRandomSubjectValue();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to provide an identifier", id);
        obj = SubjectValue.findSubjectValue(id);
        Assert.assertNotNull("Find method for 'SubjectValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySubjectValue(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'SubjectValue' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SubjectValueIntegrationTest.testMergeUpdate() {
        SubjectValue obj = dod.getRandomSubjectValue();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to provide an identifier", id);
        obj = SubjectValue.findSubjectValue(id);
        boolean modified =  dod.modifySubjectValue(obj);
        Integer currentVersion = obj.getVersion();
        SubjectValue merged = (SubjectValue)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'SubjectValue' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SubjectValueIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", dod.getRandomSubjectValue());
        SubjectValue obj = dod.getNewTransientSubjectValue(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SubjectValue' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'SubjectValue' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SubjectValueIntegrationTest.testRemove() {
        SubjectValue obj = dod.getRandomSubjectValue();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SubjectValue' failed to provide an identifier", id);
        obj = SubjectValue.findSubjectValue(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SubjectValue' with identifier '" + id + "'", SubjectValue.findSubjectValue(id));
    }
    
}
