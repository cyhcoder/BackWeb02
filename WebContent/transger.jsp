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
    <link rel="stylesheet" type="text/css"
          href="<%=path%>/css/styles.css">
    <script type="text/javascript" src="<%=path%>/js/js.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script>
        if (null ===<%=acc.getAccountid()%>) {
            alert("当前登录已失效，请重新登录！");
            window.location.href = "login.jsp";
        }
    </script>
    <title>转账1</title>
</head>
<body>
<form action="" method="post" name="frm" id="frm">
    <p id="choose_title">Express Withdrawal, Please Select Amount</p>
    <div id="left_frame">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="取消" style="color: red;"
                     onclick="changeFrame('<%=path %>/index.jsp')">
    </div>
    <div id="center_frame">
        <div>
            <div id="input_amount">
                确定无误后，请按确定键<br> 转入账号：
                <input type="hidden" name="accountid" value="<%=acc.getAccountid() %>">
                <input type="text" id="atid" class="account_input" name="accountid2" value="">
                <br/> 转入金额：
                <input type="text" id="amount" class="account_input" name="amount" value=""><br/>
            </div>
            <br/>
            <span>单笔最大转账金额为5,000.00元</span>
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
                        准贷记卡：<br/>
                        1、每笔金额0.2万元以下（含），收费不超过2元；<br/>
                        2、0.2-0.5万元（含），收费不超过5元；<br/>
                        3、0.5-1万元（含），收费不超过10元；<br/>
                        4、1-5万元（含），收费不超过15元；<br/>
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
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="隐藏" class="not_display">
        <br/> <input type="button" name="" value="更正" style="color: red;">
        <br/> <input type="button" name="" value="确认" style="color: green;"
                     onclick="frmSubmit('<%=path %>/core.do?action=transger')">
    </div>
</form>
<div>
    <div style="text-align:center"><p id="err1" style="display:none;color:red">不存在该用户。</p></div>
    <div style="text-align:center"><p id="err2" style="display:none;color:red">转账对象不能是自己。</p></div>
    <div style="text-align:center"><p id="err3" style="display:none;color:red">当前余额不足。</p></div>
    <div style="text-align:center"><p id="err4" style="display:none;color:red">输入金额不能为0或大于5000。</p></div>
    <div style="text-align:center"><p id="err5" style="display:none;color:red"></p></div>
</div>
</body>
<script>
    let b1 = true;
    //错误语句
    const err1 = "不存在该用户。";
    const err2 = "转账对象不能是自己。";
    const err3 = "当前余额不足。";
    const err4 = "输入金额不能为0或大于5000。";

    let errJson ={
        '111':err1,
        '112':err2,
        '250':err3
    };

    let err = $('#err5');

    function frmSubmit(url) {
        let am = $('#amount');
        if (am.val() !== "") {
            if (b1) {
                document.frm.action = url;// product.do?action=query
                document.frm.submit();
            }
        } else {
            displayErr(err4);
        }
    }
    function displayErr(code){
        err.text(code);
        err.css({"display": "block"});
    }
    for(let i in errJson){
        if (i ==='<%=err %>') {
            displayErr(errJson[i]);
        }
    }

    function raster() {
        $(this).css({"color": "black"});
        err.css({"display": "none"});
        b1 = true;
    }

    let am = $('#amount');
    am.on('blur', function () {
        console.log($(this).val());
        if ($(this).val() == 0 || $(this).val() > 5000) {
            $(this).css({"color": "red"});
            displayErr(err4);
            b1 = false;
        }
    });
    am.on("focus", raster);
    $('#atid').on("focus", raster);
</script>
</html>