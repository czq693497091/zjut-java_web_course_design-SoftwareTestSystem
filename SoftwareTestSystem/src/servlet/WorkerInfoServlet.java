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

@WebServlet(name = "WorkerInfoServlet",value = "/servlet/WorkerInfoServlet")
public class WorkerInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PersonDao personDao = new PersonDao();
        HttpSession session = request.getSession();
        String myDoc = session.getAttribute("myDoc").toString();
        System.out.println(myDoc);
        if (request.getParameter("addPerson")!=null || request.getParameter("changePerson")!=null){
            String personNo = request.getParameter("personNo");
            String personName = request.getParameter("personName");
            String personPassword = request.getParameter("personPassword");
            String personType = request.getParameter("personType");
            String personSex = request.getParameter("personSex");
            String personEmail = request.getParameter("personEmail");
            Person person = new Person(personNo,personPassword,personName,personSex,personEmail,personType);
            int result;
            if (request.getParameter("addPerson")!=null)
                result = personDao.addPerson(person);
            else result = personDao.updatePerson(person);
            if (result == -1) request.setAttribute("result",-1);
            request.getRequestDispatcher("/"+myDoc+"/workersInfo.jsp").forward(request,response);
        }
        else if (request.getParameter("deletePerson")!=null){
            String personNo = request.getParameter("personNo");
            int result = personDao.delete(personNo);
            if (result == -1) request.setAttribute("result",-1);
            request.getRequestDispatcher("/"+myDoc+"/workersInfo.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
