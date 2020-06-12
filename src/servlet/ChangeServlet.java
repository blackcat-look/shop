package servlet;

import util.DBHelper;
import util.Dao;
import util.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "ChangeServlet")
public class ChangeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset = UTF-8");
        //获取注册用户名
        HttpSession session = request.getSession();
        String user_id=(String) session.getAttribute("user_id");
        //性别
        String sex=request.getParameter("sex");
        //住址
        String address=request.getParameter("address");
        //电话
        String telephone=request.getParameter("telephone");
        //获取注册用户密码
        String password=request.getParameter("password");
        //       System.out.println(user_id);
//        PrintWriter out = response.getWriter();
//        out.println(user_id+password);
        DBHelper db= new DBHelper();
        User user=new User(user_id,sex,address,telephone,password);

        Dao dao=new Dao();
        try {
            //数据库链接
            Connection con=db.getCon();
            if(dao.change(con,user)) {
                response.sendRedirect("login.jsp");
            }else {
                response.sendRedirect("register.jsp");

            }


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
