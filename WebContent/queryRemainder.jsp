<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="model.*" %>
<%@ page import="javax.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%
    HttpSession s = request.getSession();
    Account acc = (Account) s.getAttribute("account");
    if (acc == null) {
        acc = new Account();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/styles.css">
    <script type="text/javascript" src="<%=path%>/js/js.js"></script>
    <script type="text/javascript">
        if (null ==<%=acc.getAccountid()%>) {
            alert("当前登录已失效，请重新登录！")
            window.location.href = "login.jsp";
        }
    </script>
    <title>查询余额</title>
</head>
<body>
<p id="choose_title">Please Select Service</p>
<div id="left_frame">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name="" value="退卡" style="color:red;" onclick="changeFrame('<%=path%>/core.do?action=exit');">
</div>
<div id="center_frame">
    <div id="input_amount">请选择所需服务</div>
    <table border="0" align="center" id="view_amount">
        <tr>
            <td>您的账户余额为：<br/>Account Balance:</td>
            <td><%=acc.getAmount() %>
            </td>
        </tr>
        <tr>
            <td>可用余额为：<br/>Available Balance:</td>
            <td><%=acc.getAmount() %>
            </td>
        </tr>
    </table>
</div>
<div id="right_frame">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name="" value="查询明细" onclick="changeFrame('<%=path%>/core.do?action=detail');">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name="" value="返回主菜单" onclick="changeFrame('<%=path%>/index.jsp');">
</div>
</body>
</html>