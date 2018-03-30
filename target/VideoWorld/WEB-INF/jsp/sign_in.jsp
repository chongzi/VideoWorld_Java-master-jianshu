<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>

<html>

<head>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/css/web.css"/>
    <link rel="stylesheet" href="/static/css/entry.css"/>
    <title > 跟着大傻学登录</title>
</head>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>


<body lang="zh-CN" class="no-padding reader-black-font">
<!-- 全局顶部导航栏 -->



<div class="sign">

    <div class="logo">

        <a href="/">
            <img src="../../static/images/logo.png" alt="Logo">

        </a>

    </div>


    <div class="main">

        <h4 class="title">

            <div class="normal-title">
                <a class="active" href="/sign_in">
                    登录
                </a>
                <b> · </b>
                <a id="js-sign-up-btn" class href="/sign_up">
                    注册
                </a>
            </div>

        </h4>

        <div class="js-sign-in-container">


            <%-- 表单提交中文乱码问题   https://www.cnblogs.com/jing58/p/6061323.html --%>
            <form id="new_session" action="/doLogin" method="post">
                <br>

                <div class="input-prepend restyle js-normal">
                    <input type="text" name="userName" id="name" placeholder="手机号或邮箱">

                    <i class="iconfont ic-user">

                    </i>


                </div>


                <div class="input-prepend restyle js-normal">
                    <input type="password" name="password" id="pwd" placeholder="密码"><br>
                    <i class="iconfont ic-password">
                    </i>
                </div>


                <input class="sign-in-button" type="submit" value="登录" style="pointer-events: auto;">
                <%--<span id="sign-in-loading" style="display: none"></span>--%>
                <%--登录--%>


                <div class="remember-btn">
                    <input type="checkbox" value="true" checked="true"/><span>记住我</span>
                </div>

                <div class="forget-btn">
                    <a class data-toggle="dropdown" href="/">登录遇到问题?</a>
                </div>

                <ul class="dropdown-menu">
                    <li><a>用手机号重置密码</a></li>
                    <li><a>用邮箱重置密码</a></li>
                    <li><a>无法用海外手机号登录</a></li>
                    <li><a>无法用 Google 帐号登录</a></li>
                </ul>

            </form>


            <div class="more-sign">
                <h6>
                    社交账号登录
                </h6>
                <ul>
                    <li>
                        <a class="weibo" id="weibo-link">
                            <i class="iconfont ic-weibo">

                            </i>
                        </a>
                    </li>

                    <li>
                        <a class="weibo" id="weibo-link">
                            <i class="iconfont ic-weibo">

                            </i>
                        </a>
                    </li>

                    <li>
                        <a class="weibo" id="weibo-link">
                            <i class="iconfont ic-weibo">

                            </i>
                        </a>
                    </li>

                    <li>
                        <a class="weibo" id="weibo-link">
                            <i class="iconfont ic-weibo">

                            </i>
                        </a>
                    </li>

                </ul>

            </div>


        </div>
        <br><br><br><br><br><br>
    </div>


</div>



<script src="../../static/js/main.js" crossorigin="anonymous"></script>



<!-- Javascripts
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="application/json" data-name="page-data">{"user_signed_in":false,"locale":"zh-CN","os":"windows","read_mode":"day","read_font":"font2"}</script>

<script src="../../static/js/entry.js" crossorigin="anonymous"></script>
<script src="../../static/js/web.js" crossorigin="anonymous"></script>
<script src="../../static/js/web.js" crossorigin="anonymous"></script>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>



</body>


</html>