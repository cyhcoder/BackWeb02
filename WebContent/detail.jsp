<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="al" value="${requestScope.get('arraylist')}" scope="page"/>
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
        if ("" ==="${al.size()}") {
            alert("当前登录已失效，请重新登录！")
            window.location.href = "login.jsp";
        }
    </script>
    <title>交易明细</title>
</head>
<body>
<p id="choose_title"> Transaction Detail</p>
<div id="left_frame">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name="" value="隐藏" class="not_display">
    <br/>
    <input type="button" name='' value='返回' onclick="changeFrame('<c:url value="/queryRemainder.jsp"/>')">
</div>
<div id="center_frame">
    <div id="input_amount">
        最近五笔交易明细信息
    </div>
    <table border="1" align="center" id="instructions">
        <tr id="yellow_font">
            <td>交易日期</td>
            <td>类型</td>
            <td>对方户名</td>
            <td>交易金额</td>
            <td>余额</td>
        </tr>
        <%--<%for (int i = 0; i < al.size() && i < 5; i++) { %>--%>
        <%--<tr>--%>
        <%--<td><%=al.get(i).getCreateTime() %>--%>
        <%--</td>--%>
        <%--<td><%=al.get(i).getType() %>--%>
        <%--</td>--%>
        <%--<td><%=al.get(i).getName2() %>--%>
        <%--</td>--%>
        <%--<td><%=al.get(i).getAmount() %>--%>
        <%--</td>--%>
        <%--<td><%=al.get(i).getBalance()%>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <%--<%} %>--%>
        <c:forEach items="${al}" var="item" varStatus="i">
            <c:if test="${i.index<5}">
                <tr>
                    <td>${al.get(i.index).getCreateTime() }
                    </td>
                    <td>${al.get(i.index).getType() }
                    </td>
                    <td>${al.get(i.index).getName2() }
                    </td>
                    <td>${al.get(i.index).getAmount() }
                    </td>
                    <td>${al.get(i.index).getBalance() }
                    </td>
                </tr>
            </c:if>
        </c:forEach>
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
    <input type="button" name='' value='继续交易' onclick="changeFrame('<c:url value="/index.jsp"/>')">
</div>
</body>
</html>