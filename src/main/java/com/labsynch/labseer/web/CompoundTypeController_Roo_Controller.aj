// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.CompoundType;
import com.labsynch.labseer.web.CompoundTypeController;
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

privileged aspect CompoundTypeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CompoundTypeController.create(@Valid CompoundType compoundType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, compoundType);
            return "compoundTypes/create";
        }
        uiModel.asMap().clear();
        compoundType.persist();
        return "redirect:/compoundTypes/" + encodeUrlPathSegment(compoundType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CompoundTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CompoundType());
        return "compoundTypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CompoundTypeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("compoundtype", CompoundType.findCompoundType(id));
        uiModel.addAttribute("itemId", id);
        return "compoundTypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CompoundTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("compoundtypes", CompoundType.findCompoundTypeEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) CompoundType.countCompoundTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("compoundtypes", CompoundType.findAllCompoundTypes(sortFieldName, sortOrder));
        }
        return "compoundTypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CompoundTypeController.update(@Valid CompoundType compoundType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, compoundType);
            return "compoundTypes/update";
        }
        uiModel.asMap().clear();
        compoundType.merge();
        return "redirect:/compoundTypes/" + encodeUrlPathSegment(compoundType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CompoundTypeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, CompoundType.findCompoundType(id));
        return "compoundTypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CompoundTypeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CompoundType compoundType = CompoundType.findCompoundType(id);
        compoundType.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/compoundTypes";
    }
    
    void CompoundTypeController.populateEditForm(Model uiModel, CompoundType compoundType) {
        uiModel.addAttribute("compoundType", compoundType);
    }
    
    String CompoundTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
