<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>登陆</title>
<head>
		<meta charset="utf-8">
		<title>登录界面</title>
		<style type="text/css">
			body{
				background:#b2e9fd;
				margin:0px;                                  /*外边距*/
				width:1360px;
				height:620px;
			}
			/*主体样式*/
			
			.div{
				padding-top:100px;                        /*内上边距*/
				padding-left:405px;                        /*内左边距*/
				width:560px;
				height:70px; 
				font-family:SimHei;                         /*字体类型：黑体*/
				font-size:50px;                               /*字体大小*/
				/*font-weight:bold;*/                      /*字体加粗*/
				/*font-style:oblique;*/                    /*字体倾斜*/ 
				text-align:center;                           /*文本横向排列：居中*/
				letter-spacing:10px;                      /*字符间距*/
			}
			/*标题样式*/
			
			.login{
				padding-left:405px;
				width:560px;
				height:50px;
				font-family:KaiTi;                           /*字体类型：正楷*/
				font-size:35px;
				text-align:center;                          
				letter-spacing:10px;                      
			}
			/*登录样式*/
			
			.box{
				width:350px;
				height:230px;
				margin:0 auto;                             /*外边距自动调整*/
				position:absolute;                       /*根据父元素进行定位*/
				text-align: center;
				top:60%;                                      /*定位：与顶部距离占页面高60%*/
				left:50%;                                      /*定位：与左边缘距离占页面宽50%*/
				transform: translate(-50%, -50%);                 /*块移动*/
				background-color:#9CC1D9;
			}
			/*登录块样式*/
			
			.box>.sp{
				height:10%;
				margin:0 auto;
			}
			/*登录块内换行样式*/
			
			.centered {
				display: inline-block;                     /*将对象呈递为内联对象，但是对象内容作为块对象呈递*/
				vertical-align: middle;                   /*垂直方向居中*/
				width: auto;
			}
			/*登录块的内联块样式*/
		</style>
		
		<script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
			  $("#sender").click(function(){
				  	$("#null").hide();
				  	$("#wrong").hide();
				  	
				  	var username=document.getElementById('username').value; 
			        var password=document.getElementById('password').value; 
			        var category={"UserAccount":username,"UserPassword":password}; 
			        var jsonData = JSON.stringify(category);
			        var page="/SchoolShop/loginCheck";
			        if(username==''||password==''){
			        	$("#null").show();
			        	return;
			        }
			        	
			        $.ajax({
			               type:"post",
			               url: page,
			               data:jsonData,
			               dataType:"json",
			               contentType : "application/json;charset=UTF-8",
			               success: function(result){
			            	 if(result.result!='true'){
			            		 $("#wrong").show();
			            	 }else{
			            		 window.location.href = "/SchoolShop/pages/1.html"
			            	 }
			               }
			            });
			          // alert("提交成功，请在Tomcat控制台查看服务端接收到的数据");
			  });
			});
		</script>
				
		
</head>
<body>
			<div class="div"><font color="white">校园电子商务</font></div>
			<div class="box" style="height:300px;">
					<div class="sp"></div>
					<div class="sp"></div>
					<input id="username" value="请输入账号" type="text" name="账号"  size="22" maxlength="12"/>
					<br/><br/>
				    <input id="password" value="请输入密码" type="password" name="密码"  size="22" maxlength="16"/>
					<br/><br/>
					<input id="sender" type="submit" value="登录" style="width:40%; float:left;"/>
					<input type="reset" value="重置" style="width:40%; float:right;"/>
					<br/><br/>
						<font id="wrong" color="red" hidden="true" size="2">账号或密码错误</font>
						<font id="null" color="red" hidden="true" size="2">账号密码不能为空</font>
					<br/><br/>
					<input type="checkbox"/>记住密码	
					<a href="/SchoolShop/regist">注册账号</a>	
					<!-- <form name="login" method="post" action="" class="centered">
							
					</form> -->
			</div>
			
</body>
</html>