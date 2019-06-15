<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Petpooja_App_Marketplace">
<meta content="width=device-width, initial-scale=1, user-scalable=no"
	name="viewport">
<title>成都大学|信工学院实训实习系统</title>
<link rel="shortcut icon" type="image/x-icon"
	href="./assets/images/favicon1.ico">

<!-- Google icon -->
<!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->

<!-- Bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/bootstrap.min.css">
<!-- Propeller css -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/propeller.min.css">

<!-- Propeller theme css-->
<link rel="stylesheet" type="text/css"
	href="./assets/css/propeller-theme.css" />

<!-- Propeller admin theme css-->
<link rel="stylesheet" type="text/css"
	href="./assets/css/propeller-admin.css">
<!-- Styles Ends -->
</head>


<body class="body-custom body-404page">
	<div class="errorpage">
		<div class="wrapper">
			<div class="container">
				<header class="header-primary">
					<a href="index.html" rel="home"><img
						src="assets/images/cdu-logo.png" alt="logo" class="logo"
						style="width: 110px;"></a>
				</header>
				<!-- header-primary -->

				<div class="content-primary">
					<h1 class="title">您的输入有误或系统出现未知问题</h1>
					<p class="description">
						请检查您的输入、重试或 联系开发人员<br>
						以下是详细错误信息：<br>
						<div style="color: red;">${ErrorMessage }</div>
					</p>
					<div class="section-footer">
						<a href="javascript:history.back(-1);" class="btn btn-primary">返回上一页</a> <a
							href="index.jsp" class="btn btn-primary">返回首页</a> <a
							href="450311265@qq.com" class="btn btn-secondary">报告错误</a>
					</div>
				</div>
				<!-- content-primary -->
			</div>
			<!-- container -->
		</div>
	</div>

	<!-- Scripts Starts -->
	<script src="./assets/js/jquery-1.12.2.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/j8s/propeller.min.js"></script>
	<script>
		$(document).ready(
				function() {
					var sPath = window.location.pathname;
					var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
					$(".pmd-sidebar-nav").each(
							function() {
								$(this).find("a[href='" + sPage + "']")
										.parents(".dropdown").addClass("open");
								$(this).find("a[href='" + sPage + "']")
										.parents(".dropdown").find(
												'.dropdown-menu').css(
												"display", "block");
								$(this).find("a[href='" + sPage + "']")
										.parents(".dropdown").find(
												'a.dropdown-toggle').addClass(
												"active");
								$(this).find("a[href='" + sPage + "']")
										.addClass("active");
							});
				});
	</script>

	<!-- Scripts Ends -->

</body>

</html>