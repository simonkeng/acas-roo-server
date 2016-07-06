// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Container;
import com.labsynch.labseer.domain.ContainerLabel;
import com.labsynch.labseer.web.ContainerLabelController;
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

privileged aspect ContainerLabelController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContainerLabelController.showJson(@PathVariable("id") Long id) {
        ContainerLabel containerLabel = ContainerLabel.findContainerLabel(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (containerLabel == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(containerLabel.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContainerLabelController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ContainerLabel> result = ContainerLabel.findAllContainerLabels();
        return new ResponseEntity<String>(ContainerLabel.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ContainerLabelController.createFromJson(@RequestBody String json) {
        ContainerLabel containerLabel = ContainerLabel.fromJsonToContainerLabel(json);
        containerLabel.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ContainerLabelController.createFromJsonArray(@RequestBody String json) {
        for (ContainerLabel containerLabel: ContainerLabel.fromJsonArrayToContainerLabels(json)) {
            containerLabel.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ContainerLabelController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ContainerLabel containerLabel = ContainerLabel.fromJsonToContainerLabel(json);
        if (containerLabel.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ContainerLabelController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ContainerLabel containerLabel: ContainerLabel.fromJsonArrayToContainerLabels(json)) {
            if (containerLabel.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ContainerLabelController.deleteFromJson(@PathVariable("id") Long id) {
        ContainerLabel containerLabel = ContainerLabel.findContainerLabel(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (containerLabel == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        containerLabel.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByContainerAndIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContainerLabelController.jsonFindContainerLabelsByContainerAndIgnoredNot(@RequestParam("container") Container container, @RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ContainerLabel.toJsonArray(ContainerLabel.findContainerLabelsByContainerAndIgnoredNot(container, ignored).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLabelTextEqualsAndIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContainerLabelController.jsonFindContainerLabelsByLabelTextEqualsAndIgnoredNot(@RequestParam("labelText") String labelText, @RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ContainerLabel.toJsonArray(ContainerLabel.findContainerLabelsByLabelTextEqualsAndIgnoredNot(labelText, ignored).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContainerLabelController.jsonFindContainerLabelsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ContainerLabel.toJsonArray(ContainerLabel.findContainerLabelsByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContainerLabelController.jsonFindContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot(@RequestParam("lsType") String lsType, @RequestParam("labelText") String labelText, @RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ContainerLabel.toJsonArray(ContainerLabel.findContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot(lsType, labelText, ignored).getResultList()), headers, HttpStatus.OK);
    }
    
}
