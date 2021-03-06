package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsSeqProtocol;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lsseqprotocols")
@Controller
@RooWebScaffold(path = "lsseqprotocols", formBackingObject = LsSeqProtocol.class)
public class LsSeqProtocolController {
}
