<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
 <%
	String driver = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/accidents?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	String userid = "root";
	String password = "";
	try {
	Class.forName(driver);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	Connection con = DriverManager.getConnection(connectionUrl, userid, password);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select UTs_in_Total_Number_of_Persons_Injured_in_Road_Accidents_2014 from accidents order by UTs_in_Total_Number_of_Persons_Injured_in_Road_Accidents_2014 DESC");
	ArrayList<String> ar1 = new ArrayList<String>();
	ArrayList<Integer> ar = new ArrayList<Integer>();
	while(rs.next()) {
		int n = rs.getInt(1);
		ar.add(n);
		%><h4></h4><%
	} 
	ResultSet rs1 = stmt.executeQuery("select States_UTs from accidents");
	while(rs1.next()){
		String str = rs1.getString(1);
		ar1.add(str);
		%><h4></h4><%
	}
	
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
for(int i=1; i<ar.size(); i++){ 
	map = new HashMap<Object,Object>(); map.put("label", ar1.get(i)); map.put("y", ar.get(i)); list.add(map);
}

String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "dark1", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Total Number of Persons Injured in Road Accidents 2014"
	},
	data: [{
		type: "line",
		toolTipContent: "<b>{label}</b>: {y}",
		indexLabelFontSize: 16,
		//indexLabel: "{label} - {y}",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>