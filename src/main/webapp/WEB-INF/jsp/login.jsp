<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>

<html>
<head>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/css/web.css"/>


</head>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>



<body lang="zh-CN" class="reader-black-font">
<!-- 全局顶部导航栏 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="width-limit">
        <!-- 左上方 Logo -->
        <a class="logo" href="/"><img src="/static/images/logo.png" alt="Nav logo" /></a>

        <!-- 右上角 -->
        <!-- 未登录显示登录/注册/写文章 -->
        <a class="btn write-btn" target="_blank" href="/writer#/">
            <i class="iconfont ic-write"></i>写文章
        </a>      <a class="btn sign-up" href="/sign_up">注册</a>
        <a class="btn log-in" href="/sign_in">登录</a>

        <!-- 如果用户登录，显示下拉菜单 -->

        <div id="view-mode-ctrl">
        </div>
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="menu">
                <ul class="nav navbar-nav">
                    <li class="tab active">
                        <a href="/">
                            <span class="menu-text">首页</span><i class="iconfont ic-navigation-discover menu-icon"></i>
                        </a>            </li>
                    <li class="tab ">
                        <a id="web-nav-app-download-btn" class="app-download-btn" href="/apps?utm_medium=desktop&amp;utm_source=navbar-apps"><span class="menu-text">下载App</span><i class="iconfont ic-navigation-download menu-icon"></i></a>
                    </li>
                    <li class="search">
                        <form target="_blank" action="/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
                            <input type="text" name="q" id="q" value="" autocomplete="off" placeholder="搜索" class="search-input" />
                            <a class="search-btn" href="javascript:void(null)"><i class="iconfont ic-search"></i></a>
                        </form>          </li>
                </ul>
            </div>
        </div>
    </div>
</nav>


<%--<nav class="navbar navbar-inverse navbar-fixed-top "  style="background: white; " >--%>
    <%--<div class="container" >--%>
        <%--<div class="navbar-header">--%>
            <%--<a class="navbar-brand" style="color: #d97e6d" href="#">跟着大傻学习 + Bootstrap</a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</nav>--%>

<div class="jumbotron">
    <div class="container">
        <h1>${title}</h1>
        <p>
            <c:if test="${not empty name}">
                Hello ${name}
            </c:if>

            <c:if test="${empty name}">
                Welcome ThinkingInGIS !
            </c:if>
        </p>
        <p>
            <a class="btn btn-primary btn-lg" href="#" role="button">Maps Talk</a>
        </p>
    </div>
</div>

<div class="container">

    <div class="row">
        <div class="col-md-4">
            <h2>Maps</h2>
            <p>maps</p>
            <p>
                <a class="btn btn-default" href="#" role="button">Maps</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>can</h2>
            <p>can</p>
            <p>
                <a class="btn btn-default" href="#" role="button">can</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Talk</h2>
            <p>Talk</p>
            <p>
                <a class="btn btn-default" href="#" role="button">Talk</a>
            </p>
        </div>
    </div>

    <hr>
    <footer>
        <p>© ThinkingInGIS 2016</p>
    </footer>
</div>
<%--<script type="text/javascript" src="/static/js/jquery.js"></script>--%>
<%--<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>--%>


<div>Hello World! 大傻要学登录</div>



<div>--------------------- 登录模块 ---------------------</div>

<%-- 表单提交中文乱码问题   https://www.cnblogs.com/jing58/p/6061323.html --%>
<form action="/doLogin" method="post">
    <br>
    用户名<input type="text" name="userName" id="name"> <br>
    密码<input type="text" name="password" id="pwd"><br>
    <input class="btn btn-primary btn-lg" type="submit">

</form>
<div>--------------------- 登录模块 ---------------------</div>
<br><br><br><br><br><br>
<div>--------------------- 注册模块 ---------------------</div>


<form action="/doRegister" method="post">
    <br>
    用户名<input type="text" name="userName"> <br>
    密码<input type="text" name="password"><br>
    电话号码<input type="text" name="phone"><br>
    性别<input type="text" name="sex"><br>
    住址<input type="text" name="address"><br>
    公司名称<input type="text" name="company"><br>

    <input class="btn btn-primary btn-lg" type="submit">

</form>


<div>--------------------- 注册模块 ---------------------</div>

</body>


</html>