// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.web.TreatmentGroupController;
import java.util.Set;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect TreatmentGroupController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByAnalysisGroups", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupController.findTreatmentGroupsByAnalysisGroupsForm(Model uiModel) {
        uiModel.addAttribute("analysisgroups", AnalysisGroup.findAllAnalysisGroups());
        return "treatmentgroups/findTreatmentGroupsByAnalysisGroups";
    }
    
    @RequestMapping(params = "find=ByAnalysisGroups", method = RequestMethod.GET)
    public String TreatmentGroupController.findTreatmentGroupsByAnalysisGroups(@RequestParam("analysisGroups") Set<AnalysisGroup> analysisGroups, Model uiModel) {
        uiModel.addAttribute("treatmentgroups", TreatmentGroup.findTreatmentGroupsByAnalysisGroups(analysisGroups).getResultList());
        return "treatmentgroups/list";
    }
    
    @RequestMapping(params = { "find=ByCodeNameEquals", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupController.findTreatmentGroupsByCodeNameEqualsForm(Model uiModel) {
        return "treatmentgroups/findTreatmentGroupsByCodeNameEquals";
    }
    
    @RequestMapping(params = "find=ByCodeNameEquals", method = RequestMethod.GET)
    public String TreatmentGroupController.findTreatmentGroupsByCodeNameEquals(@RequestParam("codeName") String codeName, Model uiModel) {
        uiModel.addAttribute("treatmentgroups", TreatmentGroup.findTreatmentGroupsByCodeNameEquals(codeName).getResultList());
        return "treatmentgroups/list";
    }
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupController.findTreatmentGroupsByLsTransactionEqualsForm(Model uiModel) {
        return "treatmentgroups/findTreatmentGroupsByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String TreatmentGroupController.findTreatmentGroupsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, Model uiModel) {
        uiModel.addAttribute("treatmentgroups", TreatmentGroup.findTreatmentGroupsByLsTransactionEquals(lsTransaction).getResultList());
        return "treatmentgroups/list";
    }
    
}
