// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupState;
import com.labsynch.labseer.web.AnalysisGroupStateController;
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

privileged aspect AnalysisGroupStateController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AnalysisGroupStateController.showJson(@PathVariable("id") Long id) {
        AnalysisGroupState analysisGroupState = AnalysisGroupState.findAnalysisGroupState(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (analysisGroupState == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(analysisGroupState.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AnalysisGroupStateController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<AnalysisGroupState> result = AnalysisGroupState.findAllAnalysisGroupStates();
        return new ResponseEntity<String>(AnalysisGroupState.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AnalysisGroupStateController.createFromJson(@RequestBody String json) {
        AnalysisGroupState analysisGroupState = AnalysisGroupState.fromJsonToAnalysisGroupState(json);
        analysisGroupState.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AnalysisGroupStateController.createFromJsonArray(@RequestBody String json) {
        for (AnalysisGroupState analysisGroupState: AnalysisGroupState.fromJsonArrayToAnalysisGroupStates(json)) {
            analysisGroupState.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AnalysisGroupStateController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        AnalysisGroupState analysisGroupState = AnalysisGroupState.fromJsonToAnalysisGroupState(json);
        if (analysisGroupState.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AnalysisGroupStateController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (AnalysisGroupState analysisGroupState: AnalysisGroupState.fromJsonArrayToAnalysisGroupStates(json)) {
            if (analysisGroupState.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> AnalysisGroupStateController.deleteFromJson(@PathVariable("id") Long id) {
        AnalysisGroupState analysisGroupState = AnalysisGroupState.findAnalysisGroupState(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (analysisGroupState == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        analysisGroupState.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByAnalysisGroup", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AnalysisGroupStateController.jsonFindAnalysisGroupStatesByAnalysisGroup(@RequestParam("analysisGroup") AnalysisGroup analysisGroup) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupState.toJsonArray(AnalysisGroupState.findAnalysisGroupStatesByAnalysisGroup(analysisGroup).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByAnalysisGroupAndLsTypeEqualsAndLsKindEqualsAndIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AnalysisGroupStateController.jsonFindAnalysisGroupStatesByAnalysisGroupAndLsTypeEqualsAndLsKindEqualsAndIgnoredNot(@RequestParam("analysisGroup") AnalysisGroup analysisGroup, @RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind, @RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupState.toJsonArray(AnalysisGroupState.findAnalysisGroupStatesByAnalysisGroupAndLsTypeEqualsAndLsKindEqualsAndIgnoredNot(analysisGroup, lsType, lsKind, ignored).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AnalysisGroupStateController.jsonFindAnalysisGroupStatesByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupState.toJsonArray(AnalysisGroupState.findAnalysisGroupStatesByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeAndKindEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AnalysisGroupStateController.jsonFindAnalysisGroupStatesByLsTypeAndKindEquals(@RequestParam("lsTypeAndKind") String lsTypeAndKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupState.toJsonArray(AnalysisGroupState.findAnalysisGroupStatesByLsTypeAndKindEquals(lsTypeAndKind).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndLsKindEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AnalysisGroupStateController.jsonFindAnalysisGroupStatesByLsTypeEqualsAndLsKindEquals(@RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupState.toJsonArray(AnalysisGroupState.findAnalysisGroupStatesByLsTypeEqualsAndLsKindEquals(lsType, lsKind).getResultList()), headers, HttpStatus.OK);
    }
    
}
