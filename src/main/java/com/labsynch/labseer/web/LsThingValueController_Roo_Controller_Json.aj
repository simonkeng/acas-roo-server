// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsThingState;
import com.labsynch.labseer.domain.LsThingValue;
import com.labsynch.labseer.web.LsThingValueController;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect LsThingValueController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.showJson(@PathVariable("id") Long id) {
        LsThingValue lsThingValue = LsThingValue.findLsThingValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (lsThingValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(lsThingValue.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<LsThingValue> result = LsThingValue.findAllLsThingValues();
        return new ResponseEntity<String>(LsThingValue.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingValueController.createFromJson(@RequestBody String json) {
        LsThingValue lsThingValue = LsThingValue.fromJsonToLsThingValue(json);
        lsThingValue.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingValueController.createFromJsonArray(@RequestBody String json) {
        for (LsThingValue lsThingValue: LsThingValue.fromJsonArrayToLsThingValues(json)) {
            lsThingValue.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingValueController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        LsThingValue lsThingValue = LsThingValue.fromJsonToLsThingValue(json);
        if (lsThingValue.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingValueController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (LsThingValue lsThingValue: LsThingValue.fromJsonArrayToLsThingValues(json)) {
            if (lsThingValue.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> LsThingValueController.deleteFromJson(@PathVariable("id") Long id) {
        LsThingValue lsThingValue = LsThingValue.findLsThingValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (lsThingValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        lsThingValue.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCodeValueEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByCodeValueEquals(@RequestParam("codeValue") String codeValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByCodeValueEquals(codeValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByIgnoredNotAndCodeValueEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByIgnoredNotAndCodeValueEquals(@RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam("codeValue") String codeValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByIgnoredNotAndCodeValueEquals(ignored, codeValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndCodeValueLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndCodeValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("codeValue") String codeValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndCodeValueLike(lsKind, codeValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndDateValueGreaterThanEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndDateValueGreaterThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("dateValue") @DateTimeFormat(style = "MM") Date dateValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueGreaterThanEquals(lsKind, dateValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndDateValueLessThanEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndDateValueLessThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("dateValue") @DateTimeFormat(style = "MM") Date dateValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueLessThanEquals(lsKind, dateValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndDateValueLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndDateValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("dateValue") @DateTimeFormat(style = "MM") Date dateValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueLike(lsKind, dateValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndNumericValueEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndNumericValueEquals(@RequestParam("lsKind") String lsKind, @RequestParam("numericValue") BigDecimal numericValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueEquals(lsKind, numericValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndNumericValueGreaterThanEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("numericValue") BigDecimal numericValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEquals(lsKind, numericValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndNumericValueLessThanEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndNumericValueLessThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("numericValue") BigDecimal numericValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueLessThanEquals(lsKind, numericValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndStringValueEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndStringValueEquals(@RequestParam("lsKind") String lsKind, @RequestParam("stringValue") String stringValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndStringValueEquals(lsKind, stringValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndStringValueLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsKindEqualsAndStringValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("stringValue") String stringValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsKindEqualsAndStringValueLike(lsKind, stringValue).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsState", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsState(@RequestParam("lsState") LsThingState lsState) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsState(lsState).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LsThingValueController.jsonFindLsThingValuesByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(LsThingValue.toJsonArray(LsThingValue.findLsThingValuesByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
}
