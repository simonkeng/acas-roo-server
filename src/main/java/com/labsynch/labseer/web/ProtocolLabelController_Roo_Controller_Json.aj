// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Protocol;
import com.labsynch.labseer.domain.ProtocolLabel;
import com.labsynch.labseer.web.ProtocolLabelController;
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

privileged aspect ProtocolLabelController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolLabelController.showJson(@PathVariable("id") Long id) {
        ProtocolLabel protocolLabel = ProtocolLabel.findProtocolLabel(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (protocolLabel == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(protocolLabel.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolLabelController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ProtocolLabel> result = ProtocolLabel.findAllProtocolLabels();
        return new ResponseEntity<String>(ProtocolLabel.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolLabelController.createFromJson(@RequestBody String json) {
        ProtocolLabel protocolLabel = ProtocolLabel.fromJsonToProtocolLabel(json);
        protocolLabel.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolLabelController.createFromJsonArray(@RequestBody String json) {
        for (ProtocolLabel protocolLabel: ProtocolLabel.fromJsonArrayToProtocolLabels(json)) {
            protocolLabel.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolLabelController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ProtocolLabel protocolLabel = ProtocolLabel.fromJsonToProtocolLabel(json);
        if (protocolLabel.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolLabelController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ProtocolLabel protocolLabel: ProtocolLabel.fromJsonArrayToProtocolLabels(json)) {
            if (protocolLabel.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolLabelController.deleteFromJson(@PathVariable("id") Long id) {
        ProtocolLabel protocolLabel = ProtocolLabel.findProtocolLabel(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (protocolLabel == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        protocolLabel.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLabelTextEqualsAndIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolLabelController.jsonFindProtocolLabelsByLabelTextEqualsAndIgnoredNot(@RequestParam("labelText") String labelText, @RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ProtocolLabel.toJsonArray(ProtocolLabel.findProtocolLabelsByLabelTextEqualsAndIgnoredNot(labelText, ignored).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLabelTextLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolLabelController.jsonFindProtocolLabelsByLabelTextLike(@RequestParam("labelText") String labelText) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ProtocolLabel.toJsonArray(ProtocolLabel.findProtocolLabelsByLabelTextLike(labelText).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolLabelController.jsonFindProtocolLabelsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ProtocolLabel.toJsonArray(ProtocolLabel.findProtocolLabelsByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByProtocol", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolLabelController.jsonFindProtocolLabelsByProtocol(@RequestParam("protocol") Protocol protocol) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ProtocolLabel.toJsonArray(ProtocolLabel.findProtocolLabelsByProtocol(protocol).getResultList()), headers, HttpStatus.OK);
    }
    
}
