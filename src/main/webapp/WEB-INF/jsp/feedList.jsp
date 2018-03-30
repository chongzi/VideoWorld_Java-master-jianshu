<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>

<html>


<style>

    table {
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid blue;
    }

    td {
        text-align: center;
        padding: 15px;
    }

</style>


<%--<script type="text/javascript" src="/static/js/jquery-1.8.3.js"></script>--%>
<%--<script type="text/javascript" src="http://localhost:8080/sshdemo/static/js/jquery-1.7.2.min.js"></script>--%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!--<script type="text/javascript" src="../static/js/jquery-1.7.2.min.js"></script>-->
    <!--JS的地址可以写成下面这样，将来部署的时候，这些静态文件就可以单独部署了，不依赖于后台路径-->
    <%--<script type="text/javascript" src="http://localhost:8080/sshdemo/static/js/jquery-1.7.2.min.js"></script>--%>
    <%--<script type="text/javascript" src="static/js/jquery-1.8.3.js"></script>--%>
    <script type="text/javascript" src="/static/js/jquery-1.8.3.js"></script>
    <%--http://127.0.0.1/static/js/jquery-1.8.3.js--%>


    <script type="text/javascript">
        $(document).ready(function () {
//            ajaxRequest();
        });

        function ajaxRequest() {
            $.ajax({
                url: "v1/config",
                type: "POST",
                dataType: "json",
                data: {
                    "id": 1,
                },
                async: false,
                success: function (data) {
                    alert("success");
                    $.each(data, function (index, element) {
                        alert(element.a);
                        alert(element.b);
                        alert(element.c);
                    });
                },
                error: function () {
                    alert("error");
                }
            });
        }
    </script>
</head>


<body>
<h2>feed back list </h2>
<div style="width: auto ; height: auto ; background-color: #36b051 ">

    <table class="table table-hover table-striped" id="table">
        <thead>
        <tr>
            <th>姓名</th>
            <th>反馈</th>
            <th>状态</th>
            <th>时间</th>
            <th>标记</th>
            <th>标记</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <%--<c:forEach var="feedback" items="${requestScope.get('list')}" varStatus="status">--%>
        <c:forEach var="feedback" items="${list}" varStatus="status">
            <tr>
                    <%--<td>${feedback.id}</td>--%>
                <td>${feedback.uid}</td>
                <td>${feedback.feedback}</td>


                <c:if test="${feedback.status eq 1}">
                    <td style="color: crimson">未读</td>
                </c:if>

                <c:if test="${feedback.status eq 0 }">
                    <td>已读</td>
                </c:if>


                <td>${feedback.time}</td>


                <td onclick="yet(this,1,${feedback.id})" id="td_tag_un_check"><a
                        href="<%=appPath%>/v1/doFeedBackById/${feedback.id}/1">标记未读</a>
                </td>
                <td onclick="yet(this,0,${feedback.id})" id="td_tag_check"><a
                        href="<%=appPath%>/v1/doFeedBackById/${feedback.id}/0">标记已读</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <button onclick="sayHello(1,1)">点我say hello</button>


    <button onclick=" addFeedBack('4傻','么么哒') ">-----新增反馈--插入节点--
    </button>


    <button onclick=" connect2websocket() ">-----新增反馈--插入节点--
    </button>


</div>


<div id="summarydiv" style="width: 500px; height: 100px ; background-color: #F15F22">

    hello world

    <textarea id="summary" name="summary" style="width: 500px ; height: 100px;">



    </textarea>


</div>


<div id="loading"

     style="width: 120px ;
     /*visibility: hidden;*/
     display: none;
    height: 120px ;
    color: cornsilk ;
    position: absolute  ;
    opacity: 0.5;  z-index: 666;
    top: 25%  ;
    left: 25%;
    background-color: black ;
     text-align: center ;
     line-height: 120px ;
     border-radius: 20px;
    animation: myfirst 5s;
    -moz-animation:myfirst 5s; /* Firefox */
-webkit-animation:myfirst 5s; /* Safari and Chrome */
-o-animation:myfirst 5s; /* Opera */

">
    加载中....

</div>


</body>

