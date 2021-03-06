// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ItxExperimentExperimentValue;
import com.labsynch.labseer.web.ItxExperimentExperimentValueController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect ItxExperimentExperimentValueController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ItxExperimentExperimentValueController.showJson(@PathVariable("id") Long id) {
        ItxExperimentExperimentValue itxExperimentExperimentValue = ItxExperimentExperimentValue.findItxExperimentExperimentValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (itxExperimentExperimentValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(itxExperimentExperimentValue.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ItxExperimentExperimentValueController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ItxExperimentExperimentValue> result = ItxExperimentExperimentValue.findAllItxExperimentExperimentValues();
        return new ResponseEntity<String>(ItxExperimentExperimentValue.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ItxExperimentExperimentValueController.createFromJson(@RequestBody String json) {
        ItxExperimentExperimentValue itxExperimentExperimentValue = ItxExperimentExperimentValue.fromJsonToItxExperimentExperimentValue(json);
        itxExperimentExperimentValue.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ItxExperimentExperimentValueController.createFromJsonArray(@RequestBody String json) {
        for (ItxExperimentExperimentValue itxExperimentExperimentValue: ItxExperimentExperimentValue.fromJsonArrayToItxExperimentExperimentValues(json)) {
            itxExperimentExperimentValue.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ItxExperimentExperimentValueController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ItxExperimentExperimentValue itxExperimentExperimentValue = ItxExperimentExperimentValue.fromJsonToItxExperimentExperimentValue(json);
        if (itxExperimentExperimentValue.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ItxExperimentExperimentValueController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ItxExperimentExperimentValue itxExperimentExperimentValue: ItxExperimentExperimentValue.fromJsonArrayToItxExperimentExperimentValues(json)) {
            if (itxExperimentExperimentValue.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ItxExperimentExperimentValueController.deleteFromJson(@PathVariable("id") Long id) {
        ItxExperimentExperimentValue itxExperimentExperimentValue = ItxExperimentExperimentValue.findItxExperimentExperimentValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (itxExperimentExperimentValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        itxExperimentExperimentValue.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
