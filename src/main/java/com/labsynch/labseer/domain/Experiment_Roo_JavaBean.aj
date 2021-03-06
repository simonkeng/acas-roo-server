// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ExperimentLabel;
import com.labsynch.labseer.domain.ExperimentState;
import com.labsynch.labseer.domain.ItxExperimentExperiment;
import com.labsynch.labseer.domain.LsTag;
import com.labsynch.labseer.domain.Protocol;
import java.util.Set;

privileged aspect Experiment_Roo_JavaBean {
    
    public String Experiment.getShortDescription() {
        return this.shortDescription;
    }
    
    public void Experiment.setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }
    
    public Protocol Experiment.getProtocol() {
        return this.protocol;
    }
    
    public void Experiment.setProtocol(Protocol protocol) {
        this.protocol = protocol;
    }
    
    public Set<ExperimentState> Experiment.getLsStates() {
        return this.lsStates;
    }
    
    public void Experiment.setLsStates(Set<ExperimentState> lsStates) {
        this.lsStates = lsStates;
    }
    
    public Set<ItxExperimentExperiment> Experiment.getFirstExperiments() {
        return this.firstExperiments;
    }
    
    public void Experiment.setFirstExperiments(Set<ItxExperimentExperiment> firstExperiments) {
        this.firstExperiments = firstExperiments;
    }
    
    public Set<ItxExperimentExperiment> Experiment.getSecondExperiments() {
        return this.secondExperiments;
    }
    
    public void Experiment.setSecondExperiments(Set<ItxExperimentExperiment> secondExperiments) {
        this.secondExperiments = secondExperiments;
    }
    
    public Set<AnalysisGroup> Experiment.getAnalysisGroups() {
        return this.analysisGroups;
    }
    
    public void Experiment.setAnalysisGroups(Set<AnalysisGroup> analysisGroups) {
        this.analysisGroups = analysisGroups;
    }
    
    public Set<ExperimentLabel> Experiment.getLsLabels() {
        return this.lsLabels;
    }
    
    public void Experiment.setLsLabels(Set<ExperimentLabel> lsLabels) {
        this.lsLabels = lsLabels;
    }
    
    public Set<LsTag> Experiment.getLsTags() {
        return this.lsTags;
    }
    
    public void Experiment.setLsTags(Set<LsTag> lsTags) {
        this.lsTags = lsTags;
    }
    
}
