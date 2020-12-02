package servlet;

import com.beans.Project;
import com.daos.ProjectDao;
import com.realationDaos.ProjectRelationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet(name = "ProjectServlet",value = "/servlet/projectServlet")
public class ProjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        ProjectDao projectDao = new ProjectDao();
        ProjectRelationDao projectRelationDao = new ProjectRelationDao();
        String myDoc = session.getAttribute("myDoc").toString();
        if (request.getParameter("checkProject")!=null){
            String projectNo = "";
            String projectName = "";
            String status = "";
            if (request.getParameter("projectNo")!=null) projectNo = request.getParameter("projectNo");
            if (request.getParameter("projectName")!=null) projectName = request.getParameter("projectName");
            if (request.getParameter("status")!=null) status = request.getParameter("status");
            ArrayList<Project> arrayList = projectDao.query(projectNo,projectName,status);
            session.setAttribute("projectList",arrayList);
            response.sendRedirect("/"+myDoc+"/projects.jsp");
        }
        else if (request.getParameter("changeProject1")!=null){
            String projectNo = "";
            String projectName = "";
            String startDate = "";
            String endDate = "";
            String status = "";
            if (request.getParameter("projectNo")!=null) projectNo = request.getParameter("projectNo");
            if (request.getParameter("projectName")!=null) projectName = request.getParameter("projectName");
            if (request.getParameter("startDate")!=null) startDate = request.getParameter("startDate");
            if (request.getParameter("endDate")!=null) endDate = request.getParameter("endDate");
            if (request.getParameter("status")!=null) status = request.getParameter("status");
            Project project = new Project(projectNo,projectName,startDate,endDate,status);
            projectDao.update(project);
            response.sendRedirect("/"+myDoc+"/projects.jsp");
        }
        else if (request.getParameter("addProject1")!=null){
            String projectNo = "";
            String projectName = "";
            String startDate = "";
            String endDate = "";
            String status = "";
            if (request.getParameter("projectNo")!=null) projectNo = request.getParameter("projectNo");
            if (request.getParameter("projectName")!=null) projectName = request.getParameter("projectName");
            if (request.getParameter("startDate")!=null) startDate = request.getParameter("startDate");
            if (request.getParameter("endDate")!=null) endDate = request.getParameter("endDate");
            if (request.getParameter("status")!=null) status = request.getParameter("status");
            Project project = new Project(projectNo,projectName,startDate,endDate,status);
            int result = projectDao.add(project);
//            response.sendRedirect("/"+myDoc+"/projects.jsp");
            if (result==-1) request.setAttribute("result",-1);
            request.getRequestDispatcher("/"+myDoc+"/projects.jsp").forward(request,response);
        }
        else if (request.getParameter("deleteProject")!=null){
            String projectNo = request.getParameter("projectNo");
            int result = projectDao.delete(projectNo);
            if (result == -1) request.setAttribute("result",-1);
            request.getRequestDispatcher("/"+myDoc+"/projects.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
