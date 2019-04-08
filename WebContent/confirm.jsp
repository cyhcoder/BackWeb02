<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.*" %>
<%@ page import="javax.*" %>
<%
    HttpSession s = request.getSession();
    Account acc = (Account) s.getAttribute("account");
    if (acc == null) {
        acc = new Account();
    }
    int amount = Integer.parseInt(request.getParameter("amount"));
    double handlingFee =  Double.parseDouble(String.format("%.2f",amount * 0.001));
%>
<
<c:set var="acc" value="${sessionScope.get('account')}" scope="page"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/css/styles.css" />">
    <script type="text/javascript" src="<c:url value="/js/js.js" />"></script>
    <script>
        if (null== <%=acc.getAccountid()%>) {
            if (alert("当前登录已失效，请重新登录！")) {
                window.location.href = "login.jsp";
            }
        }

        function frmSubmit(url) {
            document.frm.action = url;
            // product.do?action=query
            document.frm.submit();
        }
    </script>
    <title>确认存款</title>
</head>
<body>
<p id="choose_title">Please Select Service</p>
<div id="left_frame">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="返回"
                 onclick="changeFrame('<c:url value="/add.jsp"/>');">
</div>
<form name="frm" id="frm" action="" method="post">
    <div id="center_frame">
        <div id="input_amount">请确定您的存款信息</div>
        <table border="0" align="center" id="view_amount">
            <tr>
                <td>存款账号：</td>
                <td><%=acc.getAccountid()%>
                </td>
                <input type="hidden" name="accountid"
                       value="<%=acc.getAccountid()%>">
            </tr>
            <tr>
                <td>存款金额：</td>
                <td><%=amount%>
                </td>
            </tr>
            <tr>
                <td>手续费：</td>
                <td><%=handlingFee%>
                </td>
            </tr>
            <tr>
                <td>实际存入金额：</td>
                <td><%=amount - handlingFee%>
                </td>
                <input type="hidden" name="amount"
                       value="<%=amount - handlingFee%>">
            </tr>
        </table>
    </div>
    <div id="right_frame">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="确定"
                     onclick="frmSubmit('<c:url value="/core.do"><c:param name="action" value="addMoney"/> </c:url>');"
                     style="color: green;">
    </div>
</form>
</body>
</html>