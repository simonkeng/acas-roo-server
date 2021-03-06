// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsThing;
import com.labsynch.labseer.domain.LsThingLabel;
import com.labsynch.labseer.web.LsThingLabelController;
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

privileged aspect LsThingLabelController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingLabelController.showJson(@PathVariable("id") Long id) {
        LsThingLabel lsThingLabel = LsThingLabel.findLsThingLabel(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (lsThingLabel == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(lsThingLabel.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingLabelController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<LsThingLabel> result = LsThingLabel.findAllLsThingLabels();
        return new ResponseEntity<String>(LsThingLabel.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingLabelController.createFromJson(@RequestBody String json) {
        LsThingLabel lsThingLabel = LsThingLabel.fromJsonToLsThingLabel(json);
        lsThingLabel.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingLabelController.createFromJsonArray(@RequestBody String json) {
        for (LsThingLabel lsThingLabel: LsThingLabel.fromJsonArrayToLsThingLabels(json)) {
            lsThingLabel.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingLabelController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        LsThingLabel lsThingLabel = LsThingLabel.fromJsonToLsThingLabel(json);
        if (lsThingLabel.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingLabelController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (LsThingLabel lsThingLabel: LsThingLabel.fromJsonArrayToLsThingLabels(json)) {
            if (lsThingLabel.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingLabelController.deleteFromJson(@PathVariable("id") Long id) {
        LsThingLabel lsThingLabel = LsThingLabel.findLsThingLabel(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (lsThingLabel == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        lsThingLabel.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLabelTextEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingLabelController.jsonFindLsThingLabelsByLabelTextEquals(@RequestParam("labelText") String labelText) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingLabel.toJsonArray(LsThingLabel.findLsThingLabelsByLabelTextEquals(labelText).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLabelTextEqualsAndIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingLabelController.jsonFindLsThingLabelsByLabelTextEqualsAndIgnoredNot(@RequestParam("labelText") String labelText, @RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingLabel.toJsonArray(LsThingLabel.findLsThingLabelsByLabelTextEqualsAndIgnoredNot(labelText, ignored).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLabelTextLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingLabelController.jsonFindLsThingLabelsByLabelTextLike(@RequestParam("labelText") String labelText) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingLabel.toJsonArray(LsThingLabel.findLsThingLabelsByLabelTextLike(labelText).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsThing", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingLabelController.jsonFindLsThingLabelsByLsThing(@RequestParam("lsThing") LsThing lsThing) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingLabel.toJsonArray(LsThingLabel.findLsThingLabelsByLsThing(lsThing).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingLabelController.jsonFindLsThingLabelsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingLabel.toJsonArray(LsThingLabel.findLsThingLabelsByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
}
