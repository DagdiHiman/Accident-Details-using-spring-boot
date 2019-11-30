package com.JAD.himan.AccidentDetails.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
class HomepageController{
	
	@RequestMapping(value="/homepage", method= RequestMethod.GET )
	public String showLoginMessage() {
		return "homepage";
	}
	
	@RequestMapping(value="/contactus", method= RequestMethod.GET )
	public String showData() {
		return "contactus";
	}

}