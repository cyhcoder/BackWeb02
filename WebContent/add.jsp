<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>存款</title>
    <script type="text/javascript">
        let b1 = true;
        function frmSubmit(url) {
            let am = $('#amount');
            if(am.val()!==""){
                if(b1){
                    document.frm.action = url;// product.do?action=query
                    document.frm.submit();
                }
            }else{
                $('#p1').css({"display":"block"});
            }
        }
        $(function () {
            let am = $('#amount');
            //失去焦点
            am.on("blur",function (){
                if($(this).val()%100!==0||$(this).val()==0){
                    $(this).css({"color":"red"});
                    $('#p2').css({"display":"block"});
                    b1 = false;
                }else if($(this).val()>5000){
                    $(this).css({"color":"red"});
                    $('#p3').css({"display":"block"});
                    b1 = false;
                }
            });
            //获取焦点
            am.on("focus",function () {
                $(this).css({"color":"black"});
                $('#p1').css({"display":"none"});
                $('#p2').css({"display":"none"});
                $('#p3').css({"display":"none"});
                b1 = true;
            });
        })
    </script>
</head>
<body>
<form name="frm" id="frm" action="" method="post">
    <p id="choose_title">Please Select Service</p>
    <div id="left_frame">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name='' value='取消'
                     onclick="changeFrame('<c:url value="/index.jsp" />')">
    </div>
    <div id="center_frame">
        <div id="input_amount">
            请输入您的存款金额<br/>
            <label>
                <input id="amount" type="text" name="amount" value="">
            </label>
            <p id="p1" style="display: none;color:red">请不要输入空值。</p>
            <p id="p2" style="display: none;color:red">请输入100的倍数。</p>
            <p id="p3" style="display: none;color:red">数值过大。</p>
        </div>
    </div>
    <div id="right_frame">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="更正" style="color: red;">
        <br/> <input type="button" name="" value="确认" style="color: green;" onclick="frmSubmit('<c:url value="/confirm.jsp" />');">

    </div>
</form>
</body>
</html>