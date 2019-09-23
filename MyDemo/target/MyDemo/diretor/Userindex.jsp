<%@ page language="java" pageEncoding="UTF-8" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>The Eracle Website Template | Home </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="<%=basePath%>diretor/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>diretor/css/magnific-popup.css">
<script type="text/javascript" src="<%=basePath%>diretor/js/jquery.min.js"></script>
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="<%=basePath%>diretor/css/jquery.mmenu.all.css" />
		<script type="text/javascript" src="<%=basePath%>diretor/js/jquery.mmenu.js"></script>
			<script type="text/javascript">
				//	The menu on the left
				$(function() {
					$('nav#menu-left').mmenu();
				});
		</script>
		<!-----//768px-menu----->
</head>
<body>
<!-- start header -->
<div class="header_bg">
<div class="wrap">
	<div class="header">
    <div class="logo">
			<a href="index.html">
				
				<h1>欢迎您</h1>
				<div class="clear"> </div>
	    </a>
	  </div>
		<div class="text">
		  <p>Lorem Ipsum is simply dummy text of the printing</p>
		</div>
		<div class="clear"> </div>
	</div>
</div>
</div>
<!-- start header -->
<div class="header_btm">
	<div class="wrap">
		<!------start-768px-menu---->
			<div id="page">
					<div id="header">
						<a class="navicon" href="#menu-left"> </a>
					</div>
					<nav id="menu-left">
						<ul>
							<li class="active"><a href="<%=basePath%>adminlist/umain.action" target="main">园区审批</a></li>
							<li><a href="#" target="main">教师管理</a></li>
							<li><a href="#" target="main">教师考勤</a></li>
							<li><a href="#" target="main">幼儿管理</a></li>
							<li><a href="#" target="main">家长管理</a></li>
							<li><a href="#" target="main">班级管理</a></li>
							<li><a href="#" target="main">消息通知</a></li>
							<li><a href="#" target="main">校园公告</a></li>
						</ul>
					</nav>
			</div>
		<!------start-768px-menu---->
			<div class="header_sub">
				<div class="h_menu">
					<ul>
							<ul>
								<li class="active"><a href="<%=basePath%>adminlist/umain.action" target="main">园区审批</a></li>
								<li><a href="#" target="main">教师管理</a></li>
								<li><a href="#" target="main">教师考勤</a></li>
								<li><a href="#" target="main">幼儿管理</a></li>
								<li><a href="#" target="main">家长管理</a></li>
								<li><a href="#" target="main">班级管理</a></li>
								<li><a href="#" target="main">消息通知</a></li>
								<li><a href="#" target="main">校园公告</a></li>
						</ul>
				  </ul>
				</div>
				<div class="h_search">
		    		<form>
		    			<input type="text" value="" placeholder="search something...">
		    			<input type="submit" value="">
		    		</form>
				</div>
				<div class="clear"> </div>
			</div>
	</div>
</div>
		<!-----end-header-------->
		<!----start-content--->
			<div class="content_1">
				<div class="wrap">
					<div class="about">
				<div class="about-top">
				  <div class="clear"> </div>
			</div>
			<div class="about-bottom" style="width:100%;
	height:600px;" >
	          
	          <iframe src="<%=basePath%>adminlist/umain.action" height="100%" width="100%"
              name="main" frameborder="no" border="0">

              </iframe>
	          
             <!-- ______________________________________________-->
					</div>
			  </div>
		</div>
		</div>
				</div>
			<div class="copy">
	          <p>© 2014 Template. More Templates</p>
			  </div>
</body>
</html>