<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<c:set var="err" value="${requestScope.get('err')}" scope="page"/>
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
    <script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.js" />"></script>
    <title>登录用户</title>
    <script type="text/javascript">
        function frmSubmit(url) {
            document.frm.action = url;// product.do?action=query
            document.frm.submit();
        }

        $(function () {
            if ('101' ==='${err}') {
                $('#err').css({"display":"block"});
            }
            $("#input_amount").children("input").on("focus",function () {
                console.log("focus");
                $('#err').css({"display":"none"});
            });
        })
    </script>
</head>
<body>
<form name="frm" id="frm" action="" method="post">
    <p id="choose_title">Please Login in</p>
    <div id="left_frame">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
    </div>
    <div id="center_frame">
        <div id="input_amount">
            账号：<input type="text" id="account_input" name="accountid" value=""/><br/>
            密码：<input type="password" name="pwd" value=""/>
        </div>
    </div>
    <div id="right_frame">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name='' value='确认' style="color: green;"
                     onclick="frmSubmit('<c:url value="/core.do"><c:param name="action" value="login" /></c:url>')">
    </div>
</form>
<div style="text-align:center"><p id="err" style="display:none;color:red">用户名或密码错误，请重新登录。</p></div>
</body>
</html>