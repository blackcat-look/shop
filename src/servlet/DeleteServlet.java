package servlet;

import util.Goods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        String goods_id = request.getParameter("goods_id");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        Vector<Goods> box = (Vector) session.getAttribute(user_id+"box");
        for(int i=0;i<box.size();i++){
            if((box.get(i).getGoods_id()).equals(goods_id)){
                box.removeElementAt(i);
                break;
//                System.out.println(box.get(i).getGoods_id());
            }
        }
      //  session.setAttribute(user_id+"box",box);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
