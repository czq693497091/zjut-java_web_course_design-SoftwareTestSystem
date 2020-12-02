package com.daos;
import com.beans.*;
import java.sql.*;
import java.util.ArrayList;

public class PersonDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";
    public int addPerson(Object p){

        Person person = (Person) p;
        String table = getPersonTable(person.getType());
        sql = "insert into " + table +" values(?,?,?,?,?,?)";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,person.getNo());
            conn.preparedStatement.setString(2,person.getName());
            conn.preparedStatement.setString(3,person.getPassword());
            conn.preparedStatement.setString(4,person.getSex());
            conn.preparedStatement.setString(5,person.getEmail());
            conn.preparedStatement.setString(6,person.getType());
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("用户信息插入失败！");
            e.printStackTrace();
            return -1;
        }
    }

    public int updatePerson(Person person){

//        Person person = (Person) p;
//        SqlConnect conn = new SqlConnect();
        String table = getPersonTable(person.getType());
        String no = table + "编号";
        String name = table + "姓名";
        String password = table + "密码";
        String sex = table + "性别";
        String email = table + "邮箱";
//        System.out.println(person.getNo());
//        System.out.println(person.getName());
//        System.out.println(person.getPassword());

        sql = "update "+table+" set "+name+"=?,"+password+"=?,"+sex+"=?,"+email+"=?,部门=? where "+no+"=?";
//        String sql = "update 项目经理 set 项目经理姓名=?,项目经理密码=?,项目经理性别=?,项目经理邮箱=?,部门=? where 项目经理编号=?";
//        System.out.println(sql);
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,person.getName());
            conn.preparedStatement.setString(2,person.getPassword());
            conn.preparedStatement.setString(3,person.getSex());
            conn.preparedStatement.setString(4,person.getEmail());
            conn.preparedStatement.setString(5,person.getType());
            conn.preparedStatement.setString(6,person.getNo());
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
            System.out.println("用户信息更新失败！");
            e.printStackTrace();
            return -1;
        }
    }

    //根据编号和部门类型筛选员工
    public ArrayList<Person> getPersonArrayList(String no,String dept){
//        SqlConnect conn = new SqlConnect();
        sql = "select * from 员工总表 where 1=1";
        if (!"".equals(no)) sql+=" and 编号=?";
        if (!"".equals(dept)) sql+=" and 部门=?";
        int count = 1;
//        String sql = "select * from "+dept;
        ArrayList<Person> personArrayList = new ArrayList<Person>();
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!"".equals(no)) conn.preparedStatement.setString(count++,no);
            if (!"".equals(dept)) conn.preparedStatement.setString(count++,dept);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                no = rs.getString(1);
                String name = rs.getString(2);
                String password = rs.getString(3);
                String sex = rs.getString(4);
                String email = rs.getString(5);
                String department = rs.getString(6);
                Person p = new Person(no,password,name,sex,email);
                p.setType(department);
                personArrayList.add(p);
            }
            rs.close();
//            conn.closeAll();
            return personArrayList;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("用户信息查找失败！");
            e.printStackTrace();
            return null;
        }
    }

    //根据编号查找指定人，用于用户登录
    public Person getPerson(String no){
//        SqlConnect conn = new SqlConnect();
        String table = getTable2(no);
        if("".equals(table)) return null;
        sql = "select * from "+table + " where "+table+"编号=?";
//        System.out.println(sql);
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,no);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                String name = rs.getString(2);
                String password = rs.getString(3);
                String sex = rs.getString(4);
                String email = rs.getString(5);
                String dept = rs.getString(6);
                Person p = new Person(no,password,name,sex,email);
                p.setType(dept);
                rs.close();
//                conn.closeAll();
                return p;
            }

        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("用户信息查找失败！");
            e.printStackTrace();
        }
        return null;
    }

    public int delete(String no){
        String personTable = this.getTable2(no);
        sql = "delete from "+personTable+" where "+personTable+"编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,no);
            conn.preparedStatement.executeUpdate();
            return 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    private String getPersonTable(String type){
        String table = "";
        switch (type){
            case "person":table = "管理员";break;
            case "projectManager":table = "项目经理";break;
            case "productManager":table = "产品经理";break;
            case "developer":table = "开发者";break;
            case "tester":table = "测试者";break;
            default:break;
        }
        return table;
    }

    private String getTable2(String no){//根据编号判断表名
        String table = "";
        if (no.startsWith("GLY")) table = "管理员";
        else if (no.startsWith("XMJL")) table = "项目经理";
        else if (no.startsWith("CPJL")) table = "产品经理";
        else if (no.startsWith("KFZ")) table = "开发者";
        else if (no.startsWith("CSZ")) table = "测试者";
        return table;
    }
}
