package com.gr.wired.common;

public class DateSearchVO extends SearchVO{
	private String startDay;	//사용일
	private String endDay;		//반납일
	private String memId;		//사용자 아이디

	private String year;	//통계처리에서 사용
	private String month;

	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", memId=" + memId + ", year=" + year
				+ ", month=" + month + ", toString()=" + super.toString() + "]";
	}

}
