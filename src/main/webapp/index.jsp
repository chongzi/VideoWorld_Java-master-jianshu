<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>

<html>

<head>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/css/web.css"/>
    <link rel="stylesheet" href="/static/css/entry.css"/>
    <link rel="stylesheet" href="/static/css/entry1.css"/>
</head>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>


<style>

    .sign-up-button {
        margin-top: 20px;
        width: 200px;
        padding: 9px 18px;
        font-size: 18px;
        border: none;
        text-align: center;
        border-radius: 25px;
        margin-left: 15px;
        color: #fff;
        background: #187cb7;
        cursor: pointer;
        outline: none;
        display: block;
        clear: both
    }

</style>


<body lang="zh-CN" class="reader-black-font">

<!-- 全局顶部导航栏 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="width-limit">
        <!-- 左上方 Logo -->
        <a class="logo" href="/"><img src="/static/images/logo.png" alt="Nav logo"/></a>

        <!-- 右上角 -->
        <!-- 未登录显示登录/注册/写文章 -->
        <a class="btn write-btn" target="_blank" href="/writer#/">
            <i class="iconfont ic-write"></i>写文章
        </a> <a class="btn sign-up" href="/sign_up">注册</a>
        <a class="btn log-in" href="/sign_in">登录</a>

        <!-- 如果用户登录，显示下拉菜单 -->

        <div id="view-mode-ctrl">
        </div>
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu"
                        aria-expanded="false">
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
                        </a></li>
                    <li class="tab ">
                        <a id="web-nav-app-download-btn" class="app-download-btn"
                           href="/apps?utm_medium=desktop&amp;utm_source=navbar-apps"><span
                                class="menu-text">下载App</span><i class="iconfont ic-navigation-download menu-icon"></i></a>
                    </li>
                    <li class="search">
                        <form target="_blank" action="/search" accept-charset="UTF-8" method="get"><input name="utf8"
                                                                                                          type="hidden"
                                                                                                          value="&#x2713;"/>
                            <input type="text" name="q" id="q" value="" autocomplete="off" placeholder="搜索"
                                   class="search-input"/>
                            <a class="search-btn" href="javascript:void(null)"><i class="iconfont ic-search"></i></a>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>


<%--  中间 整个浏览器  屏幕 开始 --%>
<div class="container index">

    <%-- 中间 渲染部分 开始 --%>
    <div class="row">

        <%-- 中间左边部分  开始 --%>
        <div class="col-xs-16 main">


            <!-- Banner -->

            <div id="indexCarousel" class="carousel slide">

                <div class="carousel-inner">
                    <div class="item active">
                        <div class="banner" data-banner-name="交友活动">
                            <a target="_blank" href="/">
                                <img src="static/images/content.jpg">
                            </a>
                        </div>
                    </div>
                </div>

            </div>


            <!-- Banner -->

            <%--  专辑列表 --%>

            <div class="recommend-collection">
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">
                    <div class="name">故事</div>
                </a>
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">
                    <div class="name">@it.互联网</div>
                </a>
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">
                    <div class="name">摄影</div>
                </a>
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">

                    <div class="name">读书</div>
                </a>
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">
                    <div class="name">人文社科</div>

                </a>
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">
                    <div class="name">自然科普</div>

                </a>
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">
                </a>
                <a class="collection" target="_blank" href="/">
                    <img src="static/images/man-hands-reading-boy-large.jpg">
                    <div class="name">简书电影</div>
                </a>
                <a class="more-hot-collection" target="_blank" href="/">
                    更多热门专题
                </a>

            </div>

            <%--  专辑列表 --%>


            <%--  分割线 --%>
            <div id="list-container"></div>
            <%--  分割线 --%>


            <div id="list-container">

            </div>


            <a class="sign-up-button" name="反馈 列表" href="<%=appPath%>/v1/getFeedBacksJsp"/> hello wordl 获取所有的 反馈 列表


            <br/>


            <div>

                <a class="sign-up-button" name="bootstrap 使用界面" href="/toLogin"/> bootstrap 使用界面

                <br>
                <br>

                <a class="sign-up-button" name="跳转 home 界面" href="/user/toHome"/> 跳转 home 界面
                <%--<a name="bootstrap 使用界面" href="/WEB-INF/jsp/login.jsp"/> bootstrap 使用界面--%>


                <br>
                <br>
                <br>

                <a class="sign-up-button" name="" href="/doLoginOut"/> 注销登录

                <br>
                <a class="sign-up-button" onclick="getCookie('userName')"> 此处显示 session 值 </a>


            </div>

        </div>
        <%-- 中间左边部分  结束 --%>

        <%-- 中间右→边部分  结束 --%>

        <div class="col-xs-7 col-xs-offset-1 aside">


            <div class="board">
                <a target="_blank" href="/">
                    <img src="static/images/banner-s-3.png">
                </a>
                <a target="_blank" href="/">
                    <img src="static/images/banner-s-3.png">
                </a>
                <a target="_blank" href="/">
                    <img src="static/images/banner-s-3.png">
                </a> <a target="_blank" href="/">
                <img src="static/images/banner-s-3.png">
            </a>
                <a target="_blank" href="/">
                    <img src="static/images/banner-s-3.png">
                </a>
                <a target="_blank" href="/">
                    <img src="static/images/banner-s-3.png">
                </a>

            </div>


            <h1>7日热门</h1>
            <h1>30日热门</h1>
            <h1>大傻出版</h1>
            <h1>大傻学堂</h1>
            <h1>下载大傻app</h1>
            <h1>推荐作者 --- 大傻 </h1>

            <h1>大傻 </h1>
            <h1>2傻 </h1>
            <h1>3傻 </h1>
            <h1>4傻 </h1>
            <h1>5傻 </h1>
            <h1>6傻 </h1>
            <h1>7傻 </h1>
            <h1>8傻 </h1>
            <h1>N傻 </h1>
        </div>


        <%-- 中间右→边部分  结束 --%>


    </div>
    <%-- 中间 渲染部分 结束 --%>


</div>
<%--  中间 整个浏览器  屏幕 结束 --%>


<footer class="container">
    <div class="row">

        <div class="col-xs-17 main">

            <a target="_blank" href="/">关于简书</a>
            <em> · </em>
            <a target="_blank" href="/">联系我们</a>
            <em> · </em>
            <a target="_blank" href="/">简书出版</a>
            <em> · </em>
            <a target="_blank" href="/">品牌与微标</a>
            <em> · </em>
            <a target="_blank" href="/">帮助中心</a>
            <em> · </em>
            <a target="_blank" href="/">合作伙伴</a>
            <em> · </em>


            <div class="icp">


                ©2012-2018 上海佰集信息科技有限公司 / 简书 / 沪ICP备11018329号-5 /


                <a target="_blank" href="/"></a>
                <a target="_blank" href="/">沪公网安备31010402002252号 / </a>
                <a target="_blank" href="/"> 举报电话：021-34770013 /
                </a>
                <a target="_blank" href="/">

                </a>


            </div>


        </div>


    </div>


</footer>


<script>


    //    // 取得Cookie的值
    function getCookie(key) {
        var name = key + "=";
        var ca = document.cookie.split(';');
        alert(ca[0]);
        //        alert(name + ca);
        return ca;
    }

    //    var name = key + "=";
    //    var ca = document.cookie.split(';');
    //    alert(ca.userName);


</script>


</body>


</html>
