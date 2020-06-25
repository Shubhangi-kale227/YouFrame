<%@page import="java.util.List"%>
<%@page import="com.UploadFile"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/theme/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/theme/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/theme/css/styles.css">
<title>You Frame</title>
</head>
<body>
	<div class="topnav">
		<div class="title text-white">Gallery</div>
	</div>

	<form
		action="<%=request.getContextPath()%>/ajax/ajax.jsp?methodId=uploadFile"
		method="post" enctype="multipart/form-data" id="imgform" name="imgform">
		<div class="d-flex justify-content-center ">

			<input type="file" id="file" name="file" accept="image/*" class="btn-1 mt-4" onchange="onChangeImg()"/> <label
				for="file" /><i class="fa fa-upload" aria-hidden="true"></i> Upload</label>

		</div>
		<!-- 		<div class="d-flex justify-content-center "> -->
		<!-- 			<button class="btn btn-light top-space" type="submit"> -->
		<!-- 				<i class="fa fa-upload" aria-hidden="true"></i> Upload -->
		<!-- 			</button> -->
		<!-- 		</div> -->
	</form>



	<div class="container">
		<div class="row">
			<%
				File folder = new File(UploadFile.IMAGE_DIR);
					List<File> files = Arrays.asList(folder.listFiles());

					for (int i = 0; i < 3; i++) {
			%>
			<div class="col-sm-4" id="imgDiv<%=i + 1%>">
				<img class="img-thumbnail" 
					src="<%=request.getContextPath()%>/ajax/ajax.jsp?methodId=showImage&idd=<%=String.valueOf(i)%>" alt=" " >
			</div>
			<%
				}
			%>
		</div>
		<div id="result">
			<h3>${requestScope["message"]}</h3>
		</div>
	</div>


	<script type="text/javascript">
		function onChangeImg(){
			//alert("changed!");
			document.getElementById("imgform").submit();
		}
	</script>
	<div class="footernav">
		<div class="title text-white">&copy; You Frame</div>
	</div>
	<script src="../theme/js/jquery-1.12.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/theme/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/theme/js/bootstrap.min.js"></script>
</body>
</html>