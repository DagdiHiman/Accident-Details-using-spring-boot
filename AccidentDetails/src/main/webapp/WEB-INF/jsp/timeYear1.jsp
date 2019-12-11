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
	ResultSet rs = stmt.executeQuery("SELECT Years, Total_Number_of_Road_Accidents_in_numbers FROM road_accidents_2017_annexure_tables_1 order by Years ASC");
	ArrayList<Integer> x = new ArrayList<Integer>();
	ArrayList<Integer> y = new ArrayList<Integer>();
	while(rs.next()) {
		x.add(rs.getInt(1));
		y.add(rs.getInt(2));
	}
	
// Gson object to plot CanjasJS files

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
for(int i=1; i < y.size(); i++){ 
	map = new HashMap<Object,Object>(); map.put("label", x.get(i)); map.put("y", y.get(i)); list.add(map);
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
		text: "Total Number of People Involved in accidents Year-wise"
	},
	data: [{
		type: "area",
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
