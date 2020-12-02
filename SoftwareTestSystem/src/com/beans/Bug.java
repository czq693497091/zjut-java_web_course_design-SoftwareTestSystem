package com.beans;

public class Bug implements java.io.Serializable {
    private String no = "";
    private String name = "";
    private String date = "";
    private String type = "";
    private String method = "";

    public Bug(String no, String name, String date, String type, String method) {
        this.no = no;
        this.name = name;
        this.date = date;
        this.type = type;
        this.method = method;
    }

    public Bug() {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
}
