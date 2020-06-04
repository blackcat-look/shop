package util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class Register2 extends HttpServlet {

    private static int ID=1;
    protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html:charset=UTF-8");
        PrintWriter out = response.getWriter();
        //out.print("aasdasdas");
        String user_id=request.getParameter("user_id");
        String password=request.getParameter("password");
        /*if(new Dao().insertUser(ID, name, password)){
            out.println("name:"+name);
            out.println("password:"+password);
        	//response.sendRedirect("index.jsp");
        }*/
    }
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        try {
            processRequest(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        try {
            processRequest(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}