package com.daos;

import com.beans.TestSample;

import java.sql.ResultSet;
import java.util.ArrayList;

public class TestSampleDao extends AbstractDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";
    ArrayList<Object> arrayList = new ArrayList<Object>();

    @Override
    public int add(Object obj) {
        TestSample testSample = (TestSample) obj;
        sql = "insert into 测试用例 values(?,?,?,?,?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, testSample.getNo());
            conn.preparedStatement.setString(2, testSample.getName());
            conn.preparedStatement.setString(3, testSample.getType());
            conn.preparedStatement.setString(4, testSample.getResult());
            conn.preparedStatement.setString(5, testSample.getStatus());
            conn.preparedStatement.setString(6, testSample.getDate());
            conn.preparedStatement.executeUpdate();
            conn.closeAll();
            return 1;
        } catch (Exception e) {
            conn.closeAll();
            System.out.println("测试用例添加失败！");
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public int update(Object obj) {
        TestSample testSample = (TestSample) obj;
        sql = "update 测试用例 set 测试用例名称=?,类型=?,结果=?,状态=?,执行时间=? where 测试用例编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, testSample.getName());
            conn.preparedStatement.setString(2, testSample.getType());
            conn.preparedStatement.setString(3, testSample.getResult());
            conn.preparedStatement.setString(4, testSample.getStatus());
            conn.preparedStatement.setString(5, testSample.getDate());
            conn.preparedStatement.setString(6, testSample.getNo());
            conn.preparedStatement.executeUpdate();
            conn.closeAll();
            return 1;
        } catch (Exception e) {
            conn.closeAll();
            System.out.println("测试用例更新失败！");
            e.printStackTrace();
        }
        return -1;

    }

    @Override
    public ArrayList<Object> queryAll() {
        arrayList.clear();
        sql = "select * from 测试用例";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.executeUpdate();
            ResultSet rs = conn.preparedStatement.executeQuery();
            while (rs.next()) {
                String no = rs.getString(1);
                String name = rs.getString(2);
                String type = rs.getString(3);
                String result = rs.getString(4);
                String status = rs.getString(5);
                String date = rs.getString(6);
                TestSample testSample = new TestSample(no, name, type, result, status, date);
                arrayList.add(testSample);
            }
            rs.close();
            conn.closeAll();
            return arrayList;
        } catch (Exception e) {
            conn.closeAll();
            System.out.println("测试用例查询失败！");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Object query(String no) {
        sql = "select * from 测试用例 where 测试用例编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, no);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2);
                String type = rs.getString(3);
                String result = rs.getString(4);
                String status = rs.getString(5);
                String date = rs.getString(6);
                TestSample testSample = new TestSample(no, name, type, result, status, date);
                rs.close();
//                conn.closeAll();
                return testSample;
            }
        } catch (Exception e) {
            conn.closeAll();
            System.out.println("测试用例查询失败");
            e.printStackTrace();
        }

        return null;
    }

    public int delete(String no) {
        sql = "delete from 测试用例 where  测试用例编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1, no);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        } catch (Exception e) {
//            conn.closeAll();
            e.printStackTrace();
            return -1;
        }
    }

    public int queryByTypeAndResultAndStatus(String type, String result, String status) {
        sql = "select count(测试用例编号) from 测试用例 where 1=1";
        if (!type.equals("")) sql += " and 类型=?";
        if (!result.equals("")) sql += " and 结果=?";
        if (!status.equals("")) sql += " and 状态=?";
        int count = 1;
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!type.equals("")) conn.preparedStatement.setString(count++, type);
            if (!result.equals("")) conn.preparedStatement.setString(count++, result);
            if (!status.equals("")) conn.preparedStatement.setString(count++, status);
            ResultSet rs = conn.preparedStatement.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
