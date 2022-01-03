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
			<li class="nav-item active"><a class="nav-link active" href="<c:url value='/e-approval/mainpage'/>">Home</a>
			</li>
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/e-approval/paperWrite'/>">문서작성</a>
			</li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarScrollingDropdown" role="button" data-toggle="dropdown"
				aria-expanded="false"> 문서함 </a>
				<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
					<li><a class="dropdown-item" href="<c:url value='/e-approval/docbox'/>">결재대기</a></li>
					<li><a class="dropdown-item" href="#">결재완료</a></li>
					<li><a class="dropdown-item" href="#">결재반려</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#">임시저장</a></li>
				</ul></li>
			<li class="nav-item active"><a class="nav-link" href="#">문서결재</a>
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/e-approval/doctype/admin'/>">문서관리</a>
			</li>
		</ul>
		<form class="d-flex">
			<input class="form-control mr-2" type="search" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>
</nav>