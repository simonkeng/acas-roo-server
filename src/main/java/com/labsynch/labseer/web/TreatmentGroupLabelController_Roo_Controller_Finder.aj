// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.domain.TreatmentGroupLabel;
import com.labsynch.labseer.web.TreatmentGroupLabelController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect TreatmentGroupLabelController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupLabelController.findTreatmentGroupLabelsByLsTransactionEqualsForm(Model uiModel) {
        return "treatmentgrouplabels/findTreatmentGroupLabelsByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String TreatmentGroupLabelController.findTreatmentGroupLabelsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, Model uiModel) {
        uiModel.addAttribute("treatmentgrouplabels", TreatmentGroupLabel.findTreatmentGroupLabelsByLsTransactionEquals(lsTransaction).getResultList());
        return "treatmentgrouplabels/list";
    }
    
    @RequestMapping(params = { "find=ByTreatmentGroup", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupLabelController.findTreatmentGroupLabelsByTreatmentGroupForm(Model uiModel) {
        uiModel.addAttribute("treatmentgroups", TreatmentGroup.findAllTreatmentGroups());
        return "treatmentgrouplabels/findTreatmentGroupLabelsByTreatmentGroup";
    }
    
    @RequestMapping(params = "find=ByTreatmentGroup", method = RequestMethod.GET)
    public String TreatmentGroupLabelController.findTreatmentGroupLabelsByTreatmentGroup(@RequestParam("treatmentGroup") TreatmentGroup treatmentGroup, Model uiModel) {
        uiModel.addAttribute("treatmentgrouplabels", TreatmentGroupLabel.findTreatmentGroupLabelsByTreatmentGroup(treatmentGroup).getResultList());
        return "treatmentgrouplabels/list";
    }
    
}
