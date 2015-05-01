// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ItxLsThingLsThing;
import com.labsynch.labseer.web.ItxLsThingLsThingController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ItxLsThingLsThingController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByCodeNameEquals", "form" }, method = RequestMethod.GET)
    public String ItxLsThingLsThingController.findItxLsThingLsThingsByCodeNameEqualsForm(Model uiModel) {
        return "itxlsthinglsthings/findItxLsThingLsThingsByCodeNameEquals";
    }
    
    @RequestMapping(params = "find=ByCodeNameEquals", method = RequestMethod.GET)
    public String ItxLsThingLsThingController.findItxLsThingLsThingsByCodeNameEquals(@RequestParam("codeName") String codeName, Model uiModel) {
        uiModel.addAttribute("itxlsthinglsthings", ItxLsThingLsThing.findItxLsThingLsThingsByCodeNameEquals(codeName).getResultList());
        return "itxlsthinglsthings/list";
    }
    
}