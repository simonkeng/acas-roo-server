// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxLsThingLsThing;
import com.labsynch.labseer.domain.ItxLsThingLsThingState;
import com.labsynch.labseer.domain.ItxLsThingLsThingValue;
import java.util.Set;

privileged aspect ItxLsThingLsThingState_Roo_JavaBean {
    
    public ItxLsThingLsThing ItxLsThingLsThingState.getItxLsThingLsThing() {
        return this.itxLsThingLsThing;
    }
    
    public void ItxLsThingLsThingState.setItxLsThingLsThing(ItxLsThingLsThing itxLsThingLsThing) {
        this.itxLsThingLsThing = itxLsThingLsThing;
    }
    
    public Set<ItxLsThingLsThingValue> ItxLsThingLsThingState.getLsValues() {
        return this.lsValues;
    }
    
    public void ItxLsThingLsThingState.setLsValues(Set<ItxLsThingLsThingValue> lsValues) {
        this.lsValues = lsValues;
    }
    
}
