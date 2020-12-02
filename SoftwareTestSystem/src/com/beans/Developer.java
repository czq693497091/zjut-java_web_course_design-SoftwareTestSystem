package com.beans;

public class Developer extends Person implements java.io.Serializable{
    public Developer(){
        super.setType("developer");
    }
    public Developer(String no, String password, String name, String sex, String email){
        super(no,password,name,sex,email);
        super.setType("developer");
    }
}
