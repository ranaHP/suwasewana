package com.suwasewana.model;

public class AssignTaskModel {

    protected String full_name;
    protected String to_phi;
    protected String title;
    protected String expire_date;
    protected String message;
    protected String status;


    public AssignTaskModel(
            String full_name,
            String to_phi,
            String title,
            String expire_date,
            String message,
            String status
    ){
        super();
        this.full_name=full_name;
        this.to_phi=to_phi;
        this.title=title;
        this.expire_date=expire_date;
        this.message=message;
        this.status=status;
    }

    public String getTo_phi() {
        return to_phi;
    }

    public void setTo_phi(String to_phi) {
        this.to_phi = to_phi;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getExpire_date() {
        return expire_date;
    }

    public void setExpire_date(String expire_date) {
        this.expire_date = expire_date;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
