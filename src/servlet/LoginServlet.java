package servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.sf.json.JSONObject;
import util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * 接收前台传来的值 账号和密码
         */
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset = UTF-8");


        String user_id=request.getParameter("user_id");
        String password=request.getParameter("password");

        HttpSession session = request.getSession();

        JSONObject json = new JSONObject();
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString();
            DBHelper db= new DBHelper();
            User user=new User(user_id,password);
            Dao dao=new Dao();
            try {
                //数据库连接
                Connection con=db.getCon();

            if(dao.login(con,user)!=null) {
                session.setAttribute("user_id",user_id);
                session.setAttribute("password",password);
                json.put("flag",true);
            }else {
                json.put("flag",false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.getWriter().write(String.valueOf(json));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
