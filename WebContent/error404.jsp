<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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
    <title>页面丢失<</title>
</head>
<body>
<p id="choose_title">404 Page not found</p>
<div id="left_frame">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
</div>
<div id="center_frame" style="">
    <div id="input_amount"><p >不小心页面丢失啦~</p></div>
</div>
<div id="right_frame">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="返回主菜单" onclick="changeFrame('<%=path%>/index.jsp');">
</div>
</body>
</html>