package com.realationDaos;

import com.daos.SqlConnect;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TestSampleRelationDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";
    public int addTestSampleWorkerRelation(String TestSampleNo,String testerNo1,String testerNo2){
        sql = "insert into 测试用例测试者关系 values (?,?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,TestSampleNo);
            conn.preparedStatement.setString(2,testerNo1);
            conn.preparedStatement.setString(3,testerNo2);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("测试用例测试者关系添加失败！");
            e.printStackTrace();
            return -1;
        }
    }

    public int updateTestSampleWorkerRelation(String TestSampleNo,String testerNo1,String testerNo2){
        sql = "update 测试用例测试者关系 set 测试者编号=?,指定测试者编号=? where 测试用例编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,testerNo1);
            conn.preparedStatement.setString(2,testerNo2);
            conn.preparedStatement.setString(3,TestSampleNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("测试用例测试者关系更新失败！");
            e.printStackTrace();
            return -1;
        }
    }

    public int deleteTestSampleWorkerRelation(String TestSampleNo){
        sql = "delete from 测试用例测试者关系 where 测试用例编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,TestSampleNo);
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
    public ArrayList<Map<String,String> > query(String TestSampleNo,String type,String testerNo1,String testerNo2,String result,String status){
        ArrayList<Map<String,String> > arrayList = new ArrayList<Map<String, String>>();
        sql = "select * from 测试用例总视图 where 1=1";
        int count = 1;
        if (!"".equals(TestSampleNo)) sql+=" and 测试用例编号=?";
        if (!"".equals(type)) sql+=" and 类型=?";
        if (!"".equals(testerNo1)) sql+=" and 创建人编号=?";
        if (!"".equals(testerNo2)) sql+=" and 执行人编号=?";
        if (!"".equals(result)) sql+=" and 结果=?";
        if (!"".equals(status)) sql+=" and 状态=?";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!"".equals(TestSampleNo)) conn.preparedStatement.setString(count++,TestSampleNo);
            if (!"".equals(type)) conn.preparedStatement.setString(count++,type);
            if (!"".equals(testerNo1)) conn.preparedStatement.setString(count++,testerNo1);
            if (!"".equals(testerNo2)) conn.preparedStatement.setString(count++,testerNo2);
            if (!"".equals(result)) conn.preparedStatement.setString(count++,result);
            if (!"".equals(status)) conn.preparedStatement.setString(count++,status);
            ResultSet rs  = conn.preparedStatement.executeQuery();
            while(rs.next()){
                Map<String,String> itemMap = new HashMap<String, String>();
                itemMap.put("TestSampleNo",rs.getString(1));
                itemMap.put("TestSampleName",rs.getString(2));
                itemMap.put("type",rs.getString(3));
                itemMap.put("creatorNo",rs.getString(4));
                itemMap.put("creatorName",rs.getString(5));
                itemMap.put("executorNo",rs.getString(6));
                itemMap.put("executorName",rs.getString(7));
                itemMap.put("result",rs.getString(8));
                itemMap.put("status",rs.getString(9));
                itemMap.put("date",rs.getString(10));
                arrayList.add(itemMap);
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
}
