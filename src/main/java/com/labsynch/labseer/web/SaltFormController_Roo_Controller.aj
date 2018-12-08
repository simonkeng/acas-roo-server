// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.BulkLoadFile;
import com.labsynch.labseer.domain.IsoSalt;
import com.labsynch.labseer.domain.Lot;
import com.labsynch.labseer.domain.Parent;
import com.labsynch.labseer.domain.SaltForm;
import com.labsynch.labseer.web.SaltFormController;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;

privileged aspect SaltFormController_Roo_Controller {
    
    void SaltFormController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("saltForm_registrationdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    void SaltFormController.populateEditForm(Model uiModel, SaltForm saltForm) {
        uiModel.addAttribute("saltForm", saltForm);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("bulkloadfiles", BulkLoadFile.findAllBulkLoadFiles());
        uiModel.addAttribute("isosalts", IsoSalt.findAllIsoSalts());
        uiModel.addAttribute("lots", Lot.findAllLots());
        uiModel.addAttribute("parents", Parent.findAllParents());
    }
    
}
