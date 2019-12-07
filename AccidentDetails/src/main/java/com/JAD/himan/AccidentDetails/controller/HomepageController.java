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
	public String showContactus() {
		return "contactus";
	}
	
	@RequestMapping(value="/admain", method= RequestMethod.GET )
	public String showadMain() {
		return "admain";
	}
	
	@RequestMapping(value="/location2", method= RequestMethod.GET )
	public String showadLocation2() {
		return "location2";
	}
	
	@RequestMapping(value="/location3", method= RequestMethod.GET )
	public String showadLocation3() {
		return "location3";
	}
	
	@RequestMapping(value="/location4", method= RequestMethod.GET )
	public String showadLocation4() {
		return "location4";
	}
	@RequestMapping(value="/location5", method= RequestMethod.GET )
	public String showadLocation5() {
		return "location5";
	}
	@RequestMapping(value="/location6", method= RequestMethod.GET )
	public String showadLocation6() {
		return "location6";
	}
	@RequestMapping(value="/veh_no_acc", method= RequestMethod.GET )
	public String showadVehicle1() {
		return "veh_no_acc";
	}@RequestMapping(value="/veh_per_inj", method= RequestMethod.GET )
	public String showadVehicle2() {
		return "veh_per_inj";
	}@RequestMapping(value="/veh_per_killed", method= RequestMethod.GET )
	public String showadVehicle3() {
		return "veh_per_killed";
	}
	@RequestMapping(value="/timeYear1", method= RequestMethod.GET )
	public String timeYear1() {
		return "timeYear1";
	}
	@RequestMapping(value="/timeYear2", method= RequestMethod.GET )
	public String timeYear2() {
		return "timeYear2";
	}
	@RequestMapping(value="/timeYear3", method= RequestMethod.GET )
	public String timeYear3() {
		return "timeYear3";
	}
}