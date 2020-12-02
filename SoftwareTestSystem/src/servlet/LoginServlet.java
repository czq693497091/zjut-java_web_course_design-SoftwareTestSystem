package servlet;

import com.beans.Person;
import com.daos.PersonDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LoginServlet",value = "/servlet/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        PersonDao personDao = new PersonDao();
        if (request.getParameter("login")!=null){

            String department = request.getParameter("users");
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            Person p = personDao.getPerson(account);
//            System.out.println(p.getPassword());
            if (p!=null&&password.equals(p.getPassword())){
                session.setAttribute("Person",p);

                String doc = "";
                switch (department){
                    case "管理员":doc = "/admin/";break;
                    case "项目经理":doc = "/projectManager/";break;
                    case "产品经理":doc = "/productManager/";break;
                    case "开发者":doc = "/developer/";break;
                    case "测试者":doc = "/tester/";break;
                    default:break;
                }
                // 登录成功后，直接载入项目、任务、测试用例、bug等信息


                session.setAttribute("myDoc",doc.substring(1,doc.length()-1));
                response.sendRedirect(doc+"index.jsp");
            }
            else{
                request.setAttribute("loginResult",-1);
                request.getRequestDispatcher("/sign-in.jsp").forward(request,response);
            }
        }
        else if (request.getParameter("changePassword")!=null){
            String account = request.getParameter("account");
            String originPassword = request.getParameter("originPassword");
            String newPassword = request.getParameter("newPassword");
            Person p = new Person();
            p = personDao.getPerson(account);
            if (!p.getPassword().equals(originPassword)){
                request.setAttribute("result",-1);
                request.getRequestDispatcher("reset-password.jsp").forward(request,response);
            }
            else{
                p.setPassword(newPassword);
                personDao.updatePerson(p);
                response.sendRedirect("/sign-in.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
