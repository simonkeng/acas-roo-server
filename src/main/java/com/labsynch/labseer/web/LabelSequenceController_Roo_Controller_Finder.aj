// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LabelSequence;
import com.labsynch.labseer.web.LabelSequenceController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LabelSequenceController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByLabelTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByLabelTypeAndKindEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByLabelTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByLabelTypeAndKindEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByLabelTypeAndKindEquals(@RequestParam("labelTypeAndKind") String labelTypeAndKind, Model uiModel) {
        uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByLabelTypeAndKindEquals(labelTypeAndKind).getResultList());
        return "labelsequences/list";
    }
    
    @RequestMapping(params = { "find=ByThingTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByThingTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByThingTypeAndKindEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEquals(@RequestParam("thingTypeAndKind") String thingTypeAndKind, Model uiModel) {
        uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEquals(thingTypeAndKind).getResultList());
        return "labelsequences/list";
    }
    
    @RequestMapping(params = { "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals(@RequestParam("thingTypeAndKind") String thingTypeAndKind, @RequestParam("labelTypeAndKind") String labelTypeAndKind, Model uiModel) {
        uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals(thingTypeAndKind, labelTypeAndKind).getResultList());
        return "labelsequences/list";
    }
    
    @RequestMapping(params = { "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals";
    }
    
    @RequestMapping(params = "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals(@RequestParam("thingTypeAndKind") String thingTypeAndKind, @RequestParam("labelTypeAndKind") String labelTypeAndKind, @RequestParam("labelPrefix") String labelPrefix, Model uiModel) {
        uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals(thingTypeAndKind, labelTypeAndKind, labelPrefix).getResultList());
        return "labelsequences/list";
    }
    
}
