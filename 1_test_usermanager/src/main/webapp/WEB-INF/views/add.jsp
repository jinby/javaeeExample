<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
                            <li class="active"><a href="#">添加用户</a></li>
                            <li><a href="${ctx}/list">用户列表</a></li>
                            <li><a href="${ctx}/query">高级查询</a></li>
                    </ul>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <form role="form" action="${ctx}/add_do" method="POST" >
                        <div class="form-group">
                            <label for="name">客户姓名</label>
                            <input type="text" class="form-control" name="name" placeholder="请输入客户姓名">
                        </div>
                        <div class="form-group">
                            <label for="phone">手机</label>
                            <input type="text" class="form-control" name="phone" placeholder="请输入客户手机号">
                        </div>
                        <div class="form-group">
                                <label for="email">邮箱</label>
                                <input type="text" class="form-control" name="email" placeholder="请输入客户邮箱">
                            </div>
                      
                        <div class="form-group">
                            <label for="gender">性别</label>
                            <br>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女"> 女
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="description">描述</label>
                            <textarea  class="form-control" name="description" row="4" col="40" placeholder="请输入描述"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">提交</button>
                        <button type="reset" class="btn btn-default">重置</button>
                    </form>
                </div>
            </div>
 
    </body>
</html>
