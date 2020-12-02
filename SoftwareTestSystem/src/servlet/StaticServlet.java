package servlet;

import com.beans.Person;
import com.beans.Project;
import com.daos.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "StaticServlet",value = "/servlet/StaticServlet")
//该Servlet用于返回请求数据的个数
public class StaticServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String myDoc = session.getAttribute("myDoc").toString();
        ProjectDao projectDao = new ProjectDao();
        TaskDao taskDao = new TaskDao();
        BugDao bugDao = new BugDao();
        TestSampleDao testSampleDao = new TestSampleDao();
        PersonDao personDao = new PersonDao();
        Person person = (Person)session.getAttribute("Person");
        Map<String,Integer> dataMap = new HashMap<String, Integer>();
//        if (myDoc.equals("projectManager")){//项目经理请求做图
            /*
            * 项目经理的做图需求如下：
            * 总项目个数、完成状态
            * 自己项目的相关任务数目，以及项目相关各个任务的完成情况
            * 所有测试用例的完成情况做一个统计图
            * 所有bug的完成情况做一个统计图
            * */

        // pic1 项目
        int sumProject =  projectDao.queryByStatus("");
        int planningProject = projectDao.queryByStatus("筹划中");
        int runningProject = projectDao.queryByStatus("进行中");
        int finishedProject = projectDao.queryByStatus("已完成");
        dataMap.put("sumProject",sumProject);
        dataMap.put("planningProject",planningProject);
        dataMap.put("runningProject",runningProject);
        dataMap.put("finishedProject",finishedProject);

        // pic2 任务
        int sumTask = taskDao.queryByType("");
        int planningTask = taskDao.queryByType("未激活");
        int runningTask = taskDao.queryByType("进行中");
        int finishedTask = taskDao.queryByType("已完成");
        dataMap.put("sumTask",sumTask);
        dataMap.put("planningTask",planningTask);
        dataMap.put("runningTask",runningTask);
        dataMap.put("finishedTask",finishedTask);

        System.out.println(planningTask);
        System.out.println(runningTask);
        System.out.println(finishedTask);
        // pic3 测试用例
        int sumTestSample = testSampleDao.queryByTypeAndResultAndStatus("","","");
        int failedTestSample = testSampleDao.queryByTypeAndResultAndStatus("","失败","");
        int successTestSample = sumTestSample-failedTestSample;
        int planningTestSample = testSampleDao.queryByTypeAndResultAndStatus("","","筹划中");
        int normalTestSample = testSampleDao.queryByTypeAndResultAndStatus("","","正常");
        int strangeTestSample = testSampleDao.queryByTypeAndResultAndStatus("","","异常");


        dataMap.put("sumTestSample",sumTestSample);
        dataMap.put("failedTestSample",failedTestSample);
        dataMap.put("successTestSample",successTestSample);
        dataMap.put("planningTestSample",planningTestSample);
        dataMap.put("normalTestSample",normalTestSample);
        dataMap.put("strangeTestSample",strangeTestSample);

        // pic4 bug
        int sumBug = bugDao.queryByTypeAndMethod("","");
        int unfinishedBug = bugDao.queryByTypeAndMethod("","待解决");
        int finishedBug = sumBug-unfinishedBug;

        dataMap.put("sumBug",sumBug);
        dataMap.put("unfinishedBug",unfinishedBug);
        dataMap.put("finishedBug",finishedBug);

        session.setAttribute("dataMap",dataMap);
//        }


//        request.getRequestDispatcher("/"+myDoc+"/index.jsp").forward(request,response);
        response.sendRedirect("/"+myDoc+"/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
