<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="vo" items="${deptList }">
	<dd><a  id="a-hover" href="<c:url value='/organChart/organizationChart?deptNo=${vo.deptNo }&deptName=${vo.deptName } '/>">
	${vo.deptName }</a></dd>
</c:forEach>
 