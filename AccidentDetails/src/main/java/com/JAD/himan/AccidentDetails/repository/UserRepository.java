package com.JAD.himan.AccidentDetails.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.JAD.himan.AccidentDetails.model.ADdata;

@Repository
public class UserRepository {

 // we are autowiring jdbc template, 
 // using the properties we have configured spring automatically 
 // detects and creates jdbc template using the configuration
 @Autowired
 JdbcTemplate jdbcTemplate;
 
// @Autowired
// ADdata addata;
// Statement statement=null;
 
 
 public List<String> getAllUserNames() {
  List<String> userNameList = new ArrayList<>();
  userNameList.addAll(jdbcTemplate.queryForList("SELECT States_UTs FROM accidents;", String.class));
  return userNameList;
 }
 
 public List<String> getAccidents2014() {
	  List<String> list = new ArrayList<>();
	  list.addAll(jdbcTemplate.queryForList("SELECT Total_Number_of_Persons_Injured_in_Road_Accidents_during_2014 FROM accidents;", String.class));
	  return list;
	 }

 /*
 public List<ADdata> ADdataList() {
 		List<ADdata> list = jdbcTemplate.query("SELECT * FROM accidents", new RowMapper<ADdata>() {

 			public ADdata mapRow(ResultSet rs, int rowNum) throws SQLException {
 				ADdata addata = new ADdata();

 				addata.setStates_UTs(rs.getString("States_UTs"));
 				addata.setTotal_Number_of_Persons_Injured_in_Road_Accidents_during_2014(rs.getInt("Total_Number_of_Persons_Injured_in_Road_Accidents_during_2014"));
 				
 				return addata;
 			}

 		});

 		return list;
 	}
 */	

}

//////////////////
