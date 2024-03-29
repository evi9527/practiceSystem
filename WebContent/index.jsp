<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Petpooja_App_Marketplace">
    <meta content="width=device-width, initial-scale=1, user-scalable=no" name="viewport">
    <title>成都大学|信工学院实训实习系统</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon1.ico">
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <!--font-awesome css-->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />
    <!-- Propeller css -->
    <link rel="stylesheet" type="text/css" href="assets/css/propeller.min.css">
    <!--my style css-->
    <link rel="stylesheet" type="text/css" href="assets/css/front-style.css">
    <!--head css-->
    <link href="assets/css/animate.css" rel="stylesheet">
    <link href="assets/css/bootsnav.css" rel="stylesheet">
    <link href="assets/css/overwrite.css" rel="stylesheet">
    <link href="assets/css/head-style.css" rel="stylesheet">
    <link href="assets/css/color.css" rel="stylesheet">
    <!-- Styles Ends -->
</head>


<body>
    <!--顶部-->
    <header>
        <!-- Start Navigation -->
        <nav class="navbar navbar-default navbar-fixed white no-background bootsnav">

            <!-- Start Top Search -->
            <div class="top-search">
                <div class="container">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                    </div>
                </div>
            </div>
            <!-- End Top Search -->

            <div class="container">
                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->

                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="#brand">
                        <img src="assets/images/brand/logo-white.png" class="logo logo-display" alt="">
                        <img src="assets/images/brand/logo-black.png" class="logo logo-scrolled" alt="">
                    </a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                        <li><a class="hvr-rectangle-out pmd-ripple-effect" href="index.jsp">主页</a></li>
                        <li><a class="hvr-rectangle-out pmd-ripple-effect" href="javascript:;">关于我们</a></li>
                        <li><a class="hvr-rectangle-out pmd-ripple-effect" href="javascript:;">学院通知</a></li>
                        <li><a class="hvr-rectangle-out pmd-ripple-effect" href="javascript:;">企业公告</a></li>
                        <li><a class="hvr-rectangle-out pmd-ripple-effect" href="javascript:;">企业信息</a></li>
                        <li><a class="hvr-rectangle-out pmd-ripple-effect" href="javascript:;">资料下载</a></li>
                        <li>
                            <!--<a style="padding-left: 26px;" href="Login/login.html" class="hvr-icon-forward pmd-ripple-effect">登录|注册</a>-->
                            <a class="hvr-rectangle-out pmd-ripple-effect" href="Login/login.jsp"><i  style="padding-right: 14px;" class="fa fa-hand-o-right"></i>登录|注册</a>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>

        </nav>
        <!-- End Navigation -->

        <div class="clearfix"></div>

        <!-- Start Home -->
        <div class="pageheader fixed-demo dark">
            <div class="container">
                <h2 style="font-size: 30px;" class="title">信息科学与工程学院|实训系统</h2>
                <p>Institute of information science and technology|Practice System</p>
            </div>
        </div>
        <!-- End Home -->
        <div class="clearfix"></div>

    </header>
    <!--轮播图-->
    <!--assets/images/propeller-bg.jpg-->

    <section class="slider-show">
        <div class="container">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="assets/images/slider3.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="assets/images/slider2.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="assets/images/slider3.jpg" alt="">
                    </div>

                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

    </section>
    <c:if test="${sessionScope.info == null}">
	<c:redirect url="/ShowIndexNoticeListServlet"></c:redirect>
	</c:if>
    <!--内容区-->
    <section class="index-news">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="col-links-wrapper">
                        <div class="tit">
                            <span class="more">                                  
                            <a href="MoreIndexNoticesListServlet?tole=1" class="hvr-icon-wobble-horizontal">更多</a>                                       
                            </span>
                            <div class="hd ">
                                <i class="material-icons media-left media-middle">school</i>
                                <span><a href="MoreIndexNoticesListServlet?tole=1 ">学院通知公告</a></span>
                            </div>
                            <div class="line "></div>
                        </div>
                        <div>
                            <ul class="list-unstyled ">
                                <c:forEach items="${adminyNotices }" var="list2">
                                	<li><a href="NoticeInfoService?type=1&id=${list2.id }">${list2.title }</a>
                                	<span class="pull-right">${list2.releaseDate }</span>
                                	</li>
                                </c:forEach>
                            </ul>

                        </div>

                    </div>

                </div>
                <div class="col-md-6">
                    <div class="col-links-wrapper">
                        <div class="tit">
                            <span class="more">                                  
                            <a href="MoreIndexNoticesListServlet?tole=2" class="hvr-icon-wobble-horizontal">更多</a>                                     
                            </span>
                            <div class="hd ">
                                <i class="material-icons media-left">notifications</i>
                                <span><a href="MoreIndexNoticesListServlet?tole=2">企业通知公告</a></span>
                            </div>
                            <div class="line "></div>
                        </div>
                        <div>
                            <ul class="list-unstyled ">
                                <c:forEach items="${companyNotices }" var="list">
                                	<li><a href="NoticeInfoService?type=2&id=${list.id }">${list.title }</a>
                                	<span class="pull-right">${list.releaseDate }</span>
                                	</li>
                                </c:forEach>
                            </ul>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--底部-->
    <footer class="page-footer teal">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-xs-12 fot-left">
                    <h5 class="white-text">成都大学|信息科学与工程学院实训系统</h5>
                    <p class="grey-text text-lighten-4">成都大学信息科学与技术学院始建于1978年，由成都大学创办之时的无线电系（自动化系）基础上发展而来，是校级重点理工科院系之一。现设有5个本、专科专业，全日制在校生1600余人。 全院现有教职员工54人，教授5人、副教授21人，博士9人、硕士24人，双师型教师16人，另有兼职教授10余人等。
                    </p>


                </div>
                <div class="col-md-2  col-md-offset-1 col-xs-12 fot-center">
                    <h5 class="white-text">友情链接</h5>
                    <ul>
                        <li><a target="_blank" class="white-text" href="http://www.cdu.edu.cn/">成都学院（成都大学）首页</a></li>
                        <li><a target="_blank" class="white-text" href="http://jw.cdu.edu.cn/">成都大学教务处信息系统</a></li>
                        <li><a target="_blank" class="white-text" href="http://computer.cdu.edu.cn">信息科学与工程学院</a></li>
                        <li><a target="_blank" class="white-text" href="Login/login.jsp">后台管理</a></li>
                    </ul>
                </div>
                <div class="col-md-2 fot-right col-md-offset-1 col-xs-12">
                    <h5 class="white-text">联系方式</h5>
                    <ul>
                        <address style="color: #f5f5f5;">
                        <strong>地址</strong><br>
                        四川省成都市龙泉驿区十陵镇成都大学<br>
                        ©信息科学与工程学院<br>
                        邮编:610100
                        </address>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                Power by <i class="material-icons  pmd-xs">favorite</i> <a class="brown-text text-lighten-3" href="http://computer.cdu.edu.cn/">  信息科学与工程学院同创工作室</a> © 2017
            </div>
        </div>
    </footer>

    <!-- Scripts Starts -->
    <script src="assets/js/jquery-1.12.2.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/propeller.min.js"></script>
    <script src="assets/js/bootsnav.js"></script>

    <!-- Scripts Ends -->

</body>

</html>