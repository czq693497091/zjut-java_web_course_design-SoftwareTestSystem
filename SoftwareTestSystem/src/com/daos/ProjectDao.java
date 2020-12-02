package com.daos;

import com.beans.Project;

import java.sql.ResultSet;
import java.util.ArrayList;

public class ProjectDao extends AbstractDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";
    ArrayList<Object> arrayList = new ArrayList<Object>();

    @Override
    public int add(Object obj) {

        Project project = (Project)obj;
        sql = "insert into 项目 values(?,?,?,?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,project.getNo());
            conn.preparedStatement.setString(2,project.getName());
            conn.preparedStatement.setString(3,project.getStartDate());
            conn.preparedStatement.setString(4,project.getEndDate());
            conn.preparedStatement.setString(5,project.getStatus());
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
            conn.closeAll();
            System.out.println("项目添加失败！");
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public int update(Object obj) {
        SqlConnect conn = new SqlConnect();
        Project project = (Project)obj;
        sql = "update 项目 set 项目名称=?,开始日期=?,截止日期=?,完成状态=? where 项目编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,project.getName());
            conn.preparedStatement.setString(2,project.getStartDate());
            conn.preparedStatement.setString(3,project.getEndDate());
            conn.preparedStatement.setString(4,project.getStatus());
            conn.preparedStatement.setString(5,project.getNo());
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("项目信息更新失败！");
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public ArrayList<Object> queryAll() {
//        SqlConnect conn = new SqlConnect();
        arrayList.clear();
        sql = "select * from 项目";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                String no = rs.getString(1);
                String name = rs.getString(2);
                String startDate = rs.getString(3);
                String endDate = rs.getString(4);
                String status = rs.getString(5);
                Project project = new Project(no,name,startDate,endDate,status);
                arrayList.add(project);

            }
            rs.close();
//            conn.closeAll();
            return arrayList;
        }
        catch (Exception e){
            System.out.println("项目信息查询失败！");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Object query(String no) {
//        SqlConnect conn = new SqlConnect();
        sql = "select * from 项目 where 项目编号=?";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,no);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                String name = rs.getString(2);
                String startDate = rs.getString(3);
                String endDate = rs.getString(4);
                String status = rs.getString(5);
                Project project = new Project(no,name,startDate,endDate,status);
                rs.close();
//                conn.closeAll();
                return project;
            }
        }
        catch (Exception e){
            System.out.println("项目信息查询失败！");
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Project> query(String projectNo,String projectName,String status){
//        SqlConnect conn = new SqlConnect();
        sql = "select * from 项目 where 1=1";
        ArrayList<Project> arrayList = new ArrayList<Project>();
        int count = 1;
        if (!"".equals(projectNo)) sql+=" and 项目编号=?";
        if (!"".equals(projectName)) sql+=" and 项目名称=?";
        if (!"".equals(status)) sql+=" and 完成状态=?";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!"".equals(projectNo)) conn.preparedStatement.setString(count++,projectNo);
            if (!"".equals(projectName)) conn.preparedStatement.setString(count++,projectName);
            if (!"".equals(status)) conn.preparedStatement.setString(count++,status);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                Project project = new Project();
                project.setNo(rs.getString(1));
                project.setName(rs.getString(2));
                project.setStartDate(rs.getString(3));
                project.setEndDate(rs.getString(4));
                project.setStatus(rs.getString(5));
                arrayList.add(project);
            }
//            conn.closeAll();
            return arrayList;
        }
        catch (Exception e){
//            conn.closeAll();
            e.printStackTrace();
        }
        return null;
    }

    public int queryByStatus(String type){
        sql = "select count(项目编号) from 项目 where 1=1";
        if (!type.equals("")) sql+=" and 完成状态=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!type.equals("")) conn.preparedStatement.setString(1,type);
            ResultSet rs = conn.preparedStatement.executeQuery();
            if (rs.next()) return rs.getInt(1);
        }
        catch (Exception e){
            e.printStackTrace();

        }
        return -1;
    }

    public int delete(String projectNo){
        sql = "delete from 项目 where 项目编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,projectNo);
            conn.preparedStatement.executeUpdate();
            return 1;
        }catch (Exception e){

            e.printStackTrace();
        }
        return -1;
    }
}
