<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">전자결재 시스템</h1>
<p class="mb-4">e-Approval system</p>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarScroll">
		<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
			style="max-height: 100px;">
			<li class="nav-item active"><a class="nav-link active" href="<c:url value='/e-approval/mainpage'/>">Home</a></li>
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/e-approval/write/selectForm'/>">문서작성</a></li>
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/e-approval/docbox'/>">문서함</a></li>
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/e-approval/confirm/confirmAdmin'/>">결재선관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/e-approval/signature/uploadPage'/>">서명관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/e-approval/doctype/admin'/>">문서관리</a></li>
		</ul>
	</div>
</nav>