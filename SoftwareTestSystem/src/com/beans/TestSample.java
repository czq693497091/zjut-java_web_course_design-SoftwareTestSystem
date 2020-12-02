package com.beans;

public class TestSample implements java.io.Serializable{
    private String no = "";
    private String name = "";
    private String date = "";
    private String status = "";
    private String type = "";
    private String result = "";

    public TestSample() {
    }

    public TestSample(String no, String name, String date, String status, String type, String result) {
        this.no = no;
        this.name = name;
        this.date = date;
        this.status = status;
        this.type = type;
        this.result = result;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }


}
