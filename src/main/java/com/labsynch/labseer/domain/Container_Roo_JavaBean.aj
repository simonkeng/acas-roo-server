// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Container;
import com.labsynch.labseer.domain.ContainerLabel;
import com.labsynch.labseer.domain.ContainerState;
import com.labsynch.labseer.domain.ItxContainerContainer;
import com.labsynch.labseer.domain.ItxSubjectContainer;
import java.util.Set;

privileged aspect Container_Roo_JavaBean {
    
    public Long Container.getLocationId() {
        return this.locationId;
    }
    
    public void Container.setLocationId(Long locationId) {
        this.locationId = locationId;
    }
    
    public int Container.getRowIndex() {
        return this.rowIndex;
    }
    
    public void Container.setRowIndex(int rowIndex) {
        this.rowIndex = rowIndex;
    }
    
    public int Container.getColumnIndex() {
        return this.columnIndex;
    }
    
    public void Container.setColumnIndex(int columnIndex) {
        this.columnIndex = columnIndex;
    }
    
    public Set<ContainerLabel> Container.getLsLabels() {
        return this.lsLabels;
    }
    
    public void Container.setLsLabels(Set<ContainerLabel> lsLabels) {
        this.lsLabels = lsLabels;
    }
    
    public Set<ContainerState> Container.getLsStates() {
        return this.lsStates;
    }
    
    public void Container.setLsStates(Set<ContainerState> lsStates) {
        this.lsStates = lsStates;
    }
    
    public Set<ItxContainerContainer> Container.getFirstContainers() {
        return this.firstContainers;
    }
    
    public void Container.setFirstContainers(Set<ItxContainerContainer> firstContainers) {
        this.firstContainers = firstContainers;
    }
    
    public Set<ItxContainerContainer> Container.getSecondContainers() {
        return this.secondContainers;
    }
    
    public void Container.setSecondContainers(Set<ItxContainerContainer> secondContainers) {
        this.secondContainers = secondContainers;
    }
    
    public Set<ItxSubjectContainer> Container.getSubjects() {
        return this.subjects;
    }
    
    public void Container.setSubjects(Set<ItxSubjectContainer> subjects) {
        this.subjects = subjects;
    }
    
}
