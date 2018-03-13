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
             <div class="container">
                <div class="row">
                    <form role="form" action="${ctx}/update_do" method="POST" >
                        <div class="form-group">
                            <label for="id" class="hidden">客户姓名</label>
                            <input type="text" class="form-control hidden" name="id" value="${customer.id}"placeholder="请输入客户姓名">
                        </div>
                        <div class="form-group">
                            <label for="name">客户姓名</label>
                            <input type="text" class="form-control" name="name" value="${customer.name}" placeholder="请输入客户姓名">
                        </div>
                        <div class="form-group">
                            <label for="phone">手机</label>
                            <input type="text" class="form-control" name="phone" value="${customer.phone}" placeholder="请输入客户手机号">
                        </div>
                        <div class="form-group">
                                <label for="email">邮箱</label>
                                <input type="text" class="form-control" name="email" value="${customer.email}" placeholder="请输入客户邮箱">
                            </div>
                      
                        <div class="form-group">
                            <label for="gender">性别</label>
                            <br>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男" <c:if test="${customer.gender == '男'}" > checked </c:if>> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女" <c:if test="${customer.gender == '女'}" > checked </c:if>> 女
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="description">描述</label>
                            <textarea  class="form-control" name="description" row="4" col="40" value="${customer.description}" placeholder="请输入描述"></textarea>
                        </div>
                        <button type="submit" class="btn btn-info">更新</button>
                        <button class="btn" onclick="java:history.go(-1)">更新</button>
                    </form>
                </div>
            </div>
 
    </body>
</html>
