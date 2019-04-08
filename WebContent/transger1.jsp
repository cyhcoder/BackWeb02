<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<c:set var="aDTO" value="${requestScope.get('accountDTO')}" />
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
        if (""=== "${ aDTO.getAccountid()}") {
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
        <input type="button" name='' value='更正' onclick="changeFrame('<c:url value="/transger.jsp"/>')">
    </div>
    <div id="center_frame">
        <div id="input_amount">确定无误后，请按确定键</div>
        <table border="0" align="center" id="view_amount">
            <tr>
                <td>对方卡号:</td>
                <td>${ aDTO.getAccountid2() }
                </td>
                <input type="hidden" name="accountid" value="${aDTO.getAccountid() }">
                <input type="hidden" name="accountid2" value="${aDTO.getAccountid2() }">
            </tr>
            <tr>
                <td>对方户名:</td>
                <td>${ aDTO.getName2() }
                </td>
            </tr>
            <tr>
                <td>转账金额:</td>
                <td>${ aDTO.getAmount() }
                </td>
                <input type="hidden" name="amount" value="${aDTO.getAmount() }">
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
        <input type="button" name='' value='确定' onclick="frmSubmit('<c:url value="/core.do" ><c:param name="action" value="transger1" /></c:url>')">
    </div>
</form>
</body>
</html>