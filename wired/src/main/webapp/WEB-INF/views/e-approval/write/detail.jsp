<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- 부트스트랩 version 4.6.0 -->
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<!-- 수정용CSS -->
<link href="${pageContext.request.contextPath}/resources/css/wiredStyle.css" rel="stylesheet">

<style type="text/css">
.f-right {
	float: right;
}

.f-left {
	float: left;
}

.setW20 {
	width: 20%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.paper {
	width: 210mm;
	min-height: 297mm;
	padding: 20mm; /* set contents area */
	margin: 10mm auto;
	border-radius: 5px;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	word-break: normal;
}

.tg .tg-cly1 {
	text-align: left;
	vertical-align: middle
}

.tg .tg-lboi {
	border-color: inherit;
	text-align: left;
	vertical-align: middle
}

.dnd {
	background-color: silver;
}

.sigTitle {
	height: 20px;
	background-color: pink;
}

.sigImg {
}

.sigBox {
	height: 70px;
}

.btnMargin {
	margin-left: 40px;
	margin-top: 5px;
}

</style>

<script type="text/javascript">
	$(function() {

	});


</script>
<div class="container-fluid">
<%@ include file="../include/navbar.jsp"%>
	<div>
		<div class="card shadow mb-4">
			<div class="card-header py-3 ">
				<div class="setW20 f-left">
					<h6 class="m-0 font-weight-bold text-primary">문서상세보기</h6>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div class="paper">
						<div class="content">

							<table class="tg t-center" style="table-layout: fixed; width: 100%;">
								<thead>
									<tr>
										<th class="tg-lboi text-center" colspan="3" rowspan="5"><h3>${docformVo.formName }</h3></th>
										<th class="tg-lboi" colspan="4" rowspan="5"><img
											src="<c:url value='/resources/img/logo/wired_logo.png'/>"></th>
											<c:if test="${!empty orderList || confirmVo.cfState>2 }">
												<c:forEach var="orderMap" items="${orderList }">
										<th>
													<div class="sigBox">
														<div class="sigTitle">${orderMap["MEM_NAME"] } </div>
														<div class="sigImg" >
														<img src="<c:url value='/upload/signature/${orderMap["MEM_ORIGINALFILENAME"]}'/>" width="70px" style="margin-top: 0">
														</div>
													</div>
										</th>
												</c:forEach>
											</c:if>
									</tr>
									<tr>
									</tr>
									<tr>
									</tr>
									<tr>
									</tr>
									<tr>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="tg-lboi">기안부서</td>
										<td class="tg-lboi" colspan="2">${map["DEPT_NAME"]}</td>
										<td class="tg-lboi">기안일</td>
										<td class="tg-lboi" colspan="2">${confirmVo.cfRegdate}</td>
										<td class="tg-lboi">문서번호</td>
										<td class="tg-lboi" colspan="2">WIRED-${confirmVo.cfNo }</td>
									</tr>
									<tr>
										<td class="tg-lboi">기안자</td>
										<td class="tg-lboi" colspan="2">${map["MEM_NAME"] }</td>
										<td class="tg-lboi">보존년한</td>
										<td class="tg-lboi" colspan="2">5년</td>
										<td class="tg-lboi">비밀등급</td>
										<td class="tg-lboi" colspan="2">대외비</td>
									</tr>
									<tr>
										<td class="tg-lboi">제목</td>
										<td class="tg-lboi" colspan="8"><input
											class="form-control" type="text" id="cfTitle" name="cfTitle" readonly="readonly" value="${confirmVo.cfTitle }"></td>
									</tr>
									<tr>
										<td class="tg-0lax" colspan="9" rowspan="14"><textarea
												id="txtContent" name="cfContent" rows="20" cols="100" style="width: 100%;"
												class="infobox" readonly="readonly">${confirmVo.cfContent }</textarea> <!-- textarea 밑에 script 작성하기 -->
										</td>
									</tr>
								</tbody>
								<!-- <tfoot>
									<tr>
										<td class="tg-0lax">증빙서류</td>
										<td class="tg-0lax dnd" colspan="8"></td>
									</tr>
								</tfoot> -->
							</table>
							<input type="hidden" name="cfNo" value="${confirmVo.cfNo }">
							<input type="hidden" name="memNo" value="${map['MEM_NO'] }">
							<input type="hidden" name="deptNo" value="${map['DEPT_NO'] }">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>