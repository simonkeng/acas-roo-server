package com.labsynch.labseer.web;
import com.labsynch.labseer.domain.BulkLoadTemplate;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/bulkloadtemplates")
@Controller
@RooWebScaffold(path = "bulkloadtemplates", formBackingObject = BulkLoadTemplate.class)
@RooWebFinder
public class BulkLoadTemplateController {
}
