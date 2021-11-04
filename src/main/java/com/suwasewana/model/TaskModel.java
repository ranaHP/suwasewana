package com.suwasewana.model;

public class TaskModel {


    protected String Taskid;
    protected String title;
    protected String RPHIMessage;
    protected String phiid;
    protected String phiname;
    protected String posted_date;
    protected String expire_date;
    protected String status;
    protected String from;




    public TaskModel
    (
            String Taskid,
            String title,
            String RPHIMessage,
            String phiid,
            String phiname,
            String posted_date,
            String expire_date,
            String status,
            String from
    ){
        super();
         this.Taskid= Taskid;
         this.title= title;
         this.RPHIMessage= RPHIMessage;
         this.phiid= phiid;
         this.phiname= phiname;
         this.posted_date= posted_date;
         this.expire_date= expire_date;
         this.status= status;
            this.from= from;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTaskid() {
        return Taskid;
    }

    public void setTaskid(String taskid) {
        Taskid = taskid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRPHIMessage() {
        return RPHIMessage;
    }

    public void setRPHIMessage(String RPHIMessage) {
        this.RPHIMessage = RPHIMessage;
    }

    public String getPhiid() {
        return phiid;
    }

    public void setPhiid(String phiid) {
        this.phiid = phiid;
    }

    public String getPhiname() {
        return phiname;
    }

    public void setPhiname(String phiname) {
        this.phiname = phiname;
    }

    public String getPosted_date() {
        return posted_date;
    }

    public void setPosted_date(String posted_date) {
        this.posted_date = posted_date;
    }

    public String getExpire_date() {
        return expire_date;
    }

    public void setExpire_date(String expire_date) {
        this.expire_date = expire_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
