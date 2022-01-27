package com.gr.wired.weather.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/weather")
public class WeatherController {
	private static final Logger logger =LoggerFactory.getLogger(WeatherController.class);

	@RequestMapping("/weather_api")
	public String weather() {
		logger.info("날씨 화면");

		return "weather/weather_api";

	}

}
