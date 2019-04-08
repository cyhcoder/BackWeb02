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
    <title>过渡页面</title>
</head>
<body>
<p id="choose_title">Please Wait</p>
<div id="left_frame">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="退卡" style="color:red;" onclick="changeFrame('<c:url value="/core.do" ><c:param name="action" value="exit" /> </c:url>');">
</div>
<div id="center_frame">
    <div id="input_amount">请选择所需服务</div>
</div>
<div id="right_frame">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="隐藏" class="not_display">
    <br/> <input type="button" name="" value="返回主菜单" onclick="changeFrame('<c:url value="/index.jsp" />');">
</div>ac
</body>
<script>
    const coreHint = "请选择您要进行的下一步操作。";
    const hint = "存钱成功，"+coreHint; //60
    const hint1 = "取款成功，"+coreHint; //61
    const hint2 = "转账成功，"+coreHint; //62
    const hint3 = "修改密码成功，"+coreHint; //63
    let hintJson ={
        '60':hint,
        '61':hint1,
        '62':hint2,
        '63':hint3
    };
    let coreInput = $('#input_amount');
    function displayErr(code){
        coreInput.text(code);
    }
    for(let i in hintJson){
        if (i ==='${err}') {
            displayErr(hintJson[i]);
        }
    }

</script>
</html>