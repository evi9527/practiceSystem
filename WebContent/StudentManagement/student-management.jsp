<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!--  <meta charset="utf-8"> -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Propeller_Admin_Dashboard">
    <meta content="width=device-width, initial-scale=1, user-scalable=no" name="viewport">

    <title>成都大学|信工学院实训实习系统</title>
    <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon1.ico">

    <!-- Google icon -->
    <!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    <!-- Select2 css-->
    <link rel="stylesheet" type="text/css" href="../components/select2/css/select2.min.css" />
    <link rel="stylesheet" type="text/css" href="../components/select2/css/select2-bootstrap.css" />
    <!-- Propeller select2 css-->
    <link rel="stylesheet" type="text/css" href="../components/select2/css/pmd-select2.css" />
    <!-- Propeller css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/propeller.min.css">

    <!-- Propeller theme css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/propeller-theme.css" />

    <!-- Propeller admin theme css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/propeller-admin.css">
    <!--my style css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <!-- Propeller textbox -->
    <link href="http://propeller.in/components/textfield/css/textfield.css" type="text/css" rel="stylesheet" />

    <!-- Propeller table -->
    <link href="http://propeller.in/components/table/css/table.css" type="text/css" rel="stylesheet" />

    <!-- Propeller card -->
    <link href="http://propeller.in/components/card/css/card.css" type="text/css" rel="stylesheet" />

    <!-- Propeller Datatables bootstrap -->
    <link href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" type="text/css" rel="stylesheet" />

    <!-- Propeller Datatables bootstrap responsive  -->
    <link href="https://cdn.datatables.net/responsive/2.1.0/css/responsive.bootstrap.min.css" type="text/css" rel="stylesheet" />

    <!-- Propeller Datatables select -->
    <link href="https://cdn.datatables.net/select/1.2.0/css/select.dataTables.min.css" type="text/css" rel="stylesheet" />
    <!-- Propeller Datatable -->
    <link href="../assets/css/pmd-datatable.css" type="text/css" rel="stylesheet" />
    <!-- Styles Ends -->
</head>

<body>
<%@include file="../PracticeManagement/test.jsp" %>

    <!--content area start-->
    <div id="content" class="pmd-content inner-page">
        <!--tab start-->
        <div class="container-fluid full-width-container value-added-detail-page">
            <div>
                <div class="pull-right table-title-top-action">
                    <div class="pmd-textfield pull-left">
                        <input type="text" id="exampleInputAmount" class="form-control" placeholder="关于...">
                    </div>
                    <a href="javascript:void(0);" class="btn btn-primary pmd-btn-raised add-btn pmd-ripple-effect pull-left">搜索</a>
                </div>
                <!-- Title -->
                <h1 class="section-title" id="services">
                    <span>学生管理</span>
                </h1>
                <!-- End Title -->
                <!--breadcrum start-->
                <ol class="breadcrumb text-left">
                    <li><a href="../Login/index.jsp">主页</a></li>
                    <li class="active">学生管理</li>
                </ol>
                <!--breadcrum end-->
            </div>
            <div class="col-md-12">
                <!-- responsive table example -->
                <div class="pmd-card pmd-z-depth pmd-card-custom-view">
                    <h2 style="text-align: center;">学生管理</h2>
                    <div class="col-md-6 form-inline">
                    	<!--  <form action="QueryStudentServlet" method="post">-->
                        <label class="control-label col-md-2" style="font-size: 20px;font-weight: 600;">条件:</label>
                        <select class="select-simple form-control pmd-select2" id="op" onchange="changeValue()">
                            <option value="all">全部</option>
		                    <option value="sel">已选[1]\未选[2]</option>
		                    <option value="com">企业</option>
		                    <option value="grade">年级</option>
		                    <option value="major">专业</option>
		                    <option value="year">年度</option>
                    	</select>
                        <input type="text" class="form-control" id="conValue"  onchange="changeValue()">
                        <!--  <input type="submit" value="查询">-->
                        <a class="btn pmd-ripple-effect btn-primary" href="#" id="query" >查询</a>
                        <!--  </form>-->
                        <form name="form1" method="post" enctype="multipart/form-data" action="/practiceSystem/StudentManagement/StudentInfoImport" >
						<input type="file" name="file" /> 
						<input type="submit" value="导入">
						</form>
                    </div>
                    <div class="PM-nav">
                        <a class="btn pmd-btn-raised pmd-ripple-effect btn-primary" href="#">导出</a>
