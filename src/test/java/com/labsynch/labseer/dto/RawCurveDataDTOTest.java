package com.labsynch.labseer.dto;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.labsynch.labseer.domain.SubjectValue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/spring/applicationContext.xml", "classpath:/META-INF/spring/applicationContext-security.xml"})
@Configurable
public class RawCurveDataDTOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(RawCurveDataDTOTest.class);
	
	@Test
	@Transactional
	public void getRawCurveDataTest() {
		String curveId = "a_AG-00347957";
		RawCurveDataDTO rawCurveDataDTO = new RawCurveDataDTO(curveId);
		List<RawCurveDataDTO> resultList = RawCurveDataDTO.getRawCurveData(rawCurveDataDTO);
		logger.debug(resultList.toString());
		for (RawCurveDataDTO result : resultList) {
			Assert.assertNotNull(result.getCurveId());
			Assert.assertNotNull(result.getResponseSubjectValueId());
			Assert.assertNotNull(result.getResponse());
			Assert.assertNotNull(result.getResponseUnits());
			Assert.assertNotNull(result.getDose());
			Assert.assertNotNull(result.getDoseUnits());
		}
		
	}

}
