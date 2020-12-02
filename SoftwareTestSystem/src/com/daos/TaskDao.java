package com.daos;

import com.beans.Task;

import java.sql.ResultSet;
import java.util.ArrayList;

public class TaskDao extends AbstractDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";
    ArrayList<Object> arrayList = new ArrayList<Object>();

    @Override
    public int add(Object obj) {
        Task task = (Task) obj;
        sql = "insert into 任务 values(?,?,?,?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, task.getNo());
            conn.preparedStatement.setString(2, task.getName());
            conn.preparedStatement.setString(3, task.getStatus());
            conn.preparedStatement.setString(4, task.getStartDate());
            conn.preparedStatement.setString(5, task.getEndDate());

            conn.preparedStatement.executeUpdate();
            conn.closeAll();
            return 1;
        } catch (Exception e) {
            System.out.println("任务添加失败！");
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public int update(Object obj) {
        Task task = (Task) obj;
        sql = "update 任务 set 任务名称=?,开始日期=?,截止日期=?,完成状态=? where 任务编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, task.getName());
            conn.preparedStatement.setString(2, task.getStartDate());
            conn.preparedStatement.setString(3, task.getEndDate());
            conn.preparedStatement.setString(4, task.getStatus());
            conn.preparedStatement.setString(5, task.getNo());
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        } catch (Exception e) {
            System.out.println("任务信息更新失败！");
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public ArrayList<Object> queryAll() {
        arrayList.clear();
        sql = "select * from 任务";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while (rs.next()) {
                String no = rs.getString(1);
                String name = rs.getString(2);
                String startDate = rs.getString(3);
                String endDate = rs.getString(4);
                String status = rs.getString(5);
                Task task = new Task(no, name, startDate, endDate, status);
                arrayList.add(task);

            }
            rs.close();
//            conn.closeAll();
            return arrayList;
        } catch (Exception e) {
            System.out.println("任务信息查询失败！");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Object query(String no) {
        sql = "select * from 任务 where 任务编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, no);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2);
                String startDate = rs.getString(3);
                String endDate = rs.getString(4);
                String status = rs.getString(5);
                Task task = new Task(no, name, startDate, endDate, status);
                rs.close();
//                conn.closeAll();
                return task;
            }
        } catch (Exception e) {
//            conn.closeAll();
            System.out.println("任务信息查询失败！");
            e.printStackTrace();
        }
        return null;
    }

    public int delete(String taskNo) {
        sql = "delete from 任务 where 任务编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, taskNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        } catch (Exception e) {
//            conn.closeAll();
            e.printStackTrace();
            return -1;
        }
    }

    public int queryByType(String type) {
        sql = "select count(任务编号) from 任务 where 1=1";
        if (!type.equals("")) sql += " and 完成状态=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!type.equals("")) conn.preparedStatement.setString(1, type);
            ResultSet rs = conn.preparedStatement.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return -1;
    }
}
