<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<c:set var="acc" value="${sessionScope.get('account')}" scope="page" />
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
    <title>主页</title>
    <script>
        function changeFrame1(dir) {
            if ('${acc}'===''){
                firm();
            }else {
                window.location.href = '<c:url value="/" />' + dir;
            }
        }
    </script>
</head>
<body>
<p id="choose_title">Please Select Service</p>
<div id="left_frame">
    <br/> <input type="button" name="" value="转账业务" onclick="changeFrame1('/transger.jsp');">
    <br/> <input type="button" name="" value="实时存款" onclick="changeFrame1('/add.jsp');">
    <br/> <input type="button" name="" value="退卡" onclick="changeFrame1('/core.do?action=exit');">
</div>
<div id="center_frame">
    <div id="input_amount">请选择所需服务</div>
</div>
<div id="right_frame">
    <br/> <input type="button" name="" value="取款" onclick="changeFrame1('/draw.jsp');">
    <br/> <input type="button" name="" value="修改密码" onclick="changeFrame1('/changePassword1.jsp');">
    <br/> <input type="button" name="" value="查询业务" onclick="changeFrame1('/core.do?action=quertRemain');">
</div>
</body>
</html>