// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Lot;
import com.labsynch.labseer.domain.LotAlias;
import com.labsynch.labseer.web.LotAliasController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LotAliasController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByAliasNameEqualsAndLsTypeEqualsAndLsKindEquals", "form" }, method = RequestMethod.GET)
    public String LotAliasController.findLotAliasesByAliasNameEqualsAndLsTypeEqualsAndLsKindEqualsForm(Model uiModel) {
        return "lotaliases/findLotAliasesByAliasNameEqualsAndLsTypeEqualsAndLsKindEquals";
    }
    
    @RequestMapping(params = "find=ByAliasNameEqualsAndLsTypeEqualsAndLsKindEquals", method = RequestMethod.GET)
    public String LotAliasController.findLotAliasesByAliasNameEqualsAndLsTypeEqualsAndLsKindEquals(@RequestParam("aliasName") String aliasName, @RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lotaliases", LotAlias.findLotAliasesByAliasNameEqualsAndLsTypeEqualsAndLsKindEquals(aliasName, lsType, lsKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LotAlias.countFindLotAliasesByAliasNameEqualsAndLsTypeEqualsAndLsKindEquals(aliasName, lsType, lsKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lotaliases", LotAlias.findLotAliasesByAliasNameEqualsAndLsTypeEqualsAndLsKindEquals(aliasName, lsType, lsKind, sortFieldName, sortOrder).getResultList());
        }
        return "lotaliases/list";
    }
    
    @RequestMapping(params = { "find=ByLot", "form" }, method = RequestMethod.GET)
    public String LotAliasController.findLotAliasesByLotForm(Model uiModel) {
        uiModel.addAttribute("lots", Lot.findAllLots());
        return "lotaliases/findLotAliasesByLot";
    }
    
    @RequestMapping(params = "find=ByLot", method = RequestMethod.GET)
    public String LotAliasController.findLotAliasesByLot(@RequestParam("lot") Lot lot, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lotaliases", LotAlias.findLotAliasesByLot(lot, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LotAlias.countFindLotAliasesByLot(lot) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lotaliases", LotAlias.findLotAliasesByLot(lot, sortFieldName, sortOrder).getResultList());
        }
        return "lotaliases/list";
    }
    
    @RequestMapping(params = { "find=ByLotAndLsTypeEqualsAndLsKindEquals", "form" }, method = RequestMethod.GET)
    public String LotAliasController.findLotAliasesByLotAndLsTypeEqualsAndLsKindEqualsForm(Model uiModel) {
        uiModel.addAttribute("lots", Lot.findAllLots());
        return "lotaliases/findLotAliasesByLotAndLsTypeEqualsAndLsKindEquals";
    }
    
    @RequestMapping(params = "find=ByLotAndLsTypeEqualsAndLsKindEquals", method = RequestMethod.GET)
    public String LotAliasController.findLotAliasesByLotAndLsTypeEqualsAndLsKindEquals(@RequestParam("lot") Lot lot, @RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lotaliases", LotAlias.findLotAliasesByLotAndLsTypeEqualsAndLsKindEquals(lot, lsType, lsKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LotAlias.countFindLotAliasesByLotAndLsTypeEqualsAndLsKindEquals(lot, lsType, lsKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lotaliases", LotAlias.findLotAliasesByLotAndLsTypeEqualsAndLsKindEquals(lot, lsType, lsKind, sortFieldName, sortOrder).getResultList());
        }
        return "lotaliases/list";
    }
    
}
