package com.daos;

import com.beans.Bug;

import java.sql.ResultSet;
import java.util.ArrayList;

public class BugDao extends AbstractDao{
    SqlConnect conn = new SqlConnect();
    String sql = "";


    public Object query(String no){

        sql = "select * from bug where BUG编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,no);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString(2);
                String type = rs.getString(3);
                String method = rs.getString(4);
                String date = rs.getString(5);
                Bug bug = new Bug(no,name,type,method,date);
                rs.close();
//                conn.closeAll();
                return bug;
            }
        }
        catch (Exception e){
            System.out.println("bug查找失败！");
            e.printStackTrace();

        }
        return null;
    }


    public ArrayList<Object> queryAll() {
        ArrayList<Object> bugList = new ArrayList<Object>();
        sql = "select * from bug";
        bugList.clear();
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while (rs.next()){
                String no = rs.getString(1);
                String name = rs.getString(2);
                String type = rs.getString(3);
                String method = rs.getString(4);
                String date = rs.getString(5);
                Bug bug = new Bug(no,name,type,method,date);
                bugList.add(bug);
            }
            rs.close();
//            conn.closeAll();
            return bugList;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("bug查找失败！");
            e.printStackTrace();

        }
        return null;
    }


    @Override
    public int add(Object obj) {
//        SqlConnect conn = new SqlConnect();
        sql = "insert into bug values(?,?,?,?,?)";
        Bug bug = (Bug)obj;
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,bug.getNo());
            conn.preparedStatement.setString(2,bug.getName());
            conn.preparedStatement.setString(3,bug.getType());
            conn.preparedStatement.setString(4,bug.getMethod());
            conn.preparedStatement.setString(5,bug.getDate());
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("bug添加失败！");
            e.printStackTrace();
            return -1;
        }

    }

    @Override
    public int update(Object obj) {
//        SqlConnect conn = new SqlConnect();
        Bug bug = (Bug)obj;
        sql = "update bug set BUG名称=?,类型=?,方案=?,执行时间=? where BUG编号=?";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,bug.getName());
            conn.preparedStatement.setString(2,bug.getType());
            conn.preparedStatement.setString(3,bug.getMethod());
            conn.preparedStatement.setString(4,bug.getDate());
            conn.preparedStatement.setString(5,bug.getNo());
            conn.preparedStatement.executeUpdate();
            conn.closeAll();
            return 1;
        }
        catch (Exception e){
            System.out.println("bug信息修改失败！");

        }
        return -1;
    }

    public int delete(String no){
//        SqlConnect conn = new SqlConnect();
        sql = "delete from bug where BUG编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,no);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
            return -1;
        }
    }

    public int queryByTypeAndMethod(String type,String method){ // 通过类型和方案筛选bug
        sql = "select count(*) from bug where 1=1";
        if (!type.equals("")) sql+=" and 类型=?";
        if (!method.equals("")) sql+=" and 方案=?";
        int count = 1;
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!type.equals("")) conn.preparedStatement.setString(count++,type);
            if (!method.equals("")) conn.preparedStatement.setString(count++,method);
            ResultSet rs = conn.preparedStatement.executeQuery();
            if (rs.next()) return rs.getInt(1);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
}
