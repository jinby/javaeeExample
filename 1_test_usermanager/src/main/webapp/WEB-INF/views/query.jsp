<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${ctx}/statics/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/statics/css/main.css">

    <script src="${ctx}/statics/js/jquery-1.9.1.min.js"></script>
    <script src="http://malsup.github.io/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/statics/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
                $("#form").ajaxForm(function(data){
                    $('#show').html(data);
                    return false;
                });
        });
    </script>
</head>
    <body>
            <div class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header"><a href="#" class="navbar-brand">品牌名称</a></div>
                    <ul class="nav navbar-nav navbar-left">
                            <li ><a href="${ctx}/add">添加用户</a></li>
                            <li><a href="${ctx}/list">用户列表</a></li>
                            <li class="active"><a href="#">高级查询</a></li>
                    </ul>
                </div>
            </div>
            <div class="container">
                    <form id="form" action="${ctx}/researchdo" role="form" method="POST">
                    <div class="form-group">
                        <label for="name">客户姓名</label>
                        <input type="text" class="form-control" name="name" placeholder="请输入姓名">
                    </div>
                    <div class="form-group">
                            <label for="gender">客户性别</label>
                            <br>
                            <select name="gender">
                                <option value="" class="active"> == 请输入客户性别 == </option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                    </div>
                    
                    <div class="form-group">
                        <lable for="phone">手机</lable>
                        <input type="text" class="form-control" name="phone" placeholder="请输入手机">
                    </div>
                    <div class="form-group">
                        <lable for="email">邮箱</lable>
                        <input type="text" class="form-control" name="email" placeholder="请输入邮箱">
                    </div> 
                    <button class="btn btn-primary" type="submit">查询</button>
                    <button class="btn btn-default" type="reset">重置</button>
                    </form>
                </div>

    <div id="show"></div>
    </body>
</html>