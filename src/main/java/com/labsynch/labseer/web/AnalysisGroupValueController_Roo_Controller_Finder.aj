// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AnalysisGroupState;
import com.labsynch.labseer.domain.AnalysisGroupValue;
import com.labsynch.labseer.web.AnalysisGroupValueController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect AnalysisGroupValueController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByCodeValueEquals", "form" }, method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByCodeValueEqualsForm(Model uiModel) {
        return "analysisgroupvalues/findAnalysisGroupValuesByCodeValueEquals";
    }
    
    @RequestMapping(params = "find=ByCodeValueEquals", method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByCodeValueEquals(@RequestParam("codeValue") String codeValue, Model uiModel) {
        uiModel.addAttribute("analysisgroupvalues", AnalysisGroupValue.findAnalysisGroupValuesByCodeValueEquals(codeValue).getResultList());
        return "analysisgroupvalues/list";
    }
    
    @RequestMapping(params = { "find=ByIgnoredNotAndCodeValueEquals", "form" }, method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByIgnoredNotAndCodeValueEqualsForm(Model uiModel) {
        return "analysisgroupvalues/findAnalysisGroupValuesByIgnoredNotAndCodeValueEquals";
    }
    
    @RequestMapping(params = "find=ByIgnoredNotAndCodeValueEquals", method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByIgnoredNotAndCodeValueEquals(@RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam("codeValue") String codeValue, Model uiModel) {
        uiModel.addAttribute("analysisgroupvalues", AnalysisGroupValue.findAnalysisGroupValuesByIgnoredNotAndCodeValueEquals(ignored, codeValue).getResultList());
        return "analysisgroupvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsState", "form" }, method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByLsStateForm(Model uiModel) {
        uiModel.addAttribute("analysisgroupstates", AnalysisGroupState.findAllAnalysisGroupStates());
        return "analysisgroupvalues/findAnalysisGroupValuesByLsState";
    }
    
    @RequestMapping(params = "find=ByLsState", method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByLsState(@RequestParam("lsState") AnalysisGroupState lsState, Model uiModel) {
        uiModel.addAttribute("analysisgroupvalues", AnalysisGroupValue.findAnalysisGroupValuesByLsState(lsState).getResultList());
        return "analysisgroupvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByLsTransactionEqualsForm(Model uiModel) {
        return "analysisgroupvalues/findAnalysisGroupValuesByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, Model uiModel) {
        uiModel.addAttribute("analysisgroupvalues", AnalysisGroupValue.findAnalysisGroupValuesByLsTransactionEquals(lsTransaction).getResultList());
        return "analysisgroupvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeEqualsAndLsKindEquals", "form" }, method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByLsTypeEqualsAndLsKindEqualsForm(Model uiModel) {
        return "analysisgroupvalues/findAnalysisGroupValuesByLsTypeEqualsAndLsKindEquals";
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndLsKindEquals", method = RequestMethod.GET)
    public String AnalysisGroupValueController.findAnalysisGroupValuesByLsTypeEqualsAndLsKindEquals(@RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind, Model uiModel) {
        uiModel.addAttribute("analysisgroupvalues", AnalysisGroupValue.findAnalysisGroupValuesByLsTypeEqualsAndLsKindEquals(lsType, lsKind).getResultList());
        return "analysisgroupvalues/list";
    }
    
}
