// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ExperimentLabel;
import com.labsynch.labseer.web.ExperimentLabelController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ExperimentLabelController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByExperiment", "form" }, method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByExperimentForm(Model uiModel) {
        uiModel.addAttribute("experiments", Experiment.findAllExperiments());
        return "experimentlabels/findExperimentLabelsByExperiment";
    }
    
    @RequestMapping(params = "find=ByExperiment", method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByExperiment(@RequestParam("experiment") Experiment experiment, Model uiModel) {
        uiModel.addAttribute("experimentlabels", ExperimentLabel.findExperimentLabelsByExperiment(experiment).getResultList());
        return "experimentlabels/list";
    }
    
    @RequestMapping(params = { "find=ByLabelTextLike", "form" }, method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByLabelTextLikeForm(Model uiModel) {
        return "experimentlabels/findExperimentLabelsByLabelTextLike";
    }
    
    @RequestMapping(params = "find=ByLabelTextLike", method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByLabelTextLike(@RequestParam("labelText") String labelText, Model uiModel) {
        uiModel.addAttribute("experimentlabels", ExperimentLabel.findExperimentLabelsByLabelTextLike(labelText).getResultList());
        return "experimentlabels/list";
    }
    
    @RequestMapping(params = { "find=ByLabelTextLikeAndLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot", "form" }, method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByLabelTextLikeAndLsTypeAndKindEqualsAndPreferredNotAndIgnoredNotForm(Model uiModel) {
        return "experimentlabels/findExperimentLabelsByLabelTextLikeAndLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot";
    }
    
    @RequestMapping(params = "find=ByLabelTextLikeAndLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot", method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByLabelTextLikeAndLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot(@RequestParam("labelText") String labelText, @RequestParam("lsTypeAndKind") String lsTypeAndKind, @RequestParam(value = "preferred", required = false) boolean preferred, @RequestParam(value = "ignored", required = false) boolean ignored, Model uiModel) {
        uiModel.addAttribute("experimentlabels", ExperimentLabel.findExperimentLabelsByLabelTextLikeAndLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot(labelText, lsTypeAndKind, preferred, ignored).getResultList());
        return "experimentlabels/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot", "form" }, method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByLsTypeAndKindEqualsAndPreferredNotAndIgnoredNotForm(Model uiModel) {
        return "experimentlabels/findExperimentLabelsByLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot";
    }
    
    @RequestMapping(params = "find=ByLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot", method = RequestMethod.GET)
    public String ExperimentLabelController.findExperimentLabelsByLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot(@RequestParam("lsTypeAndKind") String lsTypeAndKind, @RequestParam(value = "preferred", required = false) boolean preferred, @RequestParam(value = "ignored", required = false) boolean ignored, Model uiModel) {
        uiModel.addAttribute("experimentlabels", ExperimentLabel.findExperimentLabelsByLsTypeAndKindEqualsAndPreferredNotAndIgnoredNot(lsTypeAndKind, preferred, ignored).getResultList());
        return "experimentlabels/list";
    }
    
}
