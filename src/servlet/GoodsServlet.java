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
import java.io.PrintWriter;
import java.util.Vector;

@WebServlet(name = "GoodsServlet")
public class GoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        JSONObject json = new JSONObject();

        String goods_id = request.getParameter("goods_id");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        Goods goods = new Goods(goods_id,price,image);
        System.out.println(goods_id);
    //    String password=request.getParameter("password");
        HttpSession session = request.getSession();
        String user_id = (String)session.getAttribute("user_id");
        if(user_id!=null) {
            Vector<Goods> box=(Vector)session.getAttribute(user_id+"box");
            if(box==null) box=new Vector<>();
            if(goods_id!=null&&price!=null&&image!=null) box.add(goods);
            session.setAttribute(user_id+"box",box);
            json.put("flag",true);
            json.put("user_id",user_id);
        }else{
            json.put("flag",false);
        }
        response.getWriter().write(String.valueOf(json));


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
