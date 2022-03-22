package com.suwasewana.model;

public class DiseaseReportModel {

    protected String DiseaseName;
    protected String Count1;
    protected String Count2;
    protected String Count3;
    protected String Count4;
    protected String Count5;
    protected String Count6;
    protected String mohid;
    protected String Date1;
    protected String Date2;


    public DiseaseReportModel
    (String DiseaseName,
        String Count1,
        String Count2,
        String Count3,
        String Count4,
        String Count5,
        String Count6,
        String mohid,
     String Date1,
    String Date2){
        super();
        this.DiseaseName=DiseaseName;
        this.Count1=Count1;
        this.Count2=Count2;
        this.Count3=Count3;
        this.Count4=Count4;
        this.Count5=Count5;
        this.Count6=Count6;
        this.mohid=mohid;
        this.Date1=Date1;
        this.Date2=Date2;
    }

    public String getDate1() {
        return Date1;
    }

    public void setDate1(String date1) {
        Date1 = date1;
    }

    public String getDate2() {
        return Date2;
    }

    public void setDate2(String date2) {
        Date2 = date2;
    }

    public String getDiseaseName() {
        return DiseaseName;
    }

    public void setDiseaseName(String diseaseName) {
        DiseaseName = diseaseName;
    }

    public String getCount1() {
        return Count1;
    }

    public void setCount1(String count1) {
        Count1 = count1;
    }

    public String getCount2() {
        return Count2;
    }

    public void setCount2(String count2) {
        Count2 = count2;
    }

    public String getCount3() {
        return Count3;
    }

    public void setCount3(String count3) {
        Count3 = count3;
    }

    public String getCount4() {
        return Count4;
    }

    public void setCount4(String count4) {
        Count4 = count4;
    }

    public String getCount5() {
        return Count5;
    }

    public void setCount5(String count5) {
        Count5 = count5;
    }

    public String getCount6() {
        return Count6;
    }

    public void setCount6(String count6) {
        Count6 = count6;
    }

    public String getMohid() {
        return mohid;
    }

    public void setMohid(String mohid) {
        this.mohid = mohid;
    }
}
