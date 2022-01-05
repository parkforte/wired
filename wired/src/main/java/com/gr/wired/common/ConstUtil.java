package com.gr.wired.common;

public interface ConstUtil {
	//페이징 처리에 필요한 상수
	int RECORD_COUNT=10;  //한페이지에 보여줄 레코드 개수
	int BLOCK_SIZE=5;

	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE="test";
	//String FILE_UPLOAD_TYPE="deploy";

	//자료실 - 파일 저장 경로
	String FILE_UPLOAD_PATH="wired_upload";
	String FILE_UPLOAD_PATH_TEST="C:\\Users\\aaoo1\\git\\wired_ms\\wired\\wired\\src\\main\\webapp\\upload\\wired_upload";

	//관리자 페이지 - 상품 등록시 상품 이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH="pd_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST="C:\\Users\\aaoo1\\git\\wired_ms\\wired\\wired\\src\\main\\webapp\\upload\\wired_images";

	//서명업로드 페이지
	String SIGN_FILE_UPLOAD_PATH="signature";
	String SIGN_FILE_UPLOAD_PATH_TEST="C:\\Users\\hello\\git\\wired\\wired\\src\\main\\webapp\\upload\\signature";



	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1; //자료실 업로드
	int UPLOAD_IMAGE_FLAG=2; //상품 등록시 이미지 업로드
	int UPLOAD_SIGNATURE_FLAG=3; //서명 이미지 업로드

	//장바구니 - 총 구매금액이 30000원 이산이면 배송비 3000
	int TOTAL_PRICE = 30000;
	int DELIVERY = 3000;
}
