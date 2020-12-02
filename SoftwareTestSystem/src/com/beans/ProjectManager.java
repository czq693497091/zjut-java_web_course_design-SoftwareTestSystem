package com.beans;

public class ProjectManager extends Person implements java.io.Serializable{

    public ProjectManager(){
        super.setType("projectManager");
    }
    public ProjectManager(String no, String password, String name, String sex, String email){
        super(no,password,name,sex,email);
        super.setType("projectManager");
    }
}
