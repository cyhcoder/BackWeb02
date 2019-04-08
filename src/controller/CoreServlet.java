package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.AccountDetailDTO;
import service.AccountServiceImpl;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/core.do")
public class CoreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoreServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
                + "/";
        PrintWriter out = response.getWriter(); //向页面输出语句
        String action = request.getParameter("action"); //判断进入哪个选项
        AccountServiceImpl aServ = new AccountServiceImpl(); //调用业务Service
        //初始化参数
        String accountid,accountid2,url,err;
        double amount;
        if ("login".equalsIgnoreCase(action)) {
            System.out.println("开始登录");
            String id = request.getParameter("accountid");
            String pwd = request.getParameter("pwd");
            try {
                Account acc = aServ.loginAccount(id, pwd);
                HttpSession session = request.getSession();
                session.setAttribute("account", acc);
//				response.sendRedirect("/view/index.jsp");
                if (acc == null) {
                    err="101";
                    request.setAttribute("err", err);
                    url = "/login.jsp";
                    dispForward(request, response,url);
                }else{
                    url = "/index.jsp";
                    dispForward(request, response,url);
                }
            } catch (Exception e) {
                out.println("服务器出现异常");
            }
        } else if ("addMoney".equalsIgnoreCase(action)) {
            System.out.println("进入存钱");
            accountid = request.getParameter("accountid");
            amount = Double.parseDouble(request.getParameter("amount"));
            Account acc = new Account();
            acc.setAccountid(accountid);
            try {
                boolean b = aServ.saveMoney(acc, amount);
                if (b) {
                    err="60";
                    request.setAttribute("err", err);
                    url = "/wait.jsp";
                    dispForward(request, response,url);
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("服务器出现异常");
            }
        } else if ("draw".equalsIgnoreCase(action)) {
            System.out.println("进入取钱");
            accountid = request.getParameter("accountid");
            amount = Double.parseDouble(request.getParameter("amount"));
            Account acc = new Account();
            acc.setAccountid(accountid);
            try {
                boolean b = aServ.drawMoney(acc, amount);
                if (b){
                    err="61";
                    request.setAttribute("err", err);
                    url = "/wait.jsp";
                    dispForward(request, response,url);
                }
            } catch (Exception e) {
                e.printStackTrace();
                if ("250".equalsIgnoreCase(e.getMessage())) {
                    System.out.println("250");
                    request.setAttribute("err", e.getMessage());
                    try {
                        dispForward(request, response,"/draw.jsp");
                    } catch (Exception e1) {
                        e1.printStackTrace();
                        out.println("服务器出现异常");
                    }
                } else {
                    out.println("服务器出现异常");
                }
            }
        } else if ("transger".equalsIgnoreCase(action)) {
            System.out.println("首先查询是否存在用户");
            accountid = request.getParameter("accountid");
            accountid2 = request.getParameter("accountid2");
            amount = Double.parseDouble(request.getParameter("amount"));
            AccountDetailDTO aDTO = new AccountDetailDTO();
            aDTO.setAccountid(accountid);
            aDTO.setAmount(amount);
            try {
                Account acc2 = aServ.findAccunt(accountid2);
                if (acc2 == null) {
                    err="111";
                    request.setAttribute("err", err);
                    url = "/transger.jsp";
                } else if (acc2.getAccountid().equals(accountid)) {
                    err="112";
                    request.setAttribute("err", err);
                    url = "/transger.jsp";
                } else {
                    aDTO.setAccountid2(acc2.getAccountid());
                    aDTO.setName2(acc2.getName());
                    request.setAttribute("accountDTO", aDTO);
                    url = "/transger1.jsp";
                }
                dispForward(request, response,url);
            } catch (Exception e) {
                e.printStackTrace();
                out.println("服务器出现异常");
            }
        } else if ("transger1".equalsIgnoreCase(action)) {
            System.out.println("开始转账");
            accountid = request.getParameter("accountid"); //自身id
            accountid2 = request.getParameter("accountid2"); //对方Id
            amount = Double.parseDouble(request.getParameter("amount")); //转账金额
            Account acc = new Account();
            acc.setAccountid(accountid);
            Account acc2 = new Account();
            acc2.setAccountid(accountid2);
            try {
                boolean b = aServ.transferMoney(acc, acc2, amount);
                if (b){
                    err="62";
                    request.setAttribute("err", err);
                    url = "/wait.jsp";
                    dispForward(request, response,url);
                }
            } catch (Exception e) {
                e.printStackTrace();
                if ("250".equalsIgnoreCase(e.getMessage() ))  {
                    request.setAttribute("err", e.getMessage() );
                    try {
                        dispForward(request, response,"/transger.jsp");
                    } catch (Exception e1) {
                        out.println("服务器出现异常");
                    }
                } else {
                    out.println("服务器出现异常");
                }
            }
        } else if ("quertRemain".equalsIgnoreCase(action)) {
            System.out.println("开始查询余额");
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            accountid = acc.getAccountid();
            try {
                acc = aServ.findAccunt(accountid);
                session.setAttribute("account", acc);
                response.sendRedirect(path + "/queryRemainder.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("服务器出现异常");
            }
        } else if ("detail".equalsIgnoreCase(action)) {
            System.out.print("开始查询明细");
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            try {
                ArrayList<AccountDetailDTO> al = aServ.queryTransactionDail(acc);
                System.out.println(al.size());
                request.setAttribute("arraylist", al);
                dispForward(request, response,"/detail.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("服务器出现异常");
            }
        } else if ("updatePwd".equalsIgnoreCase(action)) {
            System.out.print("开始修改密码");
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            String pwd = request.getParameter("pwd");
            String newPwd = request.getParameter("newPwd");
            try {
                boolean b = aServ.updatePwd(acc, pwd, newPwd);
                if (b){
                    err="63";
                    request.setAttribute("err", err);
                    url = "/wait.jsp";
                    dispForward(request, response,url);
                }
            } catch (Exception e) {
                e.printStackTrace();
                if ("260".equalsIgnoreCase(e.getMessage())) {
                    request.setAttribute("err", e.getMessage());
                    try {
                        dispForward(request, response,"/changePassword1.jsp");
                    } catch (Exception e1) {
                        e1.printStackTrace();
                        out.println("服务器出现异常");
                    }
                } else {
                    out.println("服务器出现异常");
                }
            }
        } else if ("exit".equalsIgnoreCase(action)){
            System.out.print("退出");
            HttpSession session = request.getSession();
            session.removeAttribute("account");
            session.removeAttribute("arraylist");
            response.sendRedirect(path + "/login.jsp");
        }
    }

    /**
     *
     * 转发url
     * @param request
     * @param response
     * @param url
     * @throws Exception
     */
    public static void dispForward(HttpServletRequest request, HttpServletResponse response,String url) throws Exception {
        RequestDispatcher disp = request.getRequestDispatcher(url);
        disp.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
