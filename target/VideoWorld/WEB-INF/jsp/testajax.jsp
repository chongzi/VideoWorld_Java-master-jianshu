<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--<script type="text/javascript" src="../static/js/jquery-1.7.2.min.js"></script>-->
    <!--JS的地址可以写成下面这样，将来部署的时候，这些静态文件就可以单独部署了，不依赖于后台路径-->
    <script type="text/javascript" src="http://localhost:8080/sshdemo/static/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            ajaxRequest();
        });

        function ajaxRequest() {
            $.ajax({
                url: "http://localhost:8080/sshdemo/hello/ajax",
                type: "POST",
                dataType: "json",
                data: {
                    "a": 1,
                    "b": 2,
                    "c": 3
                },
                async: false,
                success: function(data) {
                    alert("success");
                    $.each(data, function(index, element) {
                        alert(element.a);
                        alert(element.b);
                        alert(element.c);
                    });
                },
                error: function() {
                    alert("error");
                }
            });
        }
    </script>
</head>
<body>
<div>Hello World!</div>
</body>
</html>