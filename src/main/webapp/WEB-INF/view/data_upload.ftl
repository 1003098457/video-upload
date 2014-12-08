<!DOCTYPE html>
<html class="info_upload_page">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title></title>

<script type="text/javascript" src="jquery/jquery-2.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("a.drop_btn").click(function() {

			$("ul").toggle("slow");

		});

	});
</script>

</head>
<body>
	<div class="head_container_out">
		<div class="head_container">
			<div class="left">
				<a href="/" class="back">返回</a>
			</div>
			<div class="middle">
				<h2>资料上传</h2>
			</div>
			<div class="right">
				<div class="drop">
					<a class="drop_btn"></a>
					<ul style="display: none;">
						<li><a href="/">活动介绍</a></li>
						<li><a href="/">活动流程</a></li>
						<li><a href="/">活动奖项</a></li>
						<li><a href="/">我要参加</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="page_box">
		<div class="user_head">
			<div class="upload">
				<input type="file" />
				<p>
					点击<br />上传
				</p>
			</div>
			<img
				src="http://99touxiang.com/public/upload/nvsheng/33/16-083608_342.jpg" />
		</div>
		<div class="info_box">
			<input type="text" placeholder="姓名" /> 
			<!-- <input type="text"placeholder="联系电话" />  -->
			<input type="text" placeholder="邮箱" /> 
			<input type="text" placeholder="学校" />
			<div class="btn_box clearfix">
				<button class="login">登录</button>
				<button class="reg">注册</button>
			</div>
		</div>
	</div>

</body>
</html>
