// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ExperimentKind;
import com.labsynch.labseer.domain.ExperimentType;
import com.labsynch.labseer.web.ExperimentKindController;
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

privileged aspect ExperimentKindController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentKindController.showJson(@PathVariable("id") Long id) {
        ExperimentKind experimentKind = ExperimentKind.findExperimentKind(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (experimentKind == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(experimentKind.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentKindController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ExperimentKind> result = ExperimentKind.findAllExperimentKinds();
        return new ResponseEntity<String>(ExperimentKind.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentKindController.createFromJson(@RequestBody String json) {
        ExperimentKind experimentKind = ExperimentKind.fromJsonToExperimentKind(json);
        experimentKind.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentKindController.createFromJsonArray(@RequestBody String json) {
        for (ExperimentKind experimentKind: ExperimentKind.fromJsonArrayToExperimentKinds(json)) {
            experimentKind.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentKindController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ExperimentKind experimentKind = ExperimentKind.fromJsonToExperimentKind(json);
        if (experimentKind.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentKindController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ExperimentKind experimentKind: ExperimentKind.fromJsonArrayToExperimentKinds(json)) {
            if (experimentKind.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ExperimentKindController.deleteFromJson(@PathVariable("id") Long id) {
        ExperimentKind experimentKind = ExperimentKind.findExperimentKind(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (experimentKind == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        experimentKind.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndKindNameEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentKindController.jsonFindExperimentKindsByLsTypeEqualsAndKindNameEquals(@RequestParam("lsType") ExperimentType lsType, @RequestParam("kindName") String kindName) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ExperimentKind.toJsonArray(ExperimentKind.findExperimentKindsByLsTypeEqualsAndKindNameEquals(lsType, kindName).getResultList()), headers, HttpStatus.OK);
    }
    
}
