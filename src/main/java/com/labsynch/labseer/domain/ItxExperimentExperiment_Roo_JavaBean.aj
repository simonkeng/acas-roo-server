// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ItxExperimentExperiment;
import com.labsynch.labseer.domain.ItxExperimentExperimentState;
import java.util.Set;

privileged aspect ItxExperimentExperiment_Roo_JavaBean {
    
    public Experiment ItxExperimentExperiment.getFirstExperiment() {
        return this.firstExperiment;
    }
    
    public void ItxExperimentExperiment.setFirstExperiment(Experiment firstExperiment) {
        this.firstExperiment = firstExperiment;
    }
    
    public Experiment ItxExperimentExperiment.getSecondExperiment() {
        return this.secondExperiment;
    }
    
    public void ItxExperimentExperiment.setSecondExperiment(Experiment secondExperiment) {
        this.secondExperiment = secondExperiment;
    }
    
    public Set<ItxExperimentExperimentState> ItxExperimentExperiment.getLsStates() {
        return this.lsStates;
    }
    
    public void ItxExperimentExperiment.setLsStates(Set<ItxExperimentExperimentState> lsStates) {
        this.lsStates = lsStates;
    }
    
}
