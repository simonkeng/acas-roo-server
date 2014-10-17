// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.api;

import com.labsynch.labseer.api.ApiExperimentController;
import com.labsynch.labseer.domain.Experiment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect ApiExperimentController_Roo_Controller_Json {
    
    @RequestMapping(params = "find=ByCodeNameLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ApiExperimentController.jsonFindExperimentsByCodeNameLike(@RequestParam("codeName") String codeName) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Experiment.toJsonArray(Experiment.findExperimentsByCodeNameLike(codeName).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsKindLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ApiExperimentController.jsonFindExperimentsByLsKindLike(@RequestParam("lsKind") String lsKind) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Experiment.toJsonArray(Experiment.findExperimentsByLsKindLike(lsKind).getResultList()), headers, HttpStatus.OK);
    }
    
}
