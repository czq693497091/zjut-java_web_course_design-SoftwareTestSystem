package com.beans;

public class Tester extends Person implements java.io.Serializable{
    public Tester(){
        super.setType("tester");
    }
    public Tester(String no, String password, String name, String sex, String email){
        super(no,password,name,sex,email);
        super.setType("tester");
    }
}
