<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	
    <head>
        <title>Accident db</title>
    </head>
    
    <body>
    	<h2>How to fetch data from database in Spring MVC</h2>
    	<div class="container">
			<table class="table table-striped">
				<caption>accidents are:-></caption>
				<thead>
					<tr>
						<th>States</th>
						<th>No. of Accidents</th>
					</tr>
				</thead>
				<tbody>
					<!-- JSTL For Loop -->
					<c:forEach items="${accident}" var="addata">
						<tr>
							<td>${addata.States_UTs}</td>
							<td>${addata.Total_Number_of_Persons_Injured_in_Road_Accidents_during_2014}</td>
						</tr>
					</c:forEach>
	
				</tbody>
			</table>
			
			<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
			<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		</div>
    </body>
</html>