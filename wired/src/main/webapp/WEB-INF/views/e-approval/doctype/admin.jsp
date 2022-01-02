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
					<div class="table-responsive">
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
									<table class="table table-bordered" id="dataTable" width="100%"
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
				<div class="dropdown no-arrow">
					<a class="dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i
						class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
					</a>
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
						aria-labelledby="dropdownMenuLink">
						<div class="dropdown-header">정렬 :</div>
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</div>
			</div>
			<!-- 본문 -->
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Tiger Nixon</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td>2011/04/25</td>
							</tr>
						</tbody>
					</table>
					<!-- 종류추가 -->
					<br>
					<div class="f-center">
						<button type="button" class="btn btn-primary f-left"
							data-toggle="modal" data-target="#exampleModa3"
							data-whatever="@mdo">추가</button>
						<!-- 종류삭제 -->
						<button type="button" class="btn btn-danger f-left"
							data-toggle="modal" data-target="#exampleModa4">삭제</button>
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
								<div class="modal-body">
									<form>
										<div class="form-group">
											<input type="text" class="form-control" id="recipient-name"
												placeholder="문서 종류의 이름을 입력하세요.">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="recipient-name"
												placeholder="문서 종류의 이름을 입력하세요.">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="recipient-name"
												placeholder="문서 종류의 이름을 입력하세요.">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">등록</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="exampleModa4" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">문서종류삭제</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">선택하신 문서양식을 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">삭제</button>
								</div>
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
