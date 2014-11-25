package com.labsynch.labseer.api;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.labsynch.labseer.domain.AnalysisGroupState;
import com.labsynch.labseer.domain.AnalysisGroupValue;

@Controller
@RequestMapping("api/v1/analysisgroupvalues")
@Transactional
//@RooWebJson(jsonObject = AnalysisGroupValue.class)
public class ApiAnalysisGroupValueController {

	private static final Logger logger = LoggerFactory.getLogger(ApiAnalysisGroupValueController.class);

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> deleteFromJson(@PathVariable("id") Long id) {
        AnalysisGroupValue analysisGroupValue = AnalysisGroupValue.findAnalysisGroupValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (analysisGroupValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        analysisGroupValue.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

	@RequestMapping(params = "find=ByCodeValueEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> jsonFindAnalysisGroupValuesByCodeValueEquals(@RequestParam("codeValue") String codeValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupValue.toJsonArray(AnalysisGroupValue.findAnalysisGroupValuesByCodeValueEquals(codeValue).getResultList()), headers, HttpStatus.OK);
    }

	@RequestMapping(params = "find=ByIgnoredNotAndCodeValueEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> jsonFindAnalysisGroupValuesByIgnoredNotAndCodeValueEquals(@RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam("codeValue") String codeValue) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupValue.toJsonArray(AnalysisGroupValue.findAnalysisGroupValuesByIgnoredNotAndCodeValueEquals(ignored, codeValue).getResultList()), headers, HttpStatus.OK);
    }

	@RequestMapping(params = "find=ByLsState", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> jsonFindAnalysisGroupValuesByLsState(@RequestParam("lsState") AnalysisGroupState lsState) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupValue.toJsonArray(AnalysisGroupValue.findAnalysisGroupValuesByLsState(lsState).getResultList()), headers, HttpStatus.OK);
    }

	@RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> jsonFindAnalysisGroupValuesByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupValue.toJsonArray(AnalysisGroupValue.findAnalysisGroupValuesByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }

	@RequestMapping(params = "find=ByLsTypeEqualsAndLsKindEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> jsonFindAnalysisGroupValuesByLsTypeEqualsAndLsKindEquals(@RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(AnalysisGroupValue.toJsonArray(AnalysisGroupValue.findAnalysisGroupValuesByLsTypeEqualsAndLsKindEquals(lsType, lsKind).getResultList()), headers, HttpStatus.OK);
    }
}
