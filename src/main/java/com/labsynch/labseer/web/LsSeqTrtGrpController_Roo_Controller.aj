// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsSeqTrtGrp;
import com.labsynch.labseer.web.LsSeqTrtGrpController;
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

privileged aspect LsSeqTrtGrpController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LsSeqTrtGrpController.create(@Valid LsSeqTrtGrp lsSeqTrtGrp, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, lsSeqTrtGrp);
            return "lsseqtrtgrps/create";
        }
        uiModel.asMap().clear();
        lsSeqTrtGrp.persist();
        return "redirect:/lsseqtrtgrps/" + encodeUrlPathSegment(lsSeqTrtGrp.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LsSeqTrtGrpController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LsSeqTrtGrp());
        return "lsseqtrtgrps/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LsSeqTrtGrpController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("lsseqtrtgrp", LsSeqTrtGrp.findLsSeqTrtGrp(id));
        uiModel.addAttribute("itemId", id);
        return "lsseqtrtgrps/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LsSeqTrtGrpController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsseqtrtgrps", LsSeqTrtGrp.findLsSeqTrtGrpEntries(firstResult, sizeNo));
            float nrOfPages = (float) LsSeqTrtGrp.countLsSeqTrtGrps() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsseqtrtgrps", LsSeqTrtGrp.findAllLsSeqTrtGrps());
        }
        return "lsseqtrtgrps/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LsSeqTrtGrpController.update(@Valid LsSeqTrtGrp lsSeqTrtGrp, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, lsSeqTrtGrp);
            return "lsseqtrtgrps/update";
        }
        uiModel.asMap().clear();
        lsSeqTrtGrp.merge();
        return "redirect:/lsseqtrtgrps/" + encodeUrlPathSegment(lsSeqTrtGrp.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LsSeqTrtGrpController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, LsSeqTrtGrp.findLsSeqTrtGrp(id));
        return "lsseqtrtgrps/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LsSeqTrtGrpController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LsSeqTrtGrp lsSeqTrtGrp = LsSeqTrtGrp.findLsSeqTrtGrp(id);
        lsSeqTrtGrp.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/lsseqtrtgrps";
    }
    
    void LsSeqTrtGrpController.populateEditForm(Model uiModel, LsSeqTrtGrp lsSeqTrtGrp) {
        uiModel.addAttribute("lsSeqTrtGrp", lsSeqTrtGrp);
    }
    
    String LsSeqTrtGrpController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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