<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${cxt}"/>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${ctx}/statics/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/statics/css/main.css">
        <script src="${ctx}/statics/js/jquery-1.9.1.min.js"></script>
        <script src="${ctx}/statics/js/bootstrap.min.js"></script>
        <script src="${ctx}/statics/js/jquery.form.js"></script>

        <script type="text/javascript">


            <!-- lang: js -->
            String.prototype.format = function(args) {
                var result = this;
                if (arguments.length < 1) {
                    return result;
                }

                var data = arguments;       //如果模板参数是数组
                if (arguments.length == 1 && typeof (args) == "object") {
                    //如果模板参数是对象
                    data = args;
                }
                for (var key in data) {
                    var value = data[key];
                    if (undefined != value) {
                        result = result.replace("{" + key + "}", value);
                    }
                }
                return result;
            }


            var g_pageSize = 20;


            function  aaa() {
                alert("123");
            }

            //发送函数
            function ajaxGetPageBean(pageIndex, pageSize) {
                $.post(
                    "${ctx}/ajaxQuery",
                    {pageIndex:pageIndex, pageSize:pageSize},
                    function (pageBean) {
                        //console.log(pageBean);
                        GeneratePage(pageBean);
                    },
                    "json"
                );
            }

            //每个锚点发送的调用
            function pageElement_a_Click(e) {
                var pageIndex = $(e).attr("index");
                ajaxGetPageBean(pageIndex, g_pageSize);
            }

            //根据pageBean中的pojo生成每一列的element ，其被GenerateList调用
            function GeneratePage(pageBean){
                GenerateList(pageBean);
                GenerateBar(pageBean);
            };

            // -----  获取后的数据
            //根据pageBean中的pojo生成每一列的element ，其被GenerateList调用
            function  GenerateItems(item) {
                var s = "<tr><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{0}</td></tr>".format(
                    item.id,item.name,item.gender,item.email,item.phone
                );

                return s;
            };

            //根据pageBean中的pojo生成每一列的element ，其被GenerateList调用
            function GenerateList(pageBean) {
                var s = "<table class=\"table\"><tr>\
                    <th>姓名</th>\
                    <th>性别</th>\
                    <th>邮箱</th>\
                    <th>电话</th>\
                    <th>操作</th>\
                    </tr>";
                for (var i=0;i<pageBean.list.length;i++)
                {
                    s += GenerateItems(pageBean.list[i])
                }

                s+= "</table>";

                $("#pageBeanShow").html(s);
            };

            //
            function GenerateBar(pageBean){
                var s = "";
                if ( pageBean.pageIndex != 1 )
                {
                    s += ("<a href=\"#\" onclick='javascript:pageElement_a_Click(this); return false;' index=\"{0}\">上一页</a>".format(pageBean.pageIndex - 1));
                }

                for( var i=pageBean.start; i<=pageBean.end; i++ )
                {
                    if ( i == pageBean.pageIndex )
                        s += i;
                    else
                        s += "<a href=\"#\" onclick='javascript:pageElement_a_Click(this); return false;' index=\"" + i + "\">" + i + "</a>";
                }

                if ( pageBean.pageIndex != pageBean.totalPage )
                {
                    s += ("<a href=\"#\" onclick='javascript:pageElement_a_Click(this); return false;' index=\"{0}\">下一页</a>".format(pageBean.pageIndex + 1));
                }

                $("#pageBeanShow").append(s);
            }


            $(document).ready(function () {
                ajaxGetPageBean(1, g_pageSize);
            });
        </script>
    </head>
    <body>
            <div class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header"><a href="#" class="navbar-brand">品牌名称</a></div>
                    <ul class="nav navbar-nav navbar-left">
                            <li><a href="${ctx}/add">添加用户</a></li>
                            <li class="active"><a href="#">用户列表</a></li>
                            <li><a href="${ctx}/query">高级查询</a></li>
                    </ul>
                </div>
            </div>

    <div class="container">
        <div class="row">
            <div id="pageBeanShow">
            </div>
        </div>
    </div>

    </body>
</html>