<!--                    <button data-target="#form-dialog" data-toggle="modal" class="btn pmd-btn-raised pmd-ripple-effect btn-warning pmd-z-depth" type="button">重置密码</button>
                        <div tabindex="-1" class="modal fade" id="form-dialog" style="display: none;" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header pmd-modal-bordered">
                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                        <h2 class="pmd-card-title-text">重置密码</h2>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal">
                                            <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                                <label for="first-name">旧密码：</label>
                                                <input type="text" class="mat-input form-control" id="name" value="*******">
                                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                                    <label for="first-name">新密码：</label>
                                                    <input type="text" class="mat-input form-control" id="email" value="***">
                                                </div>
                                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                                    <label for="first-name">确认密码：</label>
                                                    <input type="text" class="mat-input form-control" id="email" value="***">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="pmd-modal-action">
                                        <button data-dismiss="modal" class="btn pmd-ripple-effect btn-primary" type="button">确定</button>
                                        <a href="javascript:history.back(-1);" data-dismiss="modal" class="btn pmd-ripple-effect btn-default" type="button">返回</a>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <!-- Responsive table -->
                    <section class="row component-section">
                        <!-- responsive table code and example -->
                      
                        <div class="col-md-12 col-lg-12">
                            <!-- responsive table example -->
                            <div class="pmd-card pmd-z-depth pmd-card-custom-view">
                                <table id="example" class="table pmd-table table-hover table-striped display responsive nowrap" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>学号</th>
                                            <th style="width:100px;">姓名</th>
                                            <th>性别</th>
                                            <th>入学年份</th>
                                            <th>层次</th>
                                            <th>专业名称</th>
                                            <th>班级</th>
                                            <th>研究方向</th>
                                            <th>学习经历</th>
                                            <th>学科背景</th>
                                            <th>邮箱</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${student }" var="stu">
                                        		<tr>
                                        			<td>${stu.no }</td>
                                        			<td>${stu.name }</td>
                                        			<td>${stu.gender }</td>
                                        			<td>${stu.grade }</td>
                                        			<td>${stu.level }</td>
                                        			<td>${stu.professional }</td>
                                        			<td>${stu.class_ }</td>
                                        			<td>${stu.researchDirection }</td>
                                        			<td>${stu.learningExperience }</td>
                                        			<td>${stu.subjectBackground }</td>
                                        			<td>${stu.mailbox }</td>
                                        		</tr>
                                        </c:forEach>
	                                </tbody>
                                </table>
                            </div>
                            <!-- responsive table example end -->

                        </div>
                        <!-- responsive table code and example end-->
                    </section>
                    <!-- Responsive table end -->
                </div>
                <!-- responsive table example end -->

            </div>



        </div>
    </div>

    <!-- Footer Starts -->
    <!--footer start-->
    <footer class="admin-footer">
        <div class="container-fluid">
            <ul class="list-unstyled list-inline">
                <li>
                    <span class="pmd-card-subtitle-text">信息科学与工程学院 &copy; 2017. 版权所有.</span>
                    <h3 class="pmd-card-subtitle-text">技术支持 BY <a href="http://computer.cdu.edu.cn/" target="_blank">信工学院.</a></h3>
                </li>
                <li class="pull-right download-now">
                    <a onClick="downloadPMDadmintemplate()" href="javascript：void(0);">
                        <div>
                            <i class="material-icons media-left pmd-sm">settings</i>
                        </div>
                        <div>
                            <span class="pmd-card-subtitle-text">Version- 1.0.0</span>
                            <h3 class="pmd-card-title-text">By cduyzh</h3>
                        </div>
                    </a>
                </li>
                <li class="pull-right for-support">
                    <a href="mailto:support@propeller.in">
                        <div>
                            <i class="material-icons media-left pmd-sm">email</i>
                        </div>
                        <div>
                            <span class="pmd-card-subtitle-text">For Support</span>
                            <h3 class="pmd-card-title-text">450311265@qq.com</h3>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </footer>
    <!--footer end-->
    <!-- Footer Ends -->

    <!-- Scripts Starts -->
    <script src="../assets/js/jquery-1.12.2.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <!--控制左侧工具栏选择状态-->
    <script>
        $(document).ready(function() {
            var sPath = window.location.pathname;
            var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
            $(".pmd-sidebar-nav").each(function() {
                $(this).find("a[href='../StudentManagement/" + sPage + "']").parents(".dropdown").addClass("open");
                $(this).find("a[href='../StudentManagement/" + sPage + "']").parents(".dropdown").find('.dropdown-menu').css("display", "block");
                $(this).find("a[href='../StudentManagement/" + sPage + "']").parents(".dropdown").find('a.dropdown-toggle').addClass("active");
                $(this).find("a[href='../StudentManagement/" + sPage + "']").addClass("active");
            });
        });
    </script>
    <script type="text/javascript">
        (function() {
            "use strict";
            var toggles = document.querySelectorAll(".c-hamburger");
            for (var i = toggles.length - 1; i >= 0; i--) {
                var toggle = toggles[i];
                toggleHandler(toggle);
            };

            function toggleHandler(toggle) {
                toggle.addEventListener("click", function(e) {
                    e.preventDefault();
                    (this.classList.contains("is-active") === true) ? this.classList.remove("is-active"): this.classList.add("is-active");
                });
            }

        })();
    </script>

    <script src="../assets/js/propeller.min.js"></script>
    <!-- Select2 js-->
    <script type="text/javascript" src="../components/select2/js/select2.full.js"></script>
    <!-- Datatable js -->
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

    <!-- Datatable Bootstrap -->
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>

    <!-- Datatable responsive js-->
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.1.0/js/dataTables.responsive.min.js"></script>

    <!-- Datatable select js-->
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/select/1.2.0/js/dataTables.select.min.js"></script>
    <!-- Propeller Select2 -->
    <script type="text/javascript">
        $(document).ready(function() {

            $(".select-simple").select2({
                theme: "bootstrap",
                minimumResultsForSearch: Infinity,
            });

            $(".select-with-search").select2({
                theme: "bootstrap"
            });

            $(".select-tags").select2({
                tags: false,
                theme: "bootstrap",
            });

            $(".select-add-tags").select2({
                tags: true,
                theme: "bootstrap",
            });
        });
    </script>
    <script type="text/javascript" src="../components/select2/js/pmd-select2.js"></script>
    <script type="text/javascript" src="../assets/js/ajaxfileupload.js"></script>
    <script>
        //Propeller  Customised Javascript code 
        $(document).ready(function() {
            var exampleDatatable = $('#example').DataTable({
                responsive: {
                    details: {
                        type: 'column',
                        target: 'tr'
                    }
                },
                columnDefs: [{
                    className: 'control',
                    orderable: false,
                    targets: 1
                }],
                order: [1, 'asc'],
                bFilter: true,
                bLengthChange: true,
                pagingType: "simple",
                "paging": true,
                "searching": true,
                "language": {
                    "info": " _START_ - _END_ of _TOTAL_ ",
                    "sLengthMenu": "<span class='custom-select-title'>每页显示行数:</span> <span class='custom-select'> _MENU_ </span>",
                    "sSearch": "",
                    "sSearchPlaceholder": "搜索",
                    "paginate": {
                        "sNext": " ",
                        "sPrevious": " "
                    },
                },
                dom: "<'pmd-card-title'<'data-table-title-responsive'><'search-paper pmd-textfield'f>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'pmd-card-footer' <'pmd-datatable-pagination' l i p>>",
            });

            /// Select value
            $('.custom-select-info').hide();

            $("div.data-table-title").html('<h2 class="pmd-card-title-text">Table Card</h2>');
            $("div.data-table-title").html('<h2 class="pmd-card-title-text">Table Responsive</h2>');
            $(".custom-select-action").html('<button class="btn btn-sm pmd-btn-fab pmd-btn-flat pmd-ripple-effect btn-primary" type="button"><i class="material-icons pmd-sm">delete</i></button><button class="btn btn-sm pmd-btn-fab pmd-btn-flat pmd-ripple-effect btn-primary" type="button"><i class="material-icons pmd-sm">more_vert</i></button>');

        });
    </script>
    <script type="text/javascript">
    	var op=null;
    	var conValue=null;
    	var url=null;
    	function changeValue(){
    		op= $("#op").val();
    		conValue=$("#conValue").val();
    		url="QueryStudentServlet?op="+op+"&conValue="+conValue;
    		//alert( url );
    		//alert(value);
    	    document.getElementById("query").setAttribute("href", url);
    	}
    </script>
    <script type="text/javascript">
    	var index="<%=request.getAttribute("index")%>";
    	var reValue="<%=request.getAttribute("conValue")%>";
    	//alert(index);
    	//alert(reValue);
    	if (index!=null){
    		var  objOP=document.getElementById("op");
    		objOP.options[index].selected=true;
    	}else{
    		objOP.options[0].selected=true;
    	}
    	if(reValue!=null){
    		var objValue=document.getElementById("conValue");
    		objValue.value=reValue;
    	}
    </script>
	<script type="text/javascript">
		function upload() {
				//触发 文件选择的click事件 
				$("#file").trigger("click"); 
		}
		//利用ajax的文件上传插件
		function upFile(){ 
			
		/* 	$.ajaxFileUpload({
				url:'/StudentInfoImport?name=11',
				secureuri:'false',
				method:'post',
				fileElementId:'file',
				dataType:'json',
				succdee: function(data,status) {
					alert("success");
				},
				error:function(data,status,e) {
					alert(e);
				}
			}); 
			alert("ok2") */
			alert("ok")
			document.form1.action="/practiceSystem/StudentManagement/StudentInfoImport"
			document.form1.submit();
			} 
	</script>
</body>

</html>