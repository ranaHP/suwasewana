package com.suwasewana.model;

public class AppointmentTypeModel {
    String typeNumber;
    String typeName;
    String typeDesc;

    public AppointmentTypeModel(
            String typeNumber,
            String typeName ){
         this.typeNumber = typeNumber;
         this.typeName = typeName;
    }

    public String getTypeNumber() {
        return typeNumber;
    }

    public void setTypeNumber(String typeNumber) {
        this.typeNumber = typeNumber;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}