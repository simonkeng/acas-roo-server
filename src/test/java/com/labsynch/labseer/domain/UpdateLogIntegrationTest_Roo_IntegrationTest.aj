// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.UpdateLog;
import com.labsynch.labseer.domain.UpdateLogDataOnDemand;
import com.labsynch.labseer.domain.UpdateLogIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UpdateLogIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UpdateLogIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UpdateLogIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UpdateLogIntegrationTest: @Transactional;
    
    @Autowired
    UpdateLogDataOnDemand UpdateLogIntegrationTest.dod;
    
    @Test
    public void UpdateLogIntegrationTest.testCountUpdateLogs() {
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", dod.getRandomUpdateLog());
        long count = UpdateLog.countUpdateLogs();
        Assert.assertTrue("Counter for 'UpdateLog' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UpdateLogIntegrationTest.testFindUpdateLog() {
        UpdateLog obj = dod.getRandomUpdateLog();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to provide an identifier", id);
        obj = UpdateLog.findUpdateLog(id);
        Assert.assertNotNull("Find method for 'UpdateLog' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'UpdateLog' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UpdateLogIntegrationTest.testFindAllUpdateLogs() {
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", dod.getRandomUpdateLog());
        long count = UpdateLog.countUpdateLogs();
        Assert.assertTrue("Too expensive to perform a find all test for 'UpdateLog', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<UpdateLog> result = UpdateLog.findAllUpdateLogs();
        Assert.assertNotNull("Find all method for 'UpdateLog' illegally returned null", result);
        Assert.assertTrue("Find all method for 'UpdateLog' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UpdateLogIntegrationTest.testFindUpdateLogEntries() {
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", dod.getRandomUpdateLog());
        long count = UpdateLog.countUpdateLogs();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<UpdateLog> result = UpdateLog.findUpdateLogEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'UpdateLog' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'UpdateLog' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UpdateLogIntegrationTest.testFlush() {
        UpdateLog obj = dod.getRandomUpdateLog();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to provide an identifier", id);
        obj = UpdateLog.findUpdateLog(id);
        Assert.assertNotNull("Find method for 'UpdateLog' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUpdateLog(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'UpdateLog' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UpdateLogIntegrationTest.testMergeUpdate() {
        UpdateLog obj = dod.getRandomUpdateLog();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to provide an identifier", id);
        obj = UpdateLog.findUpdateLog(id);
        boolean modified =  dod.modifyUpdateLog(obj);
        Integer currentVersion = obj.getVersion();
        UpdateLog merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'UpdateLog' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UpdateLogIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", dod.getRandomUpdateLog());
        UpdateLog obj = dod.getNewTransientUpdateLog(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'UpdateLog' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'UpdateLog' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UpdateLogIntegrationTest.testRemove() {
        UpdateLog obj = dod.getRandomUpdateLog();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UpdateLog' failed to provide an identifier", id);
        obj = UpdateLog.findUpdateLog(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'UpdateLog' with identifier '" + id + "'", UpdateLog.findUpdateLog(id));
    }
    
}
