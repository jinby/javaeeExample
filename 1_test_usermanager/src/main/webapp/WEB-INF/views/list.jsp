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
    </body>
</html>