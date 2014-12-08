<!DOCTYPE html>
<html class="index_page">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>2014中原地产全国高校创意技能大赛</title>
<script type="text/javascript" src="jquery/jquery-2.1.1.js"></script>
<script type="text/javascript">
	var jq=jQuery.noConflict();
	jq(document).ready(function() {

		jq("button#reg").click(function(){
			jq("div#login").hide("slow",function(){
				jq("div#reg").show("slow");
			})
		});
		
		jq("button#cancel").click(function(){
			jq("div#reg").hide("slow");
		});
	});
	
	function tologin(){
		<#if (userid)??>
			alert("您已经登录，快点击KO?GO!参加比赛吧！");
		<#else>
			jq("div#login").show("solw");
		</#if>
	}
	
	function login(){
		var phone = jq("#log_phone").val();
		phone = jq.trim(phone);
		var pwd = jq("#log_pwd").val();
		var reg = /^\d{11}$/;
		
		
		if(pwd!=""&&reg.test(phone)){
			jq.ajax({
				type:"post",
				url:"user/login",
				data:"phone="+phone+"&password="+pwd,
				success:function(rep){
					if(rep==true){
						jq("#log_info").html("登陆成功！");
						setTimeout(function(){
							jq("div#login").hide("solw");
							jq("#a_login").attr("onClick","alert('您已经登录，快点击KO?GO!参加比赛吧！');");
						},2000);
					}else{
						jq("#log_info").html("用户名或密码错误！");
						jq("#log_pwd").val("");
					} 
				}});
		} else{
		
			jq("#log_info").html("请输入正确格式的手机号和密码！");
		} 
	}
	
	function regist(){
		var phone = jq("#reg_phone").val();
		phone = jq.trim(phone);
		var pwd = jq("#reg_pwd").val();
		var pwdEnsure = jq("#reg_pwdEnsure").val();
		var reg = /^\d{11}$/;
		
		if(pwd!=pwdEnsure){
			jq("#reg_info").html("您输入的密码和密码确认不一致！");	
		}else{
			if(reg.test(phone)&&pwd!=""){
				jq.ajax({
					type:"post",
					url:"user/regist",
					data:"phone="+phone+"&password="+pwd,
					success:function(rep){
						if(rep==true){
							jq("#reg_info").html("恭喜您注册成功，已经自动登录！");
							setTimeout(function(){
								jq("div#reg").hide("solw");
								jq("#a_login").attr("onClick","alert('您已经登录，快点击KO?GO!参加比赛吧！');");
							},2000);	
						}else{
							jq("#reg_info").html("对不起，注册失败！您的电话已经被注册！");	
						}
					}
				});
			}else{
				jq("#reg_info").html("请输入正确格式的手机号和密码！");	
			}
		}
	}
	
</script>
</head>
<body>
	<div class="container">
		<img src="images/logo.png" class="logo" />
		<div class="link">
			<ul>
				<li><a href="/"><img src="images/link_1.png" /></a></li>
				<li><a href="/"><img src="images/link_2.png" /></a></li>
				<li><a id="a_login" href="#" onClick="tologin();"><img
						src="images/link_3.png" /></a></li>
				<li><a href="user/isfinish"><img src="images/link_4.png" /></a></li>
			</ul>
		</div>
	</div>
	<div class="pop_box" id="login" style="display: none;">
		<div class="bg"></div>
		<div class="in">
			<h3 style="font-size: 20">用户登录</h3>
			<h3 style="font-size: 30; color: red;" id="log_info"></h3>
			<div class="box">
				<input type="text" placeholder="电话" id="log_phone" /> <input
					type="password" placeholder="密码" id="log_pwd" />
				<div class="btn_box">
					<button class="login" id="login" onclick="login();">登录</button>
					<button class="reg" id="reg">注册</button>
				</div>
			</div>
		</div>
	</div>

	<div class="pop_box" id="reg" style="display:none;">
		<div class="bg"></div>
		<div class="in">
			<h3 style="font-size: 20">用户注册</h3>
			<h3 style="font-size: 30; color: red;" id="reg_info"></h3>
			<div class="box">
				<input type="text" placeholder="电话" id="reg_phone" /> 
				<input type="password" placeholder="密码" id="reg_pwd"/> 
				<input type="password" placeholder="密码确认" id="reg_pwdEnsure"/>
				<div class="btn_box">
					<button class="login" id="ensureReg" onClick="regist();">注册</button>
					<button class="reg" id="cancel">取消</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
