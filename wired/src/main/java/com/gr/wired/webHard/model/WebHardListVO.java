package com.gr.wired.webHard.model;

import java.util.List;

public class WebHardListVO {
	private List<WebHardVO> webHardItems;

	public List<WebHardVO> getWebHardItems() {
		return webHardItems;
	}

	public void setWebHardItems(List<WebHardVO> webHardItems) {
		this.webHardItems = webHardItems;
	}

	@Override
	public String toString() {
		return "WebHardListVO [webHardItems=" + webHardItems + "]";
	}

}
