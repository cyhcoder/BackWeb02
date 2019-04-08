<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="model.*" %>
<%@ page import="javax.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String err = (String) request.getAttribute("err");
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
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script>
        let b1 = true;
        if (null==<%=acc.getAccountid()%>) {
            alert("当前登录已失效，请重新登录！");
            window.location.href = "login.jsp";
        }

        function frmSubmit(url) {
            let t1 = $('#text1');
            if (t1.val() !== "") {
                if (b1) {
                    document.frm.action = url;// product.do?action=query
                    document.frm.submit();
                }
            } else {
                $('#err1').css({"display": "block"});
            }
        }

        window.onload = function () {
            for (let i = 0; i < document.getElementsByClassName('b1').length; i++) {
                document.getElementsByClassName('b1')[i].onclick = function () {
                    document.getElementById('text1').value = this.value;
                    resets();
                }
            }
            if ('250'==='<%=err %>') {
                let x = document.getElementById("err");
                x.style.display = "block";
            }
            let t1 = $('#text1');
            t1.on('blur', function () {
                if ($(this).val() % 100 !== 0 || $(this).val() == 0) {
                    $(this).css({"color": "red"});
                    $('#err1').css({"display": "block"});
                    b1 = false;
                } else if ($(this).val() > 5000) {
                    $(this).css({"color": "red"});
                    $('#err2').css({"display": "block"});
                    b1 = false;
                }
            });
            function resets(){
                t1.css({"color": "black"});
                $('#err1').css({"display": "none"});
                $('#err2').css({"display": "none"});
                b1 = true;
            }
            t1.on("focus", resets);
        }
    </script>
    <title>取款</title>
</head>
<body>
<form action="" method="post" name="frm" id="frm">
    <p id="choose_title">Express Withdrawal, Please Select Amount</p>
    <div id="left_frame">
        <br/>
        <input class="b1" type="button" name="" value="100">
        <br/>
        <input class="b1" type="button" name="" value="500">
        <br/>
        <input class="b1" type="button" name="" value="1000">
        <br/>
        <input type="button" name="" value="返回" onclick="changeFrame('<%=path %>/index.jsp')">
    </div>
    <div id="center_frame">
        <div>
            <div id="input_amount">
                请选择或输入取款金额<br/>
                <input type="hidden" name="accountid" value="<%=acc.getAccountid() %>">
                <input type="text" id="text1" name="amount" value="">
            </div>
            <p>
                本机现在提供100元纸币，<br/>
                取款金额必须是所能提供面值的整数倍，
            </p>
            <span>单笔最大取款金额为5,000.00元</span>
            <table id="instructions" border="1" align="center">
                <tr id="yellow_font">
                    <th>收费项目</th>
                    <th>收费标准</th>
                </tr>
                <tr>
                    <td>本行同城交易</td>
                    <td>免费</td>
                </tr>
                <tr>
                    <td>本行异地交易（含省内与跨省）</td>
                    <td>
                        借记卡：免费<br/>
                        准贷记卡：按笔收款，交易金额的0.5%
                    </td>
                </tr>
                <tr>
                    <td>外卡、他行卡交易</td>
                    <td>请咨询发卡机构</td>
                </tr>
                <tr>
                    <td colspan="2" id="left_align_message">
                        1、请您阅知服务标准后再确定提交交易。<br/>
                        2、陆港通龙卡联动账户取款时，加服务费10元/笔。<br/>
                        3、自2017年1月1日起，我行按照本公示价格执行，如对本笔交易产生异议，请咨询95533。<br/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="right_frame">
        <br/>
        <input class="b1" type="button" name="" value="2000">
        <br/>
        <input class="b1" type="button" name="" value="2500">
        <br/>
        <input class="b1" type="button" name="" value="5000">
        <br/>
        <input type="button" name="" value="确定" style="color:green;"
               onclick="frmSubmit('<%=path %>/core.do?action=draw')">
    </div>
    <div style="text-align:center"><p id="err" style="display:none;color:red">当前余额不足。</p></div>
    <div style="text-align:center"><p id="err1" style="display:none;color:red">请不要输入空值或非100的倍数。</p></div>
    <div style="text-align:center"><p id="err2" style="display:none;color:red">存款金额过大。</p></div>
</form>
</body>
</html>