package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Dao {
    /**
     * login(Connection con,User user) 登录验证
     * (Connection con,User user)注册功能

     */
    public User login(Connection con, User user) throws Exception{
        User resultUser=null;
        String sql="select * from user where user_id=? and password=?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUser_id());
        pstmt.setString(2, user.getPassword());
        ResultSet rs=pstmt.executeQuery();
        if(rs.next()){
            resultUser=new User();
            resultUser.setUser_id(rs.getString("user_id"));
            resultUser.setPassword(rs.getString("password"));
        }
        return resultUser;
    }

    //注册功能
    public boolean regist(Connection con,User user) throws Exception{
        boolean flag=false;
        PreparedStatement pstmt = null;
        String sql="INSERT INTO user(user_id,sex,address,telephone,password)VALUES(?,?,?,?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, user.getUser_id());
        pstmt.setString(2, user.getSex());
        pstmt.setString(3, user.getAddress());
        pstmt.setString(4, user.getTelephone());
        pstmt.setString(5, user.getPassword());
        if (pstmt.executeUpdate() > 0) {
            flag = true;
        }
        return flag;
    }

}
