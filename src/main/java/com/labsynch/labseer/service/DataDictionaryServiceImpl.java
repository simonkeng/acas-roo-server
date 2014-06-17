package com.labsynch.labseer.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.labsynch.labseer.domain.DDictValue;
import com.labsynch.labseer.domain.LabelSequence;
import com.labsynch.labseer.dto.AutoLabelDTO;

@Service
@Transactional
public class DataDictionaryServiceImpl implements DataDictionaryService {
	
	@Autowired
	private AutoLabelService autoLabelService;
	
	private static final Logger logger = LoggerFactory.getLogger(DataDictionaryServiceImpl.class);


	@Override
	public DDictValue saveDataDictionaryValue(DDictValue dDict) {
		logger.debug("here is the incoming ddict value: " + dDict.toJson());
		if (dDict.getCodeName() == null){
			String thingTypeAndKind = "document_datadictionary";
			String labelTypeAndKind = "id_codeName";
			Long numberOfLabels = 1L;
			List<AutoLabelDTO> labels;
			try {
				labels = autoLabelService.getAutoLabels(thingTypeAndKind, labelTypeAndKind, numberOfLabels );
			} catch(NoResultException ex) {
				LabelSequence theSequence = new LabelSequence();
				theSequence.setDigits(6);
				theSequence.setGroupDigits(false);
				theSequence.setIgnored(false);
				theSequence.setLabelPrefix("DD");
				theSequence.setLabelSeparator("-");
				theSequence.setLabelTypeAndKind("id_codeName");
				theSequence.setLatestNumber(0L);
				theSequence.setModifiedDate((new Date()));
				theSequence.setThingTypeAndKind("document_datadictionary");
				theSequence.setVersion(0);
				theSequence.persist();
				
				labels = autoLabelService.getAutoLabels(thingTypeAndKind, labelTypeAndKind, numberOfLabels );
			}
			int count = labels == null ? 1 : 0 ;
			dDict.setCodeName(labels.get(0).getAutoLabel());
		}
		dDict.persist();
		return dDict;
	}

	@Override
	public DDictValue getDataDictionaryValue(DDictValue dDict) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DDictValue updateDataDictionaryValue(DDictValue dDict) {
		// TODO Auto-generated method stub
		return null;
	}

}