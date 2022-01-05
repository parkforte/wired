<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style>
.set400 {
	width: 400px;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.f-center{
	margin: 0 auto;
}

.canvasBox{
	width: 300px;
	height: 300px;
	background-color: white;
	border-radius: 15px;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.5);
	margin-left: 20px;
	margin-top: 20px;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">
	$(function(){
		$('#btnPaint').click(function(){
			open('paint','paint',
			 'width=400,height=300,left=50,top=50,location=yes,resizable=yes');
		});

	});
</script>
<!-- 전자결재HOME -->
<div class="container-fluid">
<%@ include file="../include/navbar.jsp"%>
	<div class=" f-center">
		<div class="card shadow mb-4 setMR10 set400">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">서명확인</h6>
			</div>
			<div class="card-body">
				<div class="canvasBox">
					<img src="<c:url value='/upload/signature/${emplVo.memOriginalfilename }'/>"
		 		border="0" width="100%">
				</div>
			</div>
		</div>


		<!-- title1 -->
		<div class="card shadow mb-4 set400 f-left">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">서명등록</h6>
			</div>
			<div class="card-body">
				<form method="post" enctype="multipart/form-data" name="noticeForm"
					action="<c:url value='/e-approval/signature/upload'/>">
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
					    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
					  </div>
					</div>
					<div style="text-align: center;">
						<button type="button" data-toggle="modal"
							data-target="#exampleModal" class="btn btn-primary b-radius">등록하기</button>
						<button type="button" id="btnPaint" class="btn btn-primary b-radius">서명만들기</button>
					</div>
					<!-- 서명등록모달 -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">결재서명등록</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">등록하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary b-radius"
										data-dismiss="modal">취소</button>
									<input type="submit" class="btn btn-primary b-radius" value="등록">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>
