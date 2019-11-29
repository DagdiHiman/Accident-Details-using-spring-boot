package com.JAD.himan.AccidentDetails.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.JAD.himan.AccidentDetails.repository.UserRepository;

@Controller
public class UserController {

	// autowiring user repository
	@Autowired 
	UserRepository userRepository;
	
	/*
	 @GetMapping
	 public String toTest() {
	  return "Welcome to Java...";
	 }*/
	 
	@RequestMapping(value="/user", method= RequestMethod.GET )
	public String showLoginMessage(ModelMap model) {
		return "user";
	}
	
	 /**
	  * this method returns list of usernames
	  * 
	  * @return username list
	  */

	@RequestMapping(value="/userlist", method= RequestMethod.GET )
	 public String getAllUserNames(ModelMap model) {
	  model.put("listusers",userRepository.getAllUserNames());
	  model.put("listAD2014", userRepository.getAccidents2014());
	  return "userlist";
	 }
	
	@RequestMapping(value="/userlist2", method= RequestMethod.GET )
	public String showData(ModelMap model) {
		return "userlist2";
	}

}