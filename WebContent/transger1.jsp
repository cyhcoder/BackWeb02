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
    AccountDetailDTO aDTO = (AccountDetailDTO)request.getAttribute("accountDTO");
    if (aDTO == null) {
        aDTO = new AccountDetailDTO();
    }
    System.out.println(aDTO.getAccountid());
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
    <link rel="stylesheet" type="text/css"
          href="<%=path%>/css/styles.css">
    <script type="text/javascript" src="<%=path%>/js/js.js"></script>
    <script>
        if (null== <%=aDTO.getAccountid()%>) {
            alert("当前登录已失效，请重新登录！")
            window.location.href = "login.jsp";
        }

        function frmSubmit(url) {
            document.frm.action = url;// product.do?action=query
            document.frm.submit();
        }
    </script>
    <title>转账2</title>
</head>
<body>
<form action="" method="post" name="frm" id="frm">
    <p id="choose_title"> Transaction Detail</p>
    <div id="left_frame">
        <br/>
        <input type="button" name="" value="隐藏" class="not_display">
        <br/>
        <input type="button" name="" value="隐藏" class="not_display">
        <br/>
        <input type="button" name="" value="隐藏" class="not_display">
        <br/>
        <input type="button" name='' value='更正' onclick="changeFrame('<%=path %>/transger.jsp')">
    </div>
    <div id="center_frame">
        <div id="input_amount">确定无误后，请按确定键</div>
        <table border="0" align="center" id="view_amount">
            <tr>
                <td>对方卡号:</td>
                <td><%=aDTO.getAccountid2() %>
                </td>
                <input type="hidden" name="accountid" value="<%=aDTO.getAccountid() %>">
                <input type="hidden" name="accountid2" value="<%=aDTO.getAccountid2() %>">
            </tr>
            <tr>
                <td>对方户名:</td>
                <td><%=aDTO.getName2() %>
                </td>
            </tr>
            <tr>
                <td>转账金额:</td>
                <td><%=aDTO.getAmount() %>
                </td>
                <input type="hidden" name="amount" value="<%=aDTO.getAmount() %>">
            </tr>
        </table>
    </div>

    <div id="right_frame">
        <br/>
        <input type="button" name="" value="隐藏" class="not_display">
        <br/>
        <input type="button" name="" value="隐藏" class="not_display">
        <br/>
        <input type="button" name="" value="隐藏" class="not_display">
        <br/>
        <input type="button" name='' value='确定' onclick="frmSubmit('<%=path %>/core.do?action=transger1')">
    </div>
</form>
</body>
</html>