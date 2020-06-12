package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {


    private String dbUrl="jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
    private String dbUsername="root";
    private String dbPassword="";
    private String jdbcName="com.mysql.jdbc.Driver";

    /**
     * 获取数据库连接
     * @return
     * @throws Exception
     */
    public Connection getCon() throws Exception{
        Class.forName(jdbcName);
        Connection con=DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
        return con;
    }

    /**
     * 关闭数据库连接
     * @param con
     * @throws Exception
     */
    public void closeCon(Connection con) throws Exception{
        if(con!=null){
            con.close();
        }
    }

    /**
     * 建立一个main方法测试是否可以连接数据库成功！
     */

    public static void main(String[] args) {
        DBHelper dbUtil=new DBHelper();
        try {
            dbUtil.getCon();
            System.out.println("数据库连接成功");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

