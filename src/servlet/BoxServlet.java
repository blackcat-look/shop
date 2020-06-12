package servlet;

import net.sf.json.JSONObject;
import util.Goods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "BoxServlet")
public class BoxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        Vector <Goods>box = (Vector) session.getAttribute(user_id+"box");
        JSONObject json = new JSONObject();
        json.put("box",box);
        response.getWriter().write(String.valueOf(json));
//        for(int i=0;i<box.size();i++){
//            System.out.println(box.get(i));
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
