// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxSubjectContainerValue;
import com.labsynch.labseer.domain.ItxSubjectContainerValueDataOnDemand;
import com.labsynch.labseer.domain.ItxSubjectContainerValueIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ItxSubjectContainerValueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ItxSubjectContainerValueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ItxSubjectContainerValueIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ItxSubjectContainerValueIntegrationTest: @Transactional;
    
    @Autowired
    ItxSubjectContainerValueDataOnDemand ItxSubjectContainerValueIntegrationTest.dod;
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testCountItxSubjectContainerValues() {
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", dod.getRandomItxSubjectContainerValue());
        long count = ItxSubjectContainerValue.countItxSubjectContainerValues();
        Assert.assertTrue("Counter for 'ItxSubjectContainerValue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testFindItxSubjectContainerValue() {
        ItxSubjectContainerValue obj = dod.getRandomItxSubjectContainerValue();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to provide an identifier", id);
        obj = ItxSubjectContainerValue.findItxSubjectContainerValue(id);
        Assert.assertNotNull("Find method for 'ItxSubjectContainerValue' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ItxSubjectContainerValue' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testFindAllItxSubjectContainerValues() {
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", dod.getRandomItxSubjectContainerValue());
        long count = ItxSubjectContainerValue.countItxSubjectContainerValues();
        Assert.assertTrue("Too expensive to perform a find all test for 'ItxSubjectContainerValue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ItxSubjectContainerValue> result = ItxSubjectContainerValue.findAllItxSubjectContainerValues();
        Assert.assertNotNull("Find all method for 'ItxSubjectContainerValue' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ItxSubjectContainerValue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testFindItxSubjectContainerValueEntries() {
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", dod.getRandomItxSubjectContainerValue());
        long count = ItxSubjectContainerValue.countItxSubjectContainerValues();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ItxSubjectContainerValue> result = ItxSubjectContainerValue.findItxSubjectContainerValueEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ItxSubjectContainerValue' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ItxSubjectContainerValue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testFlush() {
        ItxSubjectContainerValue obj = dod.getRandomItxSubjectContainerValue();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to provide an identifier", id);
        obj = ItxSubjectContainerValue.findItxSubjectContainerValue(id);
        Assert.assertNotNull("Find method for 'ItxSubjectContainerValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyItxSubjectContainerValue(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ItxSubjectContainerValue' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testMergeUpdate() {
        ItxSubjectContainerValue obj = dod.getRandomItxSubjectContainerValue();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to provide an identifier", id);
        obj = ItxSubjectContainerValue.findItxSubjectContainerValue(id);
        boolean modified =  dod.modifyItxSubjectContainerValue(obj);
        Integer currentVersion = obj.getVersion();
        ItxSubjectContainerValue merged = (ItxSubjectContainerValue)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ItxSubjectContainerValue' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", dod.getRandomItxSubjectContainerValue());
        ItxSubjectContainerValue obj = dod.getNewTransientItxSubjectContainerValue(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ItxSubjectContainerValue' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'ItxSubjectContainerValue' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ItxSubjectContainerValueIntegrationTest.testRemove() {
        ItxSubjectContainerValue obj = dod.getRandomItxSubjectContainerValue();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ItxSubjectContainerValue' failed to provide an identifier", id);
        obj = ItxSubjectContainerValue.findItxSubjectContainerValue(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ItxSubjectContainerValue' with identifier '" + id + "'", ItxSubjectContainerValue.findItxSubjectContainerValue(id));
    }
    
}
