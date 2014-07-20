package com.labsynch.labseer.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.labsynch.labseer.domain.ItxProtocolProtocolValue;

@RequestMapping("/itxprotocolprotocolvalues")
@Controller
@RooWebScaffold(path = "itxprotocolprotocolvalues", formBackingObject = ItxProtocolProtocolValue.class)
@RooWebJson(jsonObject = ItxProtocolProtocolValue.class)
public class ItxProtocolProtocolValueController {
}
