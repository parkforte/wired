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
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">결재라인관리</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<c:if test="${!empty lineregList }">
							<c:forEach var="vo" items="${lineregList }">
								<div class="card text-center f-left setMR10"
									style="width: 15rem;">
									<div class="card-body">
										<h5 class="card-title">
											<i class="bi bi-clipboard"></i>${vo.regName }</h5>
										<a
											href="<c:url value='/e-approval/confirm/confirmLineDetail?regNo=${vo.regNo }'/>"
											class="btn btn-primary"> 상세보기</a> <a
											href="<c:url value='/e-approval/confirm/deleteLine?regNo=${vo.regNo}'/>"
											class="btn btn-danger">삭제</a>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<br>
					<div class="f-center">
						<form method="post"
							action="<c:url value='/e-approval/confirm/addLine'/>">
							<button type="button" class="btn btn-primary f-left"
								data-toggle="modal" data-target="#exampleModal"
								data-whatever="@mdo">추가</button>
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">결재라인추가</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<input type="text" class="form-control" name="regName"
													id="regName" placeholder="결재라인의 이름을 입력하세요.">
											</div>
										</div>
										<div class="modal-footer">
											<input type="text" name="lineOrder" value="0">
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
</div>

<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>
