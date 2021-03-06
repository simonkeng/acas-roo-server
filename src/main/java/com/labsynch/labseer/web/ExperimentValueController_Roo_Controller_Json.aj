// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ExperimentState;
import com.labsynch.labseer.domain.ExperimentValue;
import com.labsynch.labseer.web.ExperimentValueController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect ExperimentValueController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentValueController.showJson(@PathVariable("id") Long id) {
        ExperimentValue experimentValue = ExperimentValue.findExperimentValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (experimentValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(experimentValue.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentValueController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ExperimentValue> result = ExperimentValue.findAllExperimentValues();
        return new ResponseEntity<String>(ExperimentValue.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentValueController.createFromJson(@RequestBody String json) {
        ExperimentValue experimentValue = ExperimentValue.fromJsonToExperimentValue(json);
        experimentValue.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentValueController.createFromJsonArray(@RequestBody String json) {
        for (ExperimentValue experimentValue: ExperimentValue.fromJsonArrayToExperimentValues(json)) {
            experimentValue.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentValueController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ExperimentValue experimentValue = ExperimentValue.fromJsonToExperimentValue(json);
        if (experimentValue.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentValueController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ExperimentValue experimentValue: ExperimentValue.fromJsonArrayToExperimentValues(json)) {
            if (experimentValue.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentValueController.deleteFromJson(@PathVariable("id") Long id) {
        ExperimentValue experimentValue = ExperimentValue.findExperimentValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (experimentValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        experimentValue.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndCodeValueLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentValueController.jsonFindExperimentValuesByLsKindEqualsAndCodeValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("codeValue") String codeValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ExperimentValue.toJsonArray(ExperimentValue.findExperimentValuesByLsKindEqualsAndCodeValueLike(lsKind, codeValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndStringValueLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentValueController.jsonFindExperimentValuesByLsKindEqualsAndStringValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("stringValue") String stringValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ExperimentValue.toJsonArray(ExperimentValue.findExperimentValuesByLsKindEqualsAndStringValueLike(lsKind, stringValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsState", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentValueController.jsonFindExperimentValuesByLsState(@RequestParam("lsState") ExperimentState lsState) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ExperimentValue.toJsonArray(ExperimentValue.findExperimentValuesByLsState(lsState).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsStateAndIgnoredNotAndLsKindEqualsAndLsTypeEqualsAndStringValueEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentValueController.jsonFindExperimentValuesByLsStateAndIgnoredNotAndLsKindEqualsAndLsTypeEqualsAndStringValueEquals(@RequestParam("lsState") ExperimentState lsState, @RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam("lsKind") String lsKind, @RequestParam("lsType") String lsType, @RequestParam("stringValue") String stringValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ExperimentValue.toJsonArray(ExperimentValue.findExperimentValuesByLsStateAndIgnoredNotAndLsKindEqualsAndLsTypeEqualsAndStringValueEquals(lsState, ignored, lsKind, lsType, stringValue).getResultList()), headers, HttpStatus.OK);
    }
    
}
