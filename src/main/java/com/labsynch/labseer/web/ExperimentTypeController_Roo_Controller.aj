// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ExperimentType;
import com.labsynch.labseer.web.ExperimentTypeController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ExperimentTypeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ExperimentTypeController.create(@Valid ExperimentType experimentType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, experimentType);
            return "experimenttypes/create";
        }
        uiModel.asMap().clear();
        experimentType.persist();
        return "redirect:/experimenttypes/" + encodeUrlPathSegment(experimentType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ExperimentTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ExperimentType());
        return "experimenttypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ExperimentTypeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("experimenttype", ExperimentType.findExperimentType(id));
        uiModel.addAttribute("itemId", id);
        return "experimenttypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ExperimentTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("experimenttypes", ExperimentType.findExperimentTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) ExperimentType.countExperimentTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("experimenttypes", ExperimentType.findAllExperimentTypes());
        }
        return "experimenttypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ExperimentTypeController.update(@Valid ExperimentType experimentType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, experimentType);
            return "experimenttypes/update";
        }
        uiModel.asMap().clear();
        experimentType.merge();
        return "redirect:/experimenttypes/" + encodeUrlPathSegment(experimentType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ExperimentTypeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ExperimentType.findExperimentType(id));
        return "experimenttypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ExperimentTypeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ExperimentType experimentType = ExperimentType.findExperimentType(id);
        experimentType.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/experimenttypes";
    }
    
    void ExperimentTypeController.populateEditForm(Model uiModel, ExperimentType experimentType) {
        uiModel.addAttribute("experimentType", experimentType);
    }
    
    String ExperimentTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
