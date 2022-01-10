<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/addbook/addressBook -->
<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style>
.setW20 {
	width: 20%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.s-half-style {
	width: 31.5%;
}

span {
	padding-top: 11px;
	padding-left: 3px;
	padding-right: 3px;
}

.rank-margin {
	margin-top: 16px;
}

.check-margin {
	margin-top: -17px;
	margin-left: 6px;
}

.check-margin2 {
	margin-top: 13px;
	margin-left: 6px;
}

#t-width {
	width: 3%;
}
</style>
<!-- javaScript영역 -->
<!-- 4 include the jQuery library -->
<script
	src="<c:url value='/resources/api/jsTree/dist/libs/jquery.js'/> "></script>
<!-- 5 include the minified jstree source -->
<script src="<c:url value='/resources/api/jsTree/dist/jstree.min.js'/> "></script>
<script>
	$(function() {
		$('#jstree').jstree({
			'core' : {
				'themes' : {
					'name' : 'proton',
					'responsive' : true
				}
			}
		});
	});

	$(function() {
		$('#addadd_button').click(
				function() {
					if ($('#addName').val().length < 1) {
						alert('이름을 입력하세요');
						$('#addName').focus();
						event.preventDefault();
					} else if ($('#addTel').val().length < 1) {
						alert('연락처를 입력하세요');
						$('#addTel').focus();
						event.preventDefault();
					} else if (!validate_phone($('#addTel').val())
							|| !validate_phone($('#addTel').val())) {
						alert('연락처는 숫자만 가능합니다.');
						$('#addTel').focus();
						event.preventDefault();
					}

					if ($('#addPosition').val() == "") {
						$('#addPosition').val();
					}
					if ($('#addDepart').val() == "") {
						$('#adDdepart').val();
					}
					if ($('#addCompany').val() == "") {
						$('#addCompany').val();
					}
					if ($('#addEmail').val() == "") {
						$('#addEmail').val();
					}

				});

	});

	$('#dataform #allCheckbox').on('click', function() { // 체크박스 전체선택, 전체해제
		// 전체 선택 체크박스를 눌렀을 경우
		if ($('#allCheckbox').prop("checked")) { // 체크된 경우
			$("input[type=checkbox]").prop("checked", true); // 화면의 checkbox를 전부 체크해준다.
		} else { // 체크해제된 경우
			$("input[type=checkbox]").prop("checked", false); // 화면의 checkbox를 전부 해제.
		}
	});
</script>
<!-- 전자결재HOME -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">주소록</h1>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 100px;">
			</ul>
			<form class="d-flex">
				<input class="form-control mr-2" type="search" placeholder="이름으로 검색"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit1">Search</button>
			</form>
		</div>
	</nav>
	<div>
		<!-- title1 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">지노지노님의 주소록</h6>
				<nav class="f-right" aria-label="...">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#addbookModal">추가</button>
					<div class="modal fade" id="addbookModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="addbookModal">주소록 추가</h5>
								</div>
								<div class="modal-body">



									<form class="user">
										<div class="table-responsive">
											<!-- 이름 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size" id="addName"
													name="addName" placeholder="이름">
											</div>
											<!-- 연락처 -->
											<div class="form-group row">
												<input type="text"
													class="form-control form-control-user c-size" id="addTel"
													name="addTel" placeholder="연락처">
											</div>
											<!-- 이메일 -->
											<div class="form-group rank-margin">
												<input type="text"
													class="form-control form-control-user c-size" id="addEmail"
													name="addEmail" placeholder="이메일">
											</div>
											<!-- 회사 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size"
													id="addCompany" name="addCompany" placeholder="회사명">
											</div>
											<!-- 부서 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size"
													id="addDepart" name="addDepart" placeholder="부서">
											</div>
											<!-- 직급 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size"
													id="addPosition" name="addPosition" placeholder="직급">
											</div>

										</div>
									</form>




									<div class="modal-footer">
										<button type="button" class="btn btn-secondary b-radius"
											data-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary b-radius"
											id="addadd_button">추가하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal fade" id="addeditModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">주소록 수정</h5>
								</div>


								<div class="modal-body">
									<form class="user">
										<div class="table-responsive">
											<!-- 이름 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size" id="editName"
													name="editName" value="${map['ADDRBOOK_NAME'] }">
											</div>
											<!-- 연락처 -->
											<div class="form-group row">
												<input type="text"
													class="form-control form-control-user c-size" id="editTel"
													name="editTel" placeholder="연락처">
											</div>
											<!-- 이메일 -->
											<div class="form-group rank-margin">
												<input type="text"
													class="form-control form-control-user c-size"
													id="editEmail" name="editEmail" placeholder="이메일">
											</div>
											<!-- 회사 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size"
													id="editCompany" name="editCompany" placeholder="회사명">
											</div>
											<!-- 부서 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size"
													id="editDepart" name="editDepart" placeholder="부서">
											</div>
											<!-- 직급 -->
											<div class="form-group">
												<input type="text"
													class="form-control form-control-user c-size"
													id="editPosition" name="editPosition" placeholder="직급">
											</div>

										</div>
									</form>
								</div>



								<div class="modal-footer">
									<button type="button" class="btn btn-secondary b-radius"
										data-dismiss="modal">취소</button>
									<button type="submit1" class="btn btn-primary b-radius">수정하기</button>
								</div>
							</div>
						</div>
					</div>
					<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#adddeleteModal">삭제</button>
					<div class="modal fade" id="adddeleteModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">주소록 삭제</h5>
								</div>
								<div class="modal-body">김강희님을 주소록에서 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary b-radius"
										data-dismiss="modal">취소</button>
									<button type="submit1" class="btn btn-primary b-radius">삭제하기</button>
								</div>
							</div>
						</div>
					</div>
				</nav>
			</div>
			<div class="card-body">
				<div class="table-responsive" id="dataform">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th id="t-width"><input type="checkbox"
									class="form-check-input check-margin" id="allCheckbox"></th>
								<th>이름</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>회사명</th>
								<th>부서명</th>
								<th>직급</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty addbookList }">
								<tr>
									<td colspan="6">데이터가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty addbookList }">
								<!-- 리스트 반복문 시작 -->
								<c:forEach var="map" items="${addbookList }">
									<tr>
										<td><input type="checkbox"
											class="form-check-input check-margin2"></td>
										<td>${map['ADDRBOOK_NAME'] }</td>
										<td>${map['ADDRBOOK_TEL'] }</td>
										<td>${map['ADDRBOOK_EMAIL'] }</td>
										<td>${map['ADDRBOOK_COMNAME'] }</td>
										<td>${map['ADDRBOOK_DEPT'] }</td>
										<td>${map['ADDRBOOK_RANK'] }</td>
										<td><button type="button" class="btn btn-success"
												data-toggle="modal" data-target="#addeditModal">수정</button></td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- 반복 끝 -->
						</tbody>
					</table>
					<nav class="f-right" aria-label="...">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link">Previous</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active" aria-current="page"><a
								class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>