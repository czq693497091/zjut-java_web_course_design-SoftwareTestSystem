package com.beans;

public class Admin extends Person implements java.io.Serializable{

    public Admin(){
        super.setType("admin");
    }
    public Admin(String no, String password, String name, String sex, String email){
        super(no,password,name,sex,email);
        super.setType("admin");
    }
}
