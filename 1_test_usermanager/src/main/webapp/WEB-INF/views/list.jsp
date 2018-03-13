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

            <div class="container">
                <table class="table">
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageBean.list}" var="cus">
                        <tr>
                            <td>${cus.name}</td>
                            <td>${cus.gender}</td>
                            <td>${cus.email}</td>
                            <td>${cus.phone}</td>
                            <td>
                                <!-- Split button -->
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger">操作</button>
                                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="${ctx}/update_pre/${cus.id}">修改</a></li>
                                        <li><a href="${ctx}/delete_pre/${cus.id}">删除</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

                <%-- 构建分页导航 --%>
                共有${pageBean.totalRecord}个员工，共${pageBean.totalPage }页，当前为${pageBean.pageNum}页
                <br/>
                <a href="${cxt}/list/1">首页</a>

                <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
                <c:if test="${pageBean.pageNum ==1}">
                    <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
                        <c:if test="${pageBean.pageNum == i}">
                            ${i}
                        </c:if>
                        <c:if test="${pageBean.pageNum != i}">
                            <a href="${cxt}/list/${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                    <a href="${cxt}/list/${pageBean.pageNum+1}">下一页</a>
                </c:if>

                <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
                <c:if test="${pageBean.pageNum > 1 && pageBean.pageNum < pageBean.totalPage}">
                    <a href="${cxt}/list/${pageBean.pageNum-1}">上一页</a>
                    <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
                        <c:if test="${pageBean.pageNum == i}">
                            ${i}
                        </c:if>
                        <c:if test="${pageBean.pageNum != i}">
                            <a href="${cxt}/list/${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                    <a href="${cxt}/list/${pageBean.pageNum+1}">下一页</a>
                </c:if>

                <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
                <c:if test="${pageBean.pageNum == pageBean.totalPage}">
                    <a href="${cxt}/list/${pageBean.pageNum-1}">上一页</a>
                    <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
                        <c:if test="${pageBean.pageNum == i}">
                            ${i}
                        </c:if>
                        <c:if test="${pageBean.pageNum != i}">
                            <a href="${cxt}/list/${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:if>
                <%--尾页 --%>
                <a href="${cxt}/list/${pageBean.totalPage}">尾页</a>

            </div>

    </body>
</html>