<%-- 增加 反馈  动态  插入列表 --%>
<script>

    /**
     *    @RequestMapping(value = "feedback")
     @ApiVersion(1)
     @ResponseBody
     public String addFeedback(HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String uid = request.getParameter("uid");
        String feedbackContent = request.getParameter("feedback");
     */

    function addFeedBack(uid, feedback) {

        append2Table()


//        $.ajax({
//            url: "/v1/feedback",
//            type: "POST",
//            data: {
//                "uid": uid,
//                "feedback": feedback
//            },
//            beforeSend: function () {
//                showLoading()
//            },
//            success: function (respon) {
//                console.log("addFeedBack succeed  ---  > " + respon.result.code)
//                append2Table()
//            },
//            error: function (XMLHttpRequest, textStatus, errorThrown) {
//                console.error("failed " + textStatus + "  errorThrown" + errorThrown)
//            },
//            complete: function () {
//                hidenLoading()
//            }
//        });

    }

</script>
<%-- 增加 反馈  动态  插入列表 --%>


<script>


    function connect2websocket() {

        if ("WebSocket" in window) {
            console.log("--您的浏览器  支持web socket --")

            var ws = new WebSocket('ws:localhost:80/feedback');

//            var v = document.createElement('a');

            ws.onopen = function () {
                //console
                console.log('-------onopen-----');

                ws.send("==hello web socket ==")


            }
            ws.onclose = function () {
                //console
                console.log('-------onclose-----');

            }

            ws.onmessage = function (event) {
                //console
                console.log('-------onmessage-----' + event.data);

                append2Table();


            }


        } else {

            alert('您的浏览器 不支持 websocket')

        }

    }

    function append2Table() {

        console.log('start append2Table')

        var tr = document.createElement("tr");
        var str = "10,五傻,未读,2019,标记未读,标记已读".split(",")
        console.log('start append2Table  lenth = ' + str.length)

        for (var i = 0; i < str.length; i++) {
            console.log(str[i])
            var td = document.createElement("td");
            td.innerHTML = str[i];

            if (i == 4) {

                var atag = document.createElement("a");
                td.innerHTML = "";
                atag.innerHTML = str[i];

//                color: -webkit-link;
//                text-decoration: underline;
//                cursor: auto;
                atag.style.color = '-webkit-link'
                atag.style.textDecoration = 'underline'
                atag.style.cursor = 'auto'

                td.appendChild(atag)


                td.onclick = function () {
                    yet(this, 1, str[0]);
                }

            } else if (i == 5) {
//                td.onclick = yet(this, 0, str[0]);
                td.onclick = function () {
                    yet(this, 0, str[0]);
                }
            }

            tr.appendChild(td);

        }

//        for (var obj in str.length) {
//            console.log(obj)
//
//
//        }
        <%--/** --%>
        <%--* </tr>--%>
        <%--href="<%=appPath%>/v1/doFeedBackById/${feedback.id}/0">标记已读</a>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <%--*/--%>

        console.log(tr)

        $('#tbody')
            .append(tr)
//            .appendChild(tr);
    }

    function showLoading() {
        $("#loading")
            .show();
    }

    function hidenLoading() {
        $("#loading")
            .hide();
    }


</script>

