// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.domain.TreatmentGroupState;
import com.labsynch.labseer.web.TreatmentGroupStateController;
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

privileged aspect TreatmentGroupStateController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupStateController.showJson(@PathVariable("id") Long id) {
        TreatmentGroupState treatmentGroupState = TreatmentGroupState.findTreatmentGroupState(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (treatmentGroupState == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(treatmentGroupState.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupStateController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<TreatmentGroupState> result = TreatmentGroupState.findAllTreatmentGroupStates();
        return new ResponseEntity<String>(TreatmentGroupState.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TreatmentGroupStateController.createFromJson(@RequestBody String json) {
        TreatmentGroupState treatmentGroupState = TreatmentGroupState.fromJsonToTreatmentGroupState(json);
        treatmentGroupState.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TreatmentGroupStateController.createFromJsonArray(@RequestBody String json) {
        for (TreatmentGroupState treatmentGroupState: TreatmentGroupState.fromJsonArrayToTreatmentGroupStates(json)) {
            treatmentGroupState.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TreatmentGroupStateController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        TreatmentGroupState treatmentGroupState = TreatmentGroupState.fromJsonToTreatmentGroupState(json);
        if (treatmentGroupState.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TreatmentGroupStateController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (TreatmentGroupState treatmentGroupState: TreatmentGroupState.fromJsonArrayToTreatmentGroupStates(json)) {
            if (treatmentGroupState.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> TreatmentGroupStateController.deleteFromJson(@PathVariable("id") Long id) {
        TreatmentGroupState treatmentGroupState = TreatmentGroupState.findTreatmentGroupState(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (treatmentGroupState == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        treatmentGroupState.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupStateController.jsonFindTreatmentGroupStatesByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(TreatmentGroupState.toJsonArray(TreatmentGroupState.findTreatmentGroupStatesByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeAndKindEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupStateController.jsonFindTreatmentGroupStatesByLsTypeAndKindEquals(@RequestParam("lsTypeAndKind") String lsTypeAndKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(TreatmentGroupState.toJsonArray(TreatmentGroupState.findTreatmentGroupStatesByLsTypeAndKindEquals(lsTypeAndKind).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTreatmentGroup", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupStateController.jsonFindTreatmentGroupStatesByTreatmentGroup(@RequestParam("treatmentGroup") TreatmentGroup treatmentGroup) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(TreatmentGroupState.toJsonArray(TreatmentGroupState.findTreatmentGroupStatesByTreatmentGroup(treatmentGroup).getResultList()), headers, HttpStatus.OK);
    }
    
}
