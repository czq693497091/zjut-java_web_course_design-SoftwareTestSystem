package servlet;

import com.beans.TestSample;
import com.daos.TestSampleDao;
import com.realationDaos.TestSampleRelationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(name = "TestSampleServlet",value = "/servlet/TestSampleServlet")
public class TestSampleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        TestSampleRelationDao testSampleRelationDao = new TestSampleRelationDao();
        TestSampleDao testSampleDao = new TestSampleDao();
        HttpSession session = request.getSession();
        String myDoc = session.getAttribute("myDoc").toString();
        if (request.getParameter("checkTestSample")!=null){
            System.out.println("查询测试样例");
            String testSampleNo = "";
            String type = "";
            String result = "";
            String status = "";
            if (request.getParameter("testSampleNo")!=null) testSampleNo = request.getParameter("testSampleNo");
            if (request.getParameter("type")!=null) type = request.getParameter("type");
            if (request.getParameter("result")!=null) result = request.getParameter("result");
            if (request.getParameter("status")!=null) status = request.getParameter("status");
            ArrayList<Map<String,String> > arrayList = null;
            arrayList = testSampleRelationDao.query(testSampleNo,type,"","",result,status);
            session.setAttribute("TestSampleList",arrayList);
            response.sendRedirect("/"+myDoc+"/testSample.jsp");
        }
        else if (request.getParameter("changeTestSample1")!=null){
            System.out.println("修改测试样例");
            String testSampleNo = request.getParameter("TestSampleNo");
            String testSampleName = request.getParameter("TestSampleName");
            String type = request.getParameter("type");
            String creatorNo = request.getParameter("creatorNo");
            String testerNo = request.getParameter("testerNo");
            String result = request.getParameter("result");
            String status = request.getParameter("status");
            String date = request.getParameter("date");
            TestSample testSample = new TestSample(testSampleNo,testSampleName,date,status,type,result);
            int result1 = testSampleDao.update(testSample);
            int result2 = testSampleRelationDao.updateTestSampleWorkerRelation(testSampleNo,creatorNo,testerNo);
            if (result1 == -1||result2 == -1) request.setAttribute("result",-1);
            request.getRequestDispatcher("/"+myDoc+"/testSample.jsp").forward(request,response);
//            response.sendRedirect("/"+myDoc+"/testSample.jsp");
        }
        else if (request.getParameter("addTestSample1")!=null){
            System.out.println("增加测试样例");
            String testSampleNo = request.getParameter("TestSampleNo");
            String testSampleName = request.getParameter("TestSampleName");
            String type = request.getParameter("type");
            String creatorNo = request.getParameter("creatorNo");
            String testerNo = request.getParameter("testerNo");
            String result = request.getParameter("result");
            String status = request.getParameter("status");
            String date = request.getParameter("date");
            TestSample testSample = new TestSample(testSampleNo,testSampleName,date,status,type,result);
            int result1 = testSampleDao.add(testSample);
            int result2 = testSampleRelationDao.addTestSampleWorkerRelation(testSampleNo,creatorNo,testerNo);
            if (result1 == -1 || result2 == -1) request.setAttribute("result",-1);
//            response.sendRedirect("/"+myDoc+"/testSample.jsp");
            request.getRequestDispatcher("/"+myDoc+"/testSample.jsp").forward(request,response);
        }
        else if (request.getParameter("deleteTestSample")!=null){
            String testSampleNo = request.getParameter("TestSampleNo");
            testSampleRelationDao.deleteTestSampleWorkerRelation(testSampleNo);
            testSampleDao.delete(testSampleNo);
            request.getRequestDispatcher("/"+myDoc+"/testSample.jsp").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
