package com.realationDaos;

import com.beans.Person;
import com.daos.SqlConnect;
import com.mysql.fabric.HashShardMapping;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/*
* 包括项目任务、项目项目经理、项目产品经理、项目开发者、项目测试者
* */
public class ProjectRelationDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";

    public int addProjectTaskRelation(String projectNo,String taskNo){
        sql = "insert into 项目任务关系 values (?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.setString(2,taskNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int updateProjectTaskRelation(String originProjectNo,String originTaskNo,String newProjectNo,String newTaskNo){
        sql = "update 项目任务关系 set 项目编号=?,任务编号=? where 项目编号=? and 任务编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,newProjectNo);
            conn.preparedStatement.setString(2,newTaskNo);
            conn.preparedStatement.setString(3,originProjectNo);
            conn.preparedStatement.setString(4,newTaskNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int deleteProjectTaskRelation(String projectNo,String taskNo){
        sql = "delete from 项目任务关系 where 项目编号=? and 任务编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.setString(2,taskNo);
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

    public int addProjectProjectManagerRelation(String projectNo,String projectManagerNo){
        sql = "insert into 项目经理关系 values (?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.setString(2,projectManagerNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int updateProjectProjectManagerRelation(String originProjectNo,String originProjectManagerNo,String newProjectNo,String newProjectManagerNo){
        sql = "update 项目经理关系 set 项目编号=?,项目经理编号=? where 项目编号=? and 项目经理编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,newProjectNo);
            conn.preparedStatement.setString(2,newProjectManagerNo);
            conn.preparedStatement.setString(3,originProjectNo);
            conn.preparedStatement.setString(4,originProjectManagerNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }


    public int addProjectProductManagerRelation(String projectNo,String productManagerNo){
        sql = "insert into 项目产品经理关系 values (?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.setString(2,productManagerNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int updateProjectProductManagerRelation(String originProjectNo,String originProductManagerNo,String newProjectNo,String newProductManagerNo){
        sql = "update 项目产品经理关系 set 项目编号=?,产品经理编号=? where 项目编号=? and 产品经理编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,newProjectNo);
            conn.preparedStatement.setString(2,newProductManagerNo);
            conn.preparedStatement.setString(3,originProjectNo);
            conn.preparedStatement.setString(4,originProductManagerNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int addProjectDeveloperRelation(String projectNo,String DeveloperNo){
        sql = "insert into 项目开发者关系 values (?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.setString(2,DeveloperNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int updateProjectDeveloperRelation(String originProjectNo,String originDeveloperNo,String newProjectNo,String newDeveloperNo){
        sql = "update 项目开发者关系 set 项目编号=?,开发者编号=? where 项目编号=?,开发者编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,newProjectNo);
            conn.preparedStatement.setString(2,newDeveloperNo);
            conn.preparedStatement.setString(3,originProjectNo);
            conn.preparedStatement.setString(4,originDeveloperNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int addProjectTesterRelation(String projectNo,String TesterNo){
        sql = "insert into 项目测试者关系 values (?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.setString(2,TesterNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public int updateProjectTesterRelation(String originProjectNo,String originTesterNo,String newProjectNo,String newTesterNo){
        sql = "update 项目测试者关系 set 项目编号=?,测试者编号=? where 项目编号=? and 测试者编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,newProjectNo);
            conn.preparedStatement.setString(2,newTesterNo);
            conn.preparedStatement.setString(3,originProjectNo);
            conn.preparedStatement.setString(4,originTesterNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
            conn.closeAll();
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList< Map<String,String> > query(String no,String department,String projectNo){//查询所有员工
        sql = "select * from 项目员工关系视图新版 where 1=1";
        int count = 1;
        if(!"".equals(projectNo)) sql+=" and 项目编号=? ";
        if(!"".equals(no)) sql+=" and 编号=?";
        if (!"".equals(department)) sql+=" and 部门=?";
        ArrayList<Map<String,String> > arrayList = new ArrayList<Map<String, String> >();
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!"".equals(projectNo)) conn.preparedStatement.setString(count++,projectNo);
            if (!"".equals(no)) conn.preparedStatement.setString(count++,no);
            if (!"".equals(department)) conn.preparedStatement.setString(count++,department);

            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                HashMap<String,String> itemMap = new HashMap<String,String>();
                itemMap.put("no",rs.getString(1));
                itemMap.put("name",rs.getString(2));
                itemMap.put("password",rs.getString(3));
                itemMap.put("sex",rs.getString(4));
                itemMap.put("email",rs.getString(5));
                itemMap.put("department",rs.getString(6));
                itemMap.put("projectNo",rs.getString(7));
                arrayList.add(itemMap);
            }
            rs.close();
//            conn.closeAll();
            return arrayList;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return null;
    }

    public int deleteProjectWorkerRelation(String projectNo,String no){
        if (no.startsWith("XMJL")) sql = "delete from 项目经理关系 where 项目编号=? and 项目经理编号=?";
        else if (no.startsWith("CPJL")) sql = "delete from 项目产品经理关系 where 项目编号=? and 产品经理编号=?";
        else if (no.startsWith("KFZ")) sql = "delete from 项目开发者关系 where 项目编号=? and 开发者编号=?";
        else if (no.startsWith("CSZ")) sql = "delete from 项目测试者关系 where 项目编号=? and 测试者编号=?";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.setString(2,no);
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



}
