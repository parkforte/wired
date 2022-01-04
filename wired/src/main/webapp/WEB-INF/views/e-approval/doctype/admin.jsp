<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style>
.setW25 {
	width: 25%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.f-center {
	margin: 0 auto;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">
	$(funtion(){
		$('')
	});
</script>
<!-- 전자결재HOME -->
<div>
	<div class="container-fluid">
		<%@ include file="../include/navbar.jsp"%>
		<div>
			<!-- title1 -->
			<div class="card shadow mb-4 setW25 setMR10 f-left">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">문서상태</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive t-center">
							<c:if test="${empty list }">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<tr>
										<td colspan="2">문서종류없음</td>
									</tr>
								</table>
							</c:if>
							<c:if test="${!empty list }">
								<c:forEach var="vo" items="${list }">
									<table class="table table-bordered " id="dataTable" width="100%"
										cellspacing="0">
										<colgroup>
											<col width="70%">
											<col width="30%">
										</colgroup>
										<tr>
											<td><i class="bi bi-clipboard"></i> ${vo.typeName }</td>
											<td>
												<!-- 종류삭제 -->
												<a href="<c:url value='/e-approval/doctype/deleteDoc?typeNo=${vo.typeNo}'/>">
												<button type="button" class="btn btn-danger f-left">삭제</button>
												</a>
											</td>
										</tr>
									</table>
								</c:forEach>
							</c:if>
						<br>
						<div class="f-center">
							<form method="post"
								action="<c:url value='/e-approval/doctype/addDoc'/>">
								<button type="button" class="btn btn-primary f-left"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">추가</button>
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">문서종류추가</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<input type="text" class="form-control" name="typeName"
														id="typeName" placeholder="문서 종류의 이름을 입력하세요.">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-primary">등록</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 전체문서목록 -->
		<div class="card shadow mb-4">
			<!-- Card Header - Dropdown -->
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">전체문서목록</h6>
			</div>
			<!-- 본문 -->
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered t-center" id="dataTable" width="100%"
						cellspacing="0">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="50%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>문서분류번호</th>
								<th>양식번호</th>
								<th>양식이름</th>
								<th>비고</th>
							</tr>
						</thead>
						<c:if test="${empty formList }">
							<tbody>
								<tr>
									<td colspan="4">문서양식이 없습니다.</td>
								</tr>
							</tbody>
						</c:if>
						<c:if test="${!empty formList }">
						<c:forEach var="formVo" items="${formList }">
						<tbody>
							<tr>
								<td>${formVo.typeNo }</td>
								<td>${formVo.formNo }</td>
								<td>${formVo.formName }</td>
								<td>
									<!-- 양식삭제 -->
									<a href="<c:url value='/e-approval/doctype/deleteForm?formNo=${formVo.formNo }'/>">
									<button type="button" class="btn btn-danger f-left">삭제</button>
									</a>
								</td>
							</tr>
						</tbody>
						</c:forEach>
						</c:if>
					</table>
					<!-- 종류추가 -->
					<br>
					<div class="f-center">
						<button type="button" class="btn btn-primary f-left"
							data-toggle="modal" data-target="#exampleModa3"
							data-whatever="@mdo">추가</button>
					</div>

					<div class="modal fade" id="exampleModa3" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">문서양식추가</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form method="post" action="<c:url value='/e-approval/doctype/addform'/> ">
								<div class="modal-body">
										<div class="form-group">
										    <label for="exampleFormControlSelect1">문서종류선택</label>
											    <select class="form-control"  name="typeNo" id="exampleFormControlSelect1">
											      <c:if test="${!empty list }">
												      <c:forEach var="vo" items="${list }">
													      <option value="${vo.typeNo}">${vo.typeName }</option>
												      </c:forEach>
											      </c:if>
											    </select>
										  </div>
										<div class="form-group">
											<input type="text" class="form-control" id="formName" name="formName"
												placeholder="문서 종류의 이름을 입력하세요.">
										</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>
