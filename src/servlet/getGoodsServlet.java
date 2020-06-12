package servlet;

import net.sf.json.JSONObject;
import util.DBHelper;
import util.Dao;
import util.Goods;
import util.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "getGoodsServlet")
public class getGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String species = request.getParameter("species");
        JSONObject json = new JSONObject();
        DBHelper db= new DBHelper();
        Dao dao=new Dao();
        try {
            //数据库连接
            Connection con=db.getCon();
            Vector<Goods>goods = null;
            goods = dao.getGoods(con,species);
            if(goods!=null) {
                json.put("goods",goods);
            }else {
                json.put("flag",false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.getWriter().write(String.valueOf(json));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
