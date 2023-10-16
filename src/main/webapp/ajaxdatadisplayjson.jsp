<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.flex {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
}

.flex>div {
	margin: 0 1rem 2rem 1rem;
	text-align: center;
}
</style>
<script>
	$(document).ready(function() {
		var str="";
		$("#display").click(function() {
			$.ajax({
				url : "https://reqres.in/api/users?page=1",
				method : "GET",
				dataType : "json",
				success : function(data) {
					str = "<div class='flex'>";
					for (var i = 0; i < data.data.length; i++) {
						str += " <div> "+"<img src="+data.data[i].avatar+"><p><strong>"+data.data[i].first_name+" "+data.data[i].last_name+"</strong></p>"+"<p>"+data.data[i].email+"</p></div>";
					} 
				}
			});
			$.ajax({
				url : "https://reqres.in/api/users?page=2",
				method : "GET",
				dataType : "json",
				success : function(data) {
					/* str =str+ "<div class='flex'>"; */
					for (var i = 0; i < data.data.length; i++) {
						str += " <div>"+"<img src="+data.data[i].avatar+"> <p><strong>"+data.data[i].first_name+" "+data.data[i].last_name+"</strong></p>"+"<p>"+data.data[i].email+"</p></div>";
					} 
					str = str+ "</div>";
					$("#holder").html(str);
				}
			});
		});
	});
</script>
</head>
<body>
	<h3>display API data using Ajax</h3>
	<button id="display">get data</button>
	<div id="holder"></div>
</body>
</html>