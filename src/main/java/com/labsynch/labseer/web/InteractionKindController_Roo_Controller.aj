// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.InteractionKind;
import com.labsynch.labseer.domain.InteractionType;
import com.labsynch.labseer.web.InteractionKindController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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

privileged aspect InteractionKindController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InteractionKindController.create(@Valid InteractionKind interactionKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, interactionKind);
            return "interactionkinds/create";
        }
        uiModel.asMap().clear();
        interactionKind.persist();
        return "redirect:/interactionkinds/" + encodeUrlPathSegment(interactionKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InteractionKindController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InteractionKind());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (InteractionType.countInteractionTypes() == 0) {
            dependencies.add(new String[] { "interactiontype", "interactiontypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "interactionkinds/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InteractionKindController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("interactionkind", InteractionKind.findInteractionKind(id));
        uiModel.addAttribute("itemId", id);
        return "interactionkinds/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InteractionKindController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("interactionkinds", InteractionKind.findInteractionKindEntries(firstResult, sizeNo));
            float nrOfPages = (float) InteractionKind.countInteractionKinds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("interactionkinds", InteractionKind.findAllInteractionKinds());
        }
        return "interactionkinds/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InteractionKindController.update(@Valid InteractionKind interactionKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, interactionKind);
            return "interactionkinds/update";
        }
        uiModel.asMap().clear();
        interactionKind.merge();
        return "redirect:/interactionkinds/" + encodeUrlPathSegment(interactionKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InteractionKindController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, InteractionKind.findInteractionKind(id));
        return "interactionkinds/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InteractionKindController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InteractionKind interactionKind = InteractionKind.findInteractionKind(id);
        interactionKind.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/interactionkinds";
    }
    
    void InteractionKindController.populateEditForm(Model uiModel, InteractionKind interactionKind) {
        uiModel.addAttribute("interactionKind", interactionKind);
        uiModel.addAttribute("interactiontypes", InteractionType.findAllInteractionTypes());
    }
    
    String InteractionKindController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
