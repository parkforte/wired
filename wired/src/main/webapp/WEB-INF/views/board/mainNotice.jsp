<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                              <tr>
                                  <th style="width: 80px">WIRED</th>
                                  <th>title</th>
                                  <th style="width: 140px">등록일</th>
                                  <th style="width: 80px">조회수</th>
                                  <th style="width: 80px">추천</th>
                              </tr>
                          </thead>
                          <tbody>

					<c:if test="${empty noList }">
                         	   <tr>
                         	   	 <td colspan="7">
                         	   	 		게시글이 존제하지 않습니다.
                         	   	 </td>
                         	   </tr>
					</c:if>
					<c:if test="${!empty noList }">
                       <!-- 반복문 시작 -->
                          <c:forEach var="map" items="${noList }">
                               <tr>
                                   <td>[공지]</td>
                                   <td>
										<c:if test="${!empty map['BOARD_FILENAME'] }">
                                   			<i class="bi bi-folder"></i><!-- 첨부파일 있는 게시물의 경우if처리 -->
										</c:if>
										<a id="a-hover" href='<c:url value="/board/readCount?boardNo=${map['BOARD_NO'] }&bdlistNo=${map['BDLIST_NO'] }"/>'>
											<c:if test="${fn:length(map['BOARD_TITLE']) > 15 }">
												${fn:substring(map['BOARD_TITLE'],0,15)} ...
											</c:if>
											<c:if test="${fn:length(map['BOARD_TITLE']) <= 15 }">
												${map['BOARD_TITLE'] }
											</c:if>
										</a>
                                   </td>
                                   <td>
                                   		<fmt:formatDate value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd"/>
                                   </td>
                                   <td>${map['BOARD_READCOUNT'] }</td>
                                   <td>${map['BOARD_RECOMMEND'] }</td>
                                   	<!-- 관리자 모드일때만 보이게 if처리 게시글 번호로 수정 페이지이동, 삭제 메시지이용-->
                                   <c:if test="${sessionScope.ranksNo==3}">
<!-- 		                                   <td> -->
<!-- 		                                   		<div class="bdListBtDiv"> -->
<%-- 		                                   			<input type="text" name="boardNo2" value="${map['BOARD_NO']}"> --%>
<!-- 					                            </div> -->
<!-- 		                                   </td> -->
                                   </c:if>
                               </tr>
                          </c:forEach>
                          <!-- 반복 끝 -->

					</c:if>

                          </tbody>
                      </table>