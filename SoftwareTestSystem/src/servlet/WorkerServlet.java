package servlet;

import com.beans.Person;
import com.beans.Project;
import com.daos.PersonDao;
import com.daos.ProjectDao;
import com.realationDaos.ProjectRelationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(name = "WorkerServlet",value = "/servlet/WorkerServlet")
public class WorkerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        ProjectDao projectDao = new ProjectDao();
        ProjectRelationDao projectRelationDao = new ProjectRelationDao();
        String myDoc = session.getAttribute("myDoc").toString();
        PersonDao personDao = new PersonDao();
        if (request.getParameter("checkPerson")!=null){
            System.out.println(request.getHeader("referer"));
            System.out.println("查询项目员工关系");
            String projectNo = "";
            String department = "";
            if (request.getParameter("projectNo")!=null) projectNo = request.getParameter("projectNo");
            if (request.getParameter("department")!=null) department = request.getParameter("department");
            ArrayList<Map<String,String>> arrayList = projectRelationDao.query("",department,projectNo);
            session.setAttribute("ProjectPersonList",arrayList);
            response.sendRedirect("/"+myDoc+"/workers.jsp");
        }
        else if (request.getParameter("addWorker1")!=null){
            System.out.println("项目组增加成员");
            String projectNo = request.getParameter("projectNo");
            String no = request.getParameter("workerNo");
            int result = -1;
            if (no.startsWith("XMJL")) result = projectRelationDao.addProjectProjectManagerRelation(projectNo,no);
            else if (no.startsWith("CPJL")) result = projectRelationDao.addProjectProductManagerRelation(projectNo,no);
            else if (no.startsWith("KFZ")) result = projectRelationDao.addProjectDeveloperRelation(projectNo,no);
            else if (no.startsWith("CSZ")) result = projectRelationDao.addProjectTesterRelation(projectNo,no);
            if (result == -1) request.setAttribute("result",result);
//            response.sendRedirect("/projectManager/workers.jsp");
            request.getRequestDispatcher("/"+myDoc+"/workers.jsp").forward(request,response);
        }
        else if (request.getParameter("changeWorker1")!=null){
            System.out.println("项目组修改成员");
            String originProjectNo = request.getParameter("originProjectNo");
            String originNo = request.getParameter("originWorkerNo");
            String newProjectNo = request.getParameter("newProjectNo");
            String newNo = request.getParameter("newWorkerNo");
//            System.out.println(originProjectNo);
//            System.out.println(originNo);
//            System.out.println(newProjectNo);
//            System.out.println(newNo);
            int result = -1;
            if (originNo.startsWith("XMJL")) result = projectRelationDao.updateProjectProjectManagerRelation(originProjectNo,originNo,newProjectNo,newNo);
            else if (originNo.startsWith("CPJL")) result = projectRelationDao.updateProjectProductManagerRelation(originProjectNo,originNo,newProjectNo,newNo);
            else if (originNo.startsWith("KFZ")) result = projectRelationDao.updateProjectDeveloperRelation(originProjectNo,originNo,newProjectNo,newNo);
            else if (originNo.startsWith("CSZ")) result = projectRelationDao.updateProjectTesterRelation(originProjectNo,originNo,newProjectNo,newNo);
            if (result == -1) request.setAttribute("result",result);

//            response.sendRedirect("/projectManager/workers.jsp");
            request.getRequestDispatcher("/"+myDoc+"/workers.jsp").forward(request,response);
        }
        else if (request.getParameter("deleteWorker")!=null){
            String projectNo = request.getParameter("projectNo");
            String no = request.getParameter("no");
            int result = projectRelationDao.deleteProjectWorkerRelation(projectNo,no);
            if (result == -1) request.setAttribute("result",result);

            request.getRequestDispatcher("/"+myDoc+"/workers.jsp").forward(request,response);
        }
        else if (request.getParameter("checkAllPerson")!=null){
            String no = request.getParameter("personNo");
            String dept = request.getParameter("department");
            ArrayList<Person> arrayList = personDao.getPersonArrayList(no,dept);
            session.setAttribute("allPerson",arrayList);
            response.sendRedirect("/"+myDoc+"/workersInfo.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
