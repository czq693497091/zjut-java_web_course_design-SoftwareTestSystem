package com.realationDaos;

import com.daos.SqlConnect;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TaskWorkerRelationDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";

    //任务员工关系的增删改查


    public int addTaskWorkerRelation(String taskNo,String productManagerNo,String developerNo,String testerNo){
        sql = "insert into 任务员工关系 values (?,?,?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,taskNo);
            conn.preparedStatement.setString(2,productManagerNo);
            conn.preparedStatement.setString(3,developerNo);
            conn.preparedStatement.setString(4,testerNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("任务员工关系添加失败！");
            e.printStackTrace();
            return -1;
        }
    }

    public int updateTaskWorkerRelation(String taskNo,String productManagerNo,String developerNo,String testerNo){
        sql = "update 任务员工关系 set 开发者编号=?,测试者编号=? where 任务编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,productManagerNo);
            conn.preparedStatement.setString(2,developerNo);
            conn.preparedStatement.setString(3,testerNo);
            conn.preparedStatement.setString(4,taskNo);
            conn.preparedStatement.executeUpdate();
            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("任务员工关系更新失败！");
            e.printStackTrace();
            return -1;
        }
    }
    
    //查询返回一个map<String,String>,对应字段对应属性
    //支持基于编号和状态的模糊查询
    public ArrayList< Map<String,String> > queryAllTaskWorkerRelation(String projectNo,String taskNo,String projectManagerNo,String productManagerNo,
                                                               String developerNo,String testerNo,String status){
        ArrayList< Map<String,String> > arrayList = new ArrayList< Map<String,String> >();
        sql = "select * from 任务总视图 where 1=1";
        int count = 1;
        if (!"".equals(projectNo)) sql+=" and 项目编号=?";
        if (!"".equals(taskNo)) sql+=" and 任务编号=?";
        if (!"".equals(projectManagerNo)) sql+= " and 项目经理编号=?";
        if (!"".equals(productManagerNo)) sql+=" and 产品经理编号=?";
        if (!"".equals(developerNo)) sql+=" and 开发者编号=?";
        if (!"".equals(testerNo)) sql+=" and 测试者编号=?";
        if (!"".equals(status)) sql+=" and 完成状态=?";

        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!"".equals(projectNo)) conn.preparedStatement.setString(count++,projectNo);
            if (!"".equals(taskNo)) conn.preparedStatement.setString(count++,taskNo);
            if (!"".equals(projectManagerNo)) conn.preparedStatement.setString(count++,projectManagerNo);
            if (!"".equals(productManagerNo)) conn.preparedStatement.setString(count++,productManagerNo);
            if (!"".equals(developerNo)) conn.preparedStatement.setString(count++,developerNo);
            if (!"".equals(testerNo)) conn.preparedStatement.setString(count++,testerNo);
            if (!"".equals(status)) conn.preparedStatement.setString(count++,status);

            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                Map<String,String> itemMap = new HashMap<String,String>();
                taskNo = rs.getString(1);
                projectNo = rs.getString(2);

                String taskName = rs.getString(3);
                projectManagerNo = rs.getString(4);
                String projectManagerName = rs.getString(5);
                productManagerNo = rs.getString(6);
                String productManagerName = rs.getString(7);
                developerNo = rs.getString(8);
                String developerName = rs.getString(9);
                testerNo = rs.getString(10);
                String testName = rs.getString(11);
                status = rs.getString(12);
                String startDate = rs.getString(13);
                String endDate = rs.getString(14);
                itemMap.put("taskNo",taskNo);
                itemMap.put("projectNo",projectNo);
                itemMap.put("taskName",taskName);
                itemMap.put("projectManagerNo",projectManagerNo);
                itemMap.put("projectManagerName",projectManagerName);
                itemMap.put("productManagerNo",productManagerNo);
                itemMap.put("productManagerName",productManagerName);
                itemMap.put("developerNo",developerNo);
                itemMap.put("developerName",developerName);
                itemMap.put("testerNo",testerNo);
                itemMap.put("testerName",testName);
                itemMap.put("status",status);
                itemMap.put("startDate",startDate);
                itemMap.put("endDate",endDate);
                arrayList.add(itemMap);
            }
            rs.close();
//            conn.closeAll();
            return arrayList;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("任务总视图查询失败！");
            e.printStackTrace();
            
        }
        return null;
    }

    public int deleteTaskWorkerRelation(String taskNo){
        sql = "delete from 任务员工关系 where 任务编号=?";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,taskNo);
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