<script>

    //    $("#td_tag_un_check").attachEvent('onblur', function (){
    //        alert('添加事件成功！');
    //    });
    console.log("--star--")
    $(function () {

        console.log("--center- // 文档就绪-")
        //

    });


    jQuery(function ($) {
        // 你可以在这里继续使用$作为别名...
        //使用 $(document).ready() 的简写，同时内部的 jQuery 代码依然使用 $ 作为别名，而不管全局的 $ 为何
        console.log("-的简写-文档就绪---")


        console.log("-ajax 走一波  start---")


        $.ajaxSetup();


        $.ajax({

            url: "/v1/config",
            async: true,
            beforeSend: function () {
                console.log("=====beforeSend====")
                $("#loading")
                    .show();

                $("#summarydiv")
                    .value += "\n准备中.....";


            },
            cache: true,
            complete: function () {
                console.log("=====complete====")
                $("#loading")
                    .hide();

                $("#summarydiv")
                    .value += "\n初始化完成.....";
            },

            //一个以"{字符串:正则表达式}"配对的对象，用来确定jQuery将如何解析响应，给定其内容类型。
//            contents:
            //(默认: "application/x-www-form-urlencoded") 发送信息至服务器时内容编码类型
            // 。默认值适合大多数情况。如果你明确地传递了一个content-type给 $.ajax()
            // 那么他必定会发送给服务器（即使没有数据要发送）
            contentType: "application/x-www-form-urlencoded",
            //这个对象用于设置Ajax相关回调函数的上下文。
            // 也就是说，让回调函数内this  --->   指向这个对象
            // （如果不设定这个参数，那么this就指向调用本次AJAX请求时传递的options参数）。
            // 比如指定一个DOM元素作为context参数，
            // 这样就设置了success回调函数的上下文为这个DOM元素。就像这样：
            context: document.body,
            //默认： {"* text": window.String, "text html": true, "text json":
            // jQuery.parseJSON, "text xml": jQuery.parseXML}
            // 一个数据类型对数据类型转换器的对象。
            // 每个转换器的值是一个函数，
            // 返回响应的转化值
            converters: {
                "* text": window.String,
                "text html": true,
                "text json":
                jQuery.parseJSON,
                "text xml": jQuery.parseXML
            },
            //默认： 同域请求为false 跨域请求为true如果你想强制跨域请求
            // （如JSONP形式）同一域，设置crossDomain为true。
            // 这使得例如，服务器端重定向到另一个域
            crossDomain: true,
            //发送到服务器的数据。将自动转换为请求字符串格式。
            // GET 请求中将附加在 URL 后。查看 processData 选项说明以禁止此自动转换。
            // 必须为 Key/Value 格式。如果为数组，
            // jQuery 将自动为不同值对应同一个名称。
            //如 {foo:["bar1", "bar2"]} 转换为 "&foo=bar1&foo=bar2"。
            data: {
                "id": 1

            },
            dataFilter: function (data, type) {
//                 对 ajax 返回的原始数据进行  预处理
                console.log("" + data + " \n type = " + type)
                return data;


            },
            /**
             * 预期服务器返回的数据类型。如果不指定，jQuery 将自动根据 HTTP 包 MIME 信息来智能判断，比如XML MIME类型就被识别为XML。在1.4中，JSON就会生成一个JavaScript对象，而script则会执行这个脚本。随后服务器端返回的数据会根据这个值解析后，传递给回调函数。可用值:
             "xml": 返回 XML 文档，可用 jQuery 处理。
             "html": 返回纯文本 HTML 信息；包含的script标签会在插入dom时执行。
             "script": 返回纯文本 JavaScript 代码。不会自动缓存结果。除非设置了"cache"参数。'''注意：'''在远程请求时(不在同一个域下)，所有POST请求都将转为GET请求。(因为将使用DOM的script标签来加载)
             "json": 返回 JSON 数据 。
             "jsonp": JSONP 格式。使用 JSONP 形式调用函数时，如 "myurl?callback=?" jQuery 将自动替换 ? 为正确的函数名，以执行回调函数。
             "text": 返回纯文本字符串
             */
            dataType: "json",
            error: function (XMLHttpRequest, textStatus, errorThrown) {

                // 通常 textStatus 和 errorThrown 之中
                // 只有一个会包含信息

                console.log("error ---   " + errorThrown + "  textStatus=" + textStatus)
                this; // 调用本次AJAX请求时传递的options参数
            },
            //(默认: true) 是否触发全局 AJAX 事件。设置为 false 将不会触发全局 AJAX 事件，
            // 如 ajaxStart 或 ajaxStop 可用于控制不同的 Ajax 事件。
            global: true,
            //  一个额外的"{键:值}"对映射到请求一起发送。
            // 此设置被设置之前beforeSend函数被调用;
            // 因此，消息头中的值设置可以在覆盖beforeSend函数范围内的任何设置
            headers: {},
            ifModified: function () {
                console.log("ifModified  -- --- print this log ")
            },
            /**
             * 默认: 取决于当前的位置协议
             允许当前环境被认定为“本地”，（如文件系统），即使jQuery默认情况下不会承认它。
             以下协议目前公认为本地：file, *-extension, and widget。如果isLocal设置需要修改，
             建议在$.ajaxSetup()方法中这样做一次。
             */
//            isLocal:true,
            //在一个jsonp请求中重写回调函数的名字。
            // 这个值用来替代在"callback=?"这种GET或POST请求中URL参数里的"callback"部分，
            // 比如{jsonp:'onJsonPLoad'}会导致将"onJsonPLoad=?"传给服务器。
//            jsonp:
            /**
             * 为jsonp请求指定一个回调函数名。这个值将用来取代jQuery自动生成的随机函数名。
             * 这主要用来让jQuery生成度独特的函数名，这样管理请求更容易，
             * 也能方便地提供回调函数和错误处理。
             * 你也可以在想让浏览器缓存GET请求的时候，指定这个回调函数名。
             */
            jsonpCallback: function () {
                console.log("--jsonpCallback--")
            },
            //一个mime类型用来覆盖XHR的 MIME类型。
//            mimeType:
            //用于响应HTTP访问认证请求的密码
//            password:fasdf,
//          (默认: true) 默认情况下，通过data选项传递进来的数据，
//          如果是一个对象(技术上讲只要不是字符串)，都会处理转化成一个查询字符串，
//          以配合默认内容类型 "application/x-www-form-urlencoded"。
//          如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
            processData: true,
            //只有当请求时dataType为"jsonp"或"script"，并且type是"GET"才会用于强制修改charset。
            // 通常只在本地和远程的内容编码不同时使用
//            scriptCharset:
            statusCode: {
                404: function () {
                    alert("  page not found  ")
                }
            },
            success: function (data, textStatus, jqXHR) {
                //  data 可能是 xmlDoc jsonObj  html text  等等

                console.log("--success--")
                console.log("--data--" + data.code)
                console.log("--data--" + data.result.notice)


                this;// 调用本次 请求 ajax 请求时传递的  options 参数
            },
            //如果你想要用传统的方式来序列化数据，
            // 那么就设置为true。
            // 请参考工具分类下面的jQuery.param 方法。
            traditional: function () {
                console.log("--traditional--")
                false;
            },
            //设置请求超时时间（毫秒）。此设置将覆盖全局设置。
            timeout: 5000,
            type: "GET",
            UserName: "luocaca",
            /**
             * 需要返回一个XMLHttpRequest 对象。
             * 默认在IE下是ActiveXObject 而其他情况下是XMLHttpRequest 。
             * 用于重写或者提供一个增强的XMLHttpRequest 对象。
             * 这个参数在jQuery 1.3以前不可用。
             */
//            xhr:
//            xhrFields:function () {
//            一对“文件名-文件值”在本机设置XHR对象。例如，如果需要的话，
//            你可以用它来设置withCredentials为true的跨域请求。
//            }


        });


        console.log("-ajax 走一波  end---")


    });

    console.log("--end--")

    function yet(v, tag, current_id) {
        sayHello(current_id, tag, function (response) {
            console.log("  成功后返回数据  方法也是可以传递的啦啦啦啦绿绿    ")
            var color = "#ccdddd";

            //获取当前td的行位置
            var row = $(v).parent().prevAll().length;


            //获取当前td的列位置
            var col = $(v).prevAll().length;
//        alert('添加事件成功！\n 行 - >' + row + " \n 列 ->" + col);
            /* 获取当前行   的   第二列的值  并改变内容   */


            var tb = document.getElementById('table');//获取表格的dom节点
            var td = tb.rows[row + 1].cells[2];//获取0行0列的td单元格
//        td.innerHTML = "---列-" + row + "  ----rows 行" + col;//动态修改表格的内容为222

//        var red = "red";
//        td.bianse(color)

            console.log(response.result);
            var content = document.getElementById("summary");


//            var tb = document.getElementById('table');//获取表格的dom节点
//            var td = tb.rows[2-1].cells[2];//获取0行0列的td单元格
//            td.innerHTML = '已读' + "---列-" + tb.rows[1].cells.length + "  ----rows 行" + tb.rows.length;//动态修改表格的内容为222

            if (tag == 1) {
//            td.style.backgroundColor = "red" ;
                td.style.color = "red";
                td.innerHTML = "未读";//动态修改表格的内容为222
            } else {
//            td.style.backgroundColor = "red" ;
                td.style.color = "black";
                td.innerHTML = "已读";//动态修改表格的内容为222
            }
//                    $each(tb.rows.length,function (index) {
//
//                        td.innerHTML = '已读' + "---列-" + tb.rows[1].cells.length + "  ----rows 行" + tb.rows.length;//动态修改表格的内容为222
//
//
//                    });


//                    content.value +=  "\n" + response.result.toString() ;
            content.value += "\n" + JSON.stringify(response.result);

//                    $.each(response, function (index, element) {
////                        alert(element.id);
////                        alert(element.notice);
//                        $('#summary').text = element.id;
//
//
//
////                        var summarydiv = document.getElementById("summarydiv");
//                        content.text += "\n" + element.notice + "\n";
//
//
//                        content.value +=  "\n" + element ;
//
//
//                        console.log(content);
//
////                        summarydiv.text = "hahahahhaha";
//
//                    });


//                    alert("请求成功" + response.text);
            // 将请求的数据放输出到div里面
            $('#summarydiv').html(response.text);
            $('#summary').text = response.text;
            $('#summary').apentext = response.code;
            $("#loading").hide();
//                    $("#loading").hide();
//                    console.log(Math.floor((Math.random() * max) + min));


        }, function (XMLHttpRequest, textStatus, errorThrown) {
//                    alert(XMLHttpRequest.status);
//                    alert(XMLHttpRequest.readyState);
//                    alert(textStatus);
            console.log("  失败了   ")

            if (XMLHttpRequest.status == 200) {
                $("#loading")
                    .hide();
                console.log("  成功后返回数据  方法也是可以传递的啦啦啦啦绿绿    ")
                var color = "#ccdddd";

                //获取当前td的行位置
                var row = $(v).parent().prevAll().length;


                //获取当前td的列位置
                var col = $(v).prevAll().length;
//        alert('添加事件成功！\n 行 - >' + row + " \n 列 ->" + col);
                /* 获取当前行   的   第二列的值  并改变内容   */


                var tb = document.getElementById('table');//获取表格的dom节点
                var td = tb.rows[row + 1].cells[2];//获取0行0列的td单元格
//        td.innerHTML = "---列-" + row + "  ----rows 行" + col;//动态修改表格的内容为222

//        var red = "red";
//        td.bianse(color)

//                console.log(response.result);
                var content = document.getElementById("summary");


//            var tb = document.getElementById('table');//获取表格的dom节点
//            var td = tb.rows[2-1].cells[2];//获取0行0列的td单元格
//            td.innerHTML = '已读' + "---列-" + tb.rows[1].cells.length + "  ----rows 行" + tb.rows.length;//动态修改表格的内容为222

                if (tag == 1) {
//            td.style.backgroundColor = "red" ;
                    td.style.color = "red";
                    td.innerHTML = "未读";//动态修改表格的内容为222
                } else {
//            td.style.backgroundColor = "red" ;
                    td.style.color = "black";
                    td.innerHTML = "已读";//动态修改表格的内容为222
                }


            }

        })

//        function bianse(color){
//        td.style.background = color;
//        }

    }


