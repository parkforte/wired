package com.gr.wired.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ApprovalUtil {

	/**
	 * 현재날짜출력
	 * @return
	 */
	public static String getToDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(Calendar.getInstance().getTime());
	}

}
