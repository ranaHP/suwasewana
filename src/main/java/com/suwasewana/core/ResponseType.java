package com.suwasewana.core;

public class ResponseType {

    private String status;

    private String data;

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ResponseType(String status, String data) {
        this.data = data;
        this.status = status;
    }
}
