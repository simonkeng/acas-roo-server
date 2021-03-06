// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsTag;
import com.labsynch.labseer.web.LsTagController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LsTagController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByTagTextEquals", "form" }, method = RequestMethod.GET)
    public String LsTagController.findLsTagsByTagTextEqualsForm(Model uiModel) {
        return "lstags/findLsTagsByTagTextEquals";
    }
    
    @RequestMapping(params = "find=ByTagTextEquals", method = RequestMethod.GET)
    public String LsTagController.findLsTagsByTagTextEquals(@RequestParam("tagText") String tagText, Model uiModel) {
        uiModel.addAttribute("lstags", LsTag.findLsTagsByTagTextEquals(tagText).getResultList());
        return "lstags/list";
    }
    
    @RequestMapping(params = { "find=ByTagTextLike", "form" }, method = RequestMethod.GET)
    public String LsTagController.findLsTagsByTagTextLikeForm(Model uiModel) {
        return "lstags/findLsTagsByTagTextLike";
    }
    
    @RequestMapping(params = "find=ByTagTextLike", method = RequestMethod.GET)
    public String LsTagController.findLsTagsByTagTextLike(@RequestParam("tagText") String tagText, Model uiModel) {
        uiModel.addAttribute("lstags", LsTag.findLsTagsByTagTextLike(tagText).getResultList());
        return "lstags/list";
    }
    
}
