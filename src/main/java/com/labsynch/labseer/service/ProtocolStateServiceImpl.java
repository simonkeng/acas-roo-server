package com.labsynch.labseer.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupState;
import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ExperimentState;
import com.labsynch.labseer.domain.Protocol;
import com.labsynch.labseer.domain.ProtocolState;
import com.labsynch.labseer.domain.ProtocolValue;
import com.labsynch.labseer.domain.Subject;
import com.labsynch.labseer.domain.SubjectState;
import com.labsynch.labseer.domain.SubjectValue;
import com.labsynch.labseer.utils.PropertiesUtilService;

@Service
@Transactional
public class ProtocolStateServiceImpl implements ProtocolStateService {

	private static final Logger logger = LoggerFactory.getLogger(ProtocolStateServiceImpl.class);
	
	@Autowired
	private PropertiesUtilService propertiesUtilService;

	@Override
	public Collection<ProtocolState> ignoreAllProtocolStates(Collection<ProtocolState> protocolStates) {
		//mark protocolStates and values as ignore 
		Collection<ProtocolState> protocolStateSet = new HashSet<ProtocolState>();
		for (ProtocolState queryProtocolState : protocolStates){
			ProtocolState protocolState = ProtocolState.findProtocolState(queryProtocolState.getId());			
				for(ProtocolValue protocolValue : ProtocolValue.findProtocolValuesByLsState(protocolState).getResultList()){
					protocolValue.setIgnored(true);
					protocolValue.merge();
				}
				protocolState.setIgnored(true);
				protocolState.merge();
				protocolStateSet.add(ProtocolState.findProtocolState(protocolState.getId()));
		}

		return(protocolStateSet);

	}

	@Override
	public List<ProtocolState> getProtocolStatesByProtocolIdAndStateTypeKind(
			Long protocolId, String stateType, String stateKind) {
		
			List<ProtocolState> protocolStates = ProtocolState.findProtocolStatesByProtocolIDAndStateTypeKind(protocolId, stateType, stateKind).getResultList();

			return protocolStates;
	}

	@Override
	public ProtocolState createProtocolStateByProtocolIdAndStateTypeKind(
			Long protocolId, String stateType, String stateKind) {
		ProtocolState protocolState = new ProtocolState();
		Protocol protocol = Protocol.findProtocol(protocolId);
		protocolState.setProtocol(protocol);
		protocolState.setLsType(stateType);
		protocolState.setLsKind(stateKind);
		protocolState.persist();
		return protocolState;
	}

	@Override
	public ProtocolState saveProtocolState(
			ProtocolState protocolState) {
		protocolState.setProtocol(Protocol.findProtocol(protocolState.getProtocol().getId()));		
		protocolState.persist();
		return protocolState;
	}

	@Override
	public Collection<ProtocolState> saveProtocolStates(
			Collection<ProtocolState> protocolStates) {
		for (ProtocolState protocolState: protocolStates) {
			protocolState = saveProtocolState(protocolState);
		}
		return protocolStates;
	}

}