</script>


<script>

    //    onclick(function (e) {
    //        window.alert(this.text)
    //    });


    //    $("table").on("click", "tr", function (e) {
    //        var arr = []
    //        $(this).children().map(function (el) {
    //            arr.push($(this)[0].innerText)
    //        })
    //        console.log(arr)
    //    })


    function sayHello(position, flag, onSucceed, onError) {

//        $("#loading").visibility = "visible";
        $('#loading').show();
//        $('#loading').visibility ="hidden";

        console.log($('#loading'));

//        $("#loading").visible() ;

        $(document.body).css("background", "white").show(200, "asdf");


        $("<div><p>Hello</p></div>").appendTo("body")


        var num = 110;
//        window.alert(num);
        <%--var ajax = new XMLHttpRequest();--%>

        <%--ajax.open("GET", "<%=appPath%>/v1/doFeedBackById/6/1", true);--%>

        <%--ajax.onreadystatechange = function () {--%>
        <%--if (ajax.readyState == 4) {--%>
        <%--window.alert("error");--%>
        <%--} else {--%>

        <%--var msg = ajax.responseText ;--%>
        <%--var obj = eval(msg);--%>
        <%--window.alert(obj);--%>

        <%--//                var x =xmlHttp.responseText;--%>
        <%--//                var obj = eval(x);--%>
        <%--//                alert(obj);--%>
        <%--//如何在jsp页面中使用返回的数据obj--%>


        <%--}--%>
        <%--}--%>
        <%--ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");--%>
        <%--ajax.send("hello");--%>

        <%--http://blog.csdn.net/zhoucheng05_13/article/details/53580683   解决跨域问题--%>
        $.ajax(
            {
//                url: 'www.luocaca.cn/hello-ssm/book/allbook',
//                url: '/v1/config',
                url: "/v1/doFeedBack/" + position + "/" + flag,
//                url: '/v1/doFeedBackById/6/1',
//                url: 'http://www.luocaca.cn/hello-ssm/book/allbook',
                type: 'GET',
//                data:
////                    "id": position,
////                    "flag":flag
////  //获取某个文本框的值
//                //data: "id=" + id + "&name=" + $("#name").val(),
//                "id=" + position + "&flag=" + flag
//                ,
//                contentType: 'application/json ; charset=utf-8',
                dataType: 'json',
                async: true,
//                header:"Access-Control-Allow-Origin" ,
                success: onSucceed,

                error: onError,
            }
        )


    }


</script>


</html>
