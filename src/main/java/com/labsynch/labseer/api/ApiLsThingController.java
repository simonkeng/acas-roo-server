package com.labsynch.labseer.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.labsynch.labseer.dto.PreferredNameResultsDTO;
import com.labsynch.labseer.service.GeneThingService;
import com.labsynch.labseer.service.LsThingService;
import com.labsynch.labseer.utils.PropertiesUtilService;

@Controller
@RequestMapping("api/v1/lsthings")
@Transactional
public class ApiLsThingController {

    @SuppressWarnings("unused")
    private static final Logger logger = LoggerFactory.getLogger(ApiLsThingController.class);

    @Autowired
    private LsThingService lsThingService;

    @Autowired
    private GeneThingService geneThingService;

    @Autowired
    private PropertiesUtilService propertiesUtilService;
    
    @RequestMapping(value = "/getGeneCodeNameFromNameRequest", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> getGeneCodeNameFromName(@RequestBody String json) {
        String thingType = "gene";
        String thingKind = "entrez gene";
        String labelType = "name";
        String labelKind = "Entrez Gene ID";
        logger.info("getGeneCodeNameFromNameRequest incoming json: " + json);
        PreferredNameResultsDTO results = lsThingService.getPreferredNameFromName(thingType, thingKind, labelType, labelKind, json);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(results.toJson(), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/getCodeNameFromNameRequest", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> getCodeNameFromName(@RequestBody String json, 
    		@RequestParam(value = "thingType", required = true) String thingType, 
    		@RequestParam(value = "thingKind", required = true) String thingKind, 
    		@RequestParam(value = "labelType", required = false) String labelType, 
    		@RequestParam(value = "labelKind", required = false) String labelKind) {
        logger.info("getCodeNameFromNameRequest incoming json: " + json);
        PreferredNameResultsDTO results = lsThingService.getCodeNameFromName(thingType, thingKind, labelType, labelKind, json);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(results.toJson(), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/getPreferredNameFromNameRequest", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> getPreferredNameFromName(@RequestBody String json, @RequestParam(value = "thingType", required = true) String thingType, @RequestParam(value = "thingKind", required = true) String thingKind, @RequestParam(value = "labelType", required = false) String labelType, @RequestParam(value = "labelKind", required = false) String labelKind) {
        PreferredNameResultsDTO results = lsThingService.getPreferredNameFromName(thingType, thingKind, labelType, labelKind, json);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(results.toJson(), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/projects", method = RequestMethod.GET, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> getProjects() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(lsThingService.getProjectCodes(), headers, HttpStatus.OK);
    }

	
}