package servlet;

import com.beans.Task;
import com.daos.TaskDao;
import com.realationDaos.ProjectRelationDao;
import com.realationDaos.TaskWorkerRelationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(name = "TaskServlet",value = "/servlet/TaskServlet")
public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        TaskWorkerRelationDao taskWorkerRelationDao = new TaskWorkerRelationDao();
        TaskDao taskDao = new TaskDao();
        ProjectRelationDao projectRelationDao = new ProjectRelationDao();
        String myDoc = session.getAttribute("myDoc").toString();
        request.setCharacterEncoding("utf-8");
        if (request.getParameter("checkTask")!=null){

            String projectNo = request.getParameter("projectNo");
            String taskNo = request.getParameter("taskNo");
            String projectManagerNo = request.getParameter("projectManagerNo");
            String productManagerNo = request.getParameter("productManagerNo");
            String developerNo = request.getParameter("developerNo");
            String testerNo = request.getParameter("testerNo");
            String status = request.getParameter("status");
            ArrayList<Map<String,String>> arrayList =
                    taskWorkerRelationDao.queryAllTaskWorkerRelation
                            (projectNo,taskNo,projectManagerNo,productManagerNo,developerNo,testerNo,status);
            session.setAttribute("taskList",arrayList);
            response.sendRedirect("/"+myDoc+"/tasks.jsp");
        }
        else if (request.getParameter("addTask1")!=null){
            System.out.println("添加任务");
            String taskNo = request.getParameter("taskNo");
            String projectNo = request.getParameter("projectNo");
            String taskName = request.getParameter("taskName");
            String projectManagerNo = request.getParameter("projectManagerNo");
            String productManagerNo = request.getParameter("productManagerNo");
            String developerNo = request.getParameter("developerNo");
            String testerNo = request.getParameter("testerNo");
            String status = request.getParameter("status");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            Task task = new Task(taskNo,taskName,startDate,endDate,status);
            int result = taskDao.add(task);
            if (result == -1){
                request.setAttribute("result",-1);
                request.getRequestDispatcher("/"+myDoc+"/tasks.jsp").forward(request,response);
            }
            else{
                projectRelationDao.addProjectTaskRelation(projectNo,taskNo);
                taskWorkerRelationDao.addTaskWorkerRelation(taskNo,productManagerNo,developerNo,testerNo);
//                System.out.println("跳转回原页面");
                request.getRequestDispatcher("/"+myDoc+"/tasks.jsp").forward(request,response);
            }

        }
        else if (request.getParameter("changeTask1")!=null){
            System.out.println("修改任务");
            String taskNo = request.getParameter("taskNo");
            String projectNo = request.getParameter("projectNo");
            String taskName = request.getParameter("taskName");
            String projectManagerNo = request.getParameter("projectManagerNo");
            String productManagerNo = request.getParameter("productManagerNo");
            String developerNo = request.getParameter("developerNo");
            String testerNo = request.getParameter("testerNo");
            String status = request.getParameter("status");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            Task task = new Task(taskNo,taskName,startDate,endDate,status);
            taskDao.update(task);
            taskWorkerRelationDao.updateTaskWorkerRelation(taskNo,productManagerNo,developerNo,testerNo);
            response.sendRedirect("/"+myDoc+"/tasks.jsp");
        }
        else if (request.getParameter("deleteTask")!=null){
            String projectNo = request.getParameter("projectNo");
            String taskNo = request.getParameter("taskNo");
            taskWorkerRelationDao.deleteTaskWorkerRelation(taskNo);
            projectRelationDao.deleteProjectTaskRelation(projectNo,taskNo);
            taskDao.delete(taskNo);
            System.out.println(request.getHeader("referer"));
            request.getRequestDispatcher("/"+myDoc+"/tasks.jsp").forward(request,response);
        }
        else if (request.getParameter("addTaskByProductManager")!=null){//产品经理添加任务，
            String taskNo = request.getParameter("taskNo");
            String projectNo = request.getParameter("projectNo");
            String taskName = request.getParameter("taskName");
            String projectManagerNo = request.getParameter("projectManagerNo");
            String productManagerNo = request.getParameter("productManagerNo");
            String developerNo = request.getParameter("developerNo");
            String testerNo = request.getParameter("testerNo");
            String status = request.getParameter("status");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            Task task = new Task(taskNo,taskName,startDate,endDate,status);
            int result = taskDao.add(task);
            if (result == -1){
                request.setAttribute("result",-1);
                request.getRequestDispatcher("/"+myDoc+"/tasks.jsp").forward(request,response);
            }
            else{
                projectRelationDao.addProjectTaskRelation(projectNo,taskNo);
                result = taskWorkerRelationDao.addTaskWorkerRelation(taskNo,productManagerNo,null,null);
//                System.out.println("跳转回原页面");
                if (result == -1) session.setAttribute("result",result);
                request.getRequestDispatcher("/"+myDoc+"/tasks.jsp").forward(request,response);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
