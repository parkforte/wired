<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th>자원명</th>
                                   <th>자원정보</th>
<!--                                    <th>기간</th> -->
                                   <th>예약정보</th>
                                   <th>예약위치</th>
                                   <th>부서</th>
                               </tr>
                           </thead>
                           <tbody>
                           <c:if test="${empty jList }">
                            	<tr>
                            		<td colspan="5">데이터가 없습니다.</td>
                            	</tr>
                            </c:if>
                            <c:if test="${!empty jList }">
                        	<c:forEach var="map" items="${jList }">
                               <tr>
                                   <td>${map['TYPE_NAME'] }</td>
                                   <td>${map['RES_NAME'] }</td>
<!--                                    <td> -->
<%--                                    <fmt:formatDate value="${map['USE_REGDATE'] }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${map['RETURN_REGDATE'] }" pattern="yyyy-MM-dd"/></td> --%>
                                   <td>${map['RESERV_CONTENT'] }</td>
                                   <td>
                                   <input type="hidden" value="${map['RES_NO'] }">
                                   ${map['RES_LOCATION'] }
                                   </td>
                                   <td>${map['DEPT_NAME'] }</td>
                               </tr>
                        </c:forEach>
                        </c:if>
                           </tbody>
    </table>