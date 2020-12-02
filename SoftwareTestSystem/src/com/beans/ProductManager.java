package com.beans;

public class ProductManager extends Person implements java.io.Serializable{
    public ProductManager(){
        super.setType("productManager");
    }
    public ProductManager(String no, String password, String name, String sex, String email){
        super(no,password,name,sex,email);
        super.setType("productManager");
    }
}
