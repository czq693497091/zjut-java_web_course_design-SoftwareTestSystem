package servlet;

import com.beans.Bug;
import com.daos.BugDao;
import com.realationDaos.BugRelationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(name = "BugServlet",value = "/servlet/BugServlet")
public class BugServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BugRelationDao bugRelationDao = new BugRelationDao();
        BugDao bugDao = new BugDao();
        HttpSession session = request.getSession();
        String myDoc = session.getAttribute("myDoc").toString();
        System.out.println(myDoc);
        if (request.getParameter("checkBug")!=null){//对于bug的查询

            String bugNo = "";
            String type = "";
            String method = "";
            if (request.getParameter("bugNo")!=null) bugNo = request.getParameter("bugNo");
            if (request.getParameter("type")!=null) type = request.getParameter("type");
            if (request.getParameter("method")!=null) method = request.getParameter("method");

            ArrayList<Map<String,String> > arrayList = bugRelationDao.query
                    (bugNo,"","",type,method);
            session.setAttribute("bugList",arrayList);
            //request.getRequestDispatcher("/projectManager/bugs.jsp").forward(request,response);
//            request.getRequestDispatcher(request.getHeader("referer")).forward(request,response);
            response.sendRedirect("/"+myDoc+"/bugs.jsp");
        }
        else if(request.getParameter("changeBug")!=null){// 修改bug

            String bugNo = request.getParameter("bugNo");
            ArrayList<Map<String,String> > arrayList =
                    bugRelationDao.query(bugNo,"","","","");
            Map<String,String> itemMap = arrayList.get(0);;

            request.setAttribute("bugRelation",itemMap);
//            response.sendRedirect("/projectManager/bugsOperation.jsp");

            request.getRequestDispatcher("/"+myDoc+"/bugsOperation.jsp").forward(request,response);
        }
        else if (request.getParameter("changeBug2")!=null){// 持久化修改bug
            System.out.println("持久化修改Bug");
            String bugNo = request.getParameter("bugNo");
            String bugName = request.getParameter("bugName");
            String type = request.getParameter("type");
            String testerNo = request.getParameter("testerNo");
            String developerNo = request.getParameter("developerNo");
            String method = request.getParameter("method");
            String date = request.getParameter("date");
            Bug bug = new Bug(bugNo,bugName,date,type,method);

            int result1 = bugDao.update(bug);
            int result2 = bugRelationDao.updateBugWorkerRelation(bugNo,testerNo,developerNo);
            if (result1 == -1 || result2 == -1){
//                System.out.println("修改异常");
//                response.sendRedirect("/500.html");
                request.setAttribute("result",-1);
                request.getRequestDispatcher("/"+myDoc+"/bugs.jsp").forward(request,response);
            }
            else{
                System.out.println("修改成功！");
                ArrayList<Map<String,String> > arrayList = bugRelationDao.query
                        ("","","","","");
                session.setAttribute("bugList",arrayList);
                //request.getRequestDispatcher("/projectManager/bugs.jsp").forward(request,response);
                request.getRequestDispatcher("/"+myDoc+"/bugs.jsp").forward(request,response);
            }
        }
        else if (request.getParameter("addBug2")!=null){
            String bugNo = request.getParameter("bugNo");
            String bugName = request.getParameter("bugName");
            String type = request.getParameter("type");
            String testerNo = request.getParameter("testerNo");
            String developerNo = request.getParameter("developerNo");
            String method = request.getParameter("method");
            String date = request.getParameter("date");
            Bug bug = new Bug(bugNo,bugName,date,type,method);
            int result1 = bugDao.add(bug);
            if (result1 == -1){
                System.out.println("操作失败！");
                request.setAttribute("result",result1);
                request.getRequestDispatcher("/"+myDoc+"/bugs.jsp").forward(request,response);

            }
            else{
                bugRelationDao.addBugWorkerRelation(bugNo,testerNo,developerNo);
                ArrayList<Map<String,String> > arrayList = bugRelationDao.query
                        ("","","","","");
                session.setAttribute("bugList",arrayList);
                request.getRequestDispatcher("/"+myDoc+"/bugs.jsp").forward(request,response);
            }

        }
        else if (request.getParameter("deleteBug")!=null){
            System.out.println("删除bug");
            String bugNo = request.getParameter("bugNo");

            int result1 = bugRelationDao.deleteBugWorkerRelation(bugNo);
            int result2 = bugDao.delete(bugNo);
            request.getRequestDispatcher("/"+myDoc+"/bugs.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
