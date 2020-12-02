package com.daos;
import java.sql.*;
public class SqlConnect {
    public String DB_driver = "com.mysql.jdbc.Driver";//加载驱动
    public String DB_url = "jdbc:mysql://localhost:3306/softwaretestsystem";
    public String DB_user = "root";
    public String DB_password="root";
    public Connection connection = null;
    public String sql = null;
    public PreparedStatement preparedStatement = null;
    public ResultSet resultSet = null;
    public void buildDriver(){
        try{
            Class.forName(DB_driver).newInstance();
            System.out.println("驱动加载成功");
        }
        catch(ClassNotFoundException | InstantiationException | IllegalAccessException e){
            e.printStackTrace();
            System.out.println("驱动加载失败");
        }
    }
    public SqlConnect(){
        buildDriver();
        buildConnect();
    }
    public void buildConnect() {
        try {
            connection = DriverManager.getConnection(DB_url, DB_user, DB_password);
            System.out.println("数据库连接成功");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接失败");
        }
    }
    public void closeAll(){
        try{
            if (connection!=null) connection.close();
            if (preparedStatement!=null) preparedStatement.close();
            if (resultSet!=null) resultSet.close();
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("数据库关闭异常");
        }
    }
}
