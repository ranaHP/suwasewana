package com.suwasewana.model;

public class ComplainModel {
    protected String Title;
    protected String CType;
    protected String UType;
    protected String phi;
    protected String reason;

    public ComplainModel(String Title, String CType, String UType, String phi, String reason){
        super();
        this.Title=Title;
        this.CType=CType;
        this.UType=UType;
        this.phi=phi;
        this.reason=reason;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getCType() {
        return CType;
    }

    public void setCType(String CType) {
        this.CType = CType;
    }

    public String getUType() {
        return UType;
    }

    public void setUType(String UType) {
        this.UType = UType;
    }

    public String getPhi() {
        return phi;
    }

    public void setPhi(String phi) {
        this.phi = phi;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

}
