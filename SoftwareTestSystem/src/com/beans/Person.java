package com.beans;

public class Person implements java.io.Serializable{ // 继承类
    private String no;
    private String password;
    private String name;
    private String sex;
    private String email;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Person() {
        this.no = "";
        this.password = "";
        this.name = "";
        this.sex = "";
        this.email = "";
    }

    public Person(String no, String password, String name, String sex, String email) {
        this.no = no;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.email = email;
    }

    public Person(String no, String password, String name, String sex, String email,String type) {
        this.no = no;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.email = email;
        this.type = type;
    }
}
