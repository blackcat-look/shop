package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


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
    //修改信息
    public boolean change(Connection con,User user) throws Exception{
        boolean flag=false;
        PreparedStatement pstmt = null;
        String sql="UPDATE user SET sex=?,address=?,telephone=?,password=? WHERE user_id=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, user.getSex());
        pstmt.setString(2, user.getAddress());
        pstmt.setString(3, user.getTelephone());
        pstmt.setString(4, user.getPassword());
        pstmt.setString(5, user.getUser_id());
        if (pstmt.executeUpdate() > 0) {
            flag = true;
        }
        return flag;
    }
    //获取商品
    public Vector getGoods(Connection con,String species) throws Exception{
        Vector<Goods> resultGoods=new Vector<>();

        String sql="select * from goods where species = ?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1, species);
        ResultSet rs=pstmt.executeQuery();
        while(rs.next()){
           // System.out.println(rs.getString("goods_id"));
            Goods goods = new Goods();
            goods.setGoods_id(rs.getString("goods_id"));
            goods.setImage(rs.getString("image"));
            goods.setPrice(rs.getString("price"));
            resultGoods.add(goods);
        }
//        for(int j=0;j<resultGoods.size();j++){
//            System.out.println(resultGoods.get(j).getGoods_id());
//        }
        return resultGoods;
    }
}
