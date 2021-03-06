// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Protocol;
import com.labsynch.labseer.web.ProtocolController;
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

privileged aspect ProtocolController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.showJson(@PathVariable("id") Long id) {
        Protocol protocol = Protocol.findProtocol(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (protocol == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(protocol.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Protocol> result = Protocol.findAllProtocols();
        return new ResponseEntity<String>(Protocol.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolController.createFromJson(@RequestBody String json) {
        Protocol protocol = Protocol.fromJsonToProtocol(json);
        protocol.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolController.createFromJsonArray(@RequestBody String json) {
        for (Protocol protocol: Protocol.fromJsonArrayToProtocols(json)) {
            protocol.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Protocol protocol = Protocol.fromJsonToProtocol(json);
        if (protocol.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (Protocol protocol: Protocol.fromJsonArrayToProtocols(json)) {
            if (protocol.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ProtocolController.deleteFromJson(@PathVariable("id") Long id) {
        Protocol protocol = Protocol.findProtocol(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (protocol == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        protocol.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCodeNameEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByCodeNameEquals(@RequestParam("codeName") String codeName) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByCodeNameEquals(codeName).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCodeNameEqualsAndIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByCodeNameEqualsAndIgnoredNot(@RequestParam("codeName") String codeName, @RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByCodeNameEqualsAndIgnoredNot(codeName, ignored).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCodeNameLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByCodeNameLike(@RequestParam("codeName") String codeName) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByCodeNameLike(codeName).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByIgnoredNot", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByIgnoredNot(@RequestParam(value = "ignored", required = false) boolean ignored) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByIgnoredNot(ignored).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByLsKindEquals(@RequestParam("lsKind") String lsKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByLsKindEquals(lsKind).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByLsKindLike(@RequestParam("lsKind") String lsKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByLsKindLike(lsKind).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeAndKindEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByLsTypeAndKindEquals(@RequestParam("lsTypeAndKind") String lsTypeAndKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByLsTypeAndKindEquals(lsTypeAndKind).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByLsTypeEquals(@RequestParam("lsType") String lsType) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByLsTypeEquals(lsType).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndLsKindEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByLsTypeEqualsAndLsKindEquals(@RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByLsTypeEqualsAndLsKindEquals(lsType, lsKind).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTypeLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByLsTypeLike(@RequestParam("lsType") String lsType) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByLsTypeLike(lsType).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByRecordedByLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProtocolController.jsonFindProtocolsByRecordedByLike(@RequestParam("recordedBy") String recordedBy) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Protocol.toJsonArray(Protocol.findProtocolsByRecordedByLike(recordedBy).getResultList()), headers, HttpStatus.OK);
    }
    
}
