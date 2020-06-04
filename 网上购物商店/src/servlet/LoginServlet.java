package servlet;

import util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        response.setContentType("text/html;charset = UTF-8");
        String user_id=request.getParameter("user_id");

        String password=request.getParameter("password");

        DBHelper db= new DBHelper();
        User user=new User(user_id,password);
        Dao dao=new Dao();
        try {
            //数据库连接
            Connection con=db.getCon();
                /*PrintWriter out = response.getWriter();
                out.println(username);*/
            if(dao.login(con,user)!=null) {
                response.sendRedirect("index.jsp");
            }else {
                PrintWriter out = response.getWriter();
                out.print("登录失败,账户名或密码错误");
                out.print("<br><a href = 'login.jsp'>重新登陆</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
