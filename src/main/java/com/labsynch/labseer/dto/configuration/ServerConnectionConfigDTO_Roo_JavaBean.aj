// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto.configuration;

import com.labsynch.labseer.dto.configuration.ServerConnectionConfigDTO;

privileged aspect ServerConnectionConfigDTO_Roo_JavaBean {
    
    public boolean ServerConnectionConfigDTO.isConnectToServer() {
        return this.connectToServer;
    }
    
    public void ServerConnectionConfigDTO.setConnectToServer(boolean connectToServer) {
        this.connectToServer = connectToServer;
    }
    
    public String ServerConnectionConfigDTO.getBaseServerURL() {
        return this.baseServerURL;
    }
    
    public void ServerConnectionConfigDTO.setBaseServerURL(String baseServerURL) {
        this.baseServerURL = baseServerURL;
    }
    
    public String ServerConnectionConfigDTO.getLogoutURL() {
        return this.logoutURL;
    }
    
    public void ServerConnectionConfigDTO.setLogoutURL(String logoutURL) {
        this.logoutURL = logoutURL;
    }
    
    public String ServerConnectionConfigDTO.getAcasURL() {
        return this.acasURL;
    }
    
    public void ServerConnectionConfigDTO.setAcasURL(String acasURL) {
        this.acasURL = acasURL;
    }
    
    public String ServerConnectionConfigDTO.getAcasAppURL() {
        return this.acasAppURL;
    }
    
    public void ServerConnectionConfigDTO.setAcasAppURL(String acasAppURL) {
        this.acasAppURL = acasAppURL;
    }
    
}
