package com.suwasewana.model;

public class ComplainTypeModel {


    protected String CType;
    protected String Type;


    public ComplainTypeModel
    (String CType, String Type){
        super();
        this.CType=CType;
        this.Type=Type;
    }

    public String getCType() {
        return CType;
    }

    public void setCType(String CType) {
        this.CType = CType;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public void add(ComplainTypeModel temp) {
    }
}
