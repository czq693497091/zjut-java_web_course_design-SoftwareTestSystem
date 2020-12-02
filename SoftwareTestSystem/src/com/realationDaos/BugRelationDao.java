package com.realationDaos;

import com.daos.SqlConnect;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class BugRelationDao {
    SqlConnect conn = new SqlConnect();
    String sql = "";
    public int addBugWorkerRelation(String BugNo,String testerNo,String developerNo){
        sql = "insert into bug工作者关系 values (?,?,?)";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,BugNo);
            conn.preparedStatement.setString(2,testerNo);
            conn.preparedStatement.setString(3,developerNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("bug工作者关系添加失败！");
            e.printStackTrace();
            return -1;
        }
    }

    public int updateBugWorkerRelation(String BugNo,String testerNo,String developerNo){
        sql = "update bug工作者关系 set 测试者编号=?,开发者编号=? where BUG编号=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,testerNo);
            conn.preparedStatement.setString(2,developerNo);
            conn.preparedStatement.setString(3,BugNo);
            conn.preparedStatement.executeUpdate();
//            conn.closeAll();
            return 1;
        }
        catch (Exception e){
//            conn.closeAll();
            System.out.println("bug工作者关系更新失败！");
            e.printStackTrace();
            return -1;
        }
    }

    public int deleteBugWorkerRelation(String bugNo){
        sql = "delete from bug工作者关系 where BUG编号=?";
        try{
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            conn.preparedStatement.setString(1,bugNo);

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

    public ArrayList<Map<String,String>> query(String bugNo,String testerNo,String developerNo,String type,String method){
        ArrayList<Map<String,String> > arrayList = new ArrayList<Map<String, String>>();
        sql = "select * from bug总视图 where 1=1";
        int count = 1;
        if (!"".equals(bugNo)) sql+=" and BUG编号=?";
        if (!"".equals(testerNo)) sql+=" and 测试者编号=?";
        if (!"".equals(developerNo)) sql+=" and 开发者编号=?";
        if (!"".equals(type)) sql+=" and 类型=?";
        if (!"".equals(method)) sql+=" and 方案=?";
        try {
            conn.preparedStatement = conn.connection.prepareStatement(sql);
            if (!"".equals(bugNo)) conn.preparedStatement.setString(count++,bugNo);
            if (!"".equals(testerNo)) conn.preparedStatement.setString(count++,testerNo);
            if (!"".equals(developerNo)) conn.preparedStatement.setString(count++,developerNo);
            if (!"".equals(type)) conn.preparedStatement.setString(count++,type);
            if (!"".equals(method)) conn.preparedStatement.setString(count++,method);
            ResultSet rs = conn.preparedStatement.executeQuery();
            while(rs.next()){
                Map<String,String> itemMap = new HashMap<String,String>();
                itemMap.put("bugNo",rs.getString(1));
                itemMap.put("bugName",rs.getString(2));
                itemMap.put("type",rs.getString(3));
                itemMap.put("testerNo",rs.getString(4));
                itemMap.put("testerName",rs.getString(5));
                itemMap.put("developerNo",rs.getString(6));
                itemMap.put("developerName",rs.getString(7));
                itemMap.put("method",rs.getString(8));
                itemMap.put("date",rs.getString(9));
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
}
