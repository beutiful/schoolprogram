<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <head>
		<title>注册</title>
		<meta charset="utf-8">
		<style>
			body{
				background:#0193de;
				margin:0px;                                  /*外边距*/
				width:1360px;
				height:620px;
			}
			/*主体样式*/
			
			.div{
				padding-top:80px;                        /*内上边距*/
				padding-left:410px;                        /*内左边距*/
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
			
			.register{
				padding-left:405px;
				padding-top:20px;
				width:560px;
				height:100px;
				font-family:KaiTi;                           /*字体类型：正楷*/
				font-size:35px;
				text-align:center;                          
				letter-spacing:10px;                      
			}
			/*注册块样式*/
			
			.box{
				width:800px;
				height:650px;
				margin:0 auto;                             /*外边距自动调整*/
				position:absolute;                       /*根据父元素进行定位*/
				text-align: center;
				top:60%;                                      /*定位：与顶部距离占页面高62%*/
				left:45%;                                      /*定位：与左边缘距离占页面宽50%*/
				transform: translate(-50%, -50%);                 /*块移动*/
				background:white;
			}
			/*登录块样式*/
			
			.box>.sp{
				height:10%;
				margin:0 auto;
			}
			/*登录块内换行样式*/
			
			.box span{
				width:120px;
				height:35px;
				font-family:FangSong;
				font-size:20px;
				color:#282339;
				float:left;
			}
			/*除输入框外的其他内联块*/
			
			.centered {
				display: inline-block;                     /*将对象呈递为内联对象，但是对象内容作为块对象呈递*/
				vertical-align: middle;                   /*垂直方向居中*/
				width: auto;
			}
			/*注册块的内联块样式*/
		</style>
		
		
  <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
  <script>
	  $(document).ready(function(){
		  $("#UserAccount").keyup(function(){
			  $("#usernamesentence").remove();
			  
		      var useraccount = document.getElementById('UserAccount').value; 
		      var category={"UserAccount":useraccount}; 
		      var jsonData = JSON.stringify(category);
		      var page = "/SchoolShop/registCheckUserName";
		      
		      $.ajax({
	               type:"post",
	               url: page,
	               data:jsonData,
	               dataType:"json",
	               contentType : "application/json;charset=UTF-8",
	               success: function(result){
	            	 if(result.result=='true'){
	            		 $("#UserAccountDiv").after("<div id='usernamesentence' style='float:right;'><font size='3' color='red'>账号已存在,请重新输入</font></div>");
	            	 }
	               }
	            });  
		  });
		  
		  $("#UserPassword").keyup(function(){
			  //alert("up");
			  $("#passwordsentence1").remove(); 
			  $("#passwordsentence2").remove(); 
		      var FirstPassword = document.getElementById('UserPassword').value;
		      var SecondPassword = document.getElementById('EnsurePassword').value;
		      if(FirstPassword!=SecondPassword){
		     	 $("#UserPasswordDiv").after("<div id='passwordsentence1'><font size='3' color='red'>两次密码输入不一致,请重新输入</font></div>");
         		 $("#EnsurePasswordDiv").after("<div id='passwordsentence2'><font size='3' color='red'>两次密码输入不一致,请重新输入</font></div>");
		      }
		  });
		  
		  $("#EnsurePassword").keyup(function(){
			  //alert("up");
			  $("#passwordsentence1").remove(); 
			  $("#passwordsentence2").remove(); 
		      var FirstPassword = document.getElementById('UserPassword').value;
		      var SecondPassword = document.getElementById('EnsurePassword').value;
		      if(FirstPassword!=SecondPassword){
		     	 $("#UserPasswordDiv").after("<div id='passwordsentence1'><font size='3' color='red'>两次密码输入不一致,请重新输入</font></div>");
         		 $("#EnsurePasswordDiv").after("<div id='passwordsentence2'><font size='3' color='red'>两次密码输入不一致,请重新输入</font></div>");
		      }
		  });
	    
	  	  $("#button").hover(function(){
	  			var list = document.getElementsByClassName("input_");
	  			var i;
	  			for(i=0;i<list.length;i++){
	  				var obj = $(list[i]);
	  				if(obj.attr("isempty")=="true"){
	  					$(this).attr("disabled",true); 
	  					$(this).css("background","#b7cfd7");
	  					break;
	  				}
	  			}
	  			
		  });
	  	  
	  	   $("input").keyup(function(){
	  		   var id = $(this).attr("id");
	  		   var text =  $(this).val();
	  		   if(text!=""){
	  			   $(this).attr("isempty","false");
	  			   $("#button").removeAttr("disabled");
	  			   $("#button").css("background","#ffac38");
	  		   }else{
	  			   $(this).attr("isempty","true");
	  		   }
		  });
	  	  
	  	 
	  
	});
  </script>
</head>

<body>
<div class="register"><font color="black">注册界面</font></div>
<div class="div"><font color="black">校园电子商务</font></div>
<br/>
			<div class="box">
					<br/>
					<form name="register" method="post"  class="centered" action="registUser">
							<br/>
							<br/>
							<div id="userMemberShipDiv">
								<span>设置会员名：</span>
								<input class="input_" isempty="true" isture="true" id="UserMemberShip" type="text" name="UserMemberShip" style="height:33px;" size="30" maxlength="12"/>
							</div>
							<br/>
							<div id="UserNameDiv">
								<span>真实姓名：</span>
								<input class="input_" isempty="true" isture="true" id="UserName" type="text" name="UserName" style="height:33px;" size="30" maxlength="12"/>
							</div>
							<br/>
							<div id="UserAccountDiv">
								<span>设置账号：</span>
								<input class="input_" isempty="true" isture="true" id="UserAccount" type="text" name="UserAccount" style="height:33px;" size="30" maxlength="12"/>
							</div>
							<br/>
							<div id="UserPasswordDiv">
								<span>设置密码：</span>
								<input class="input_" isempty="true" isture="true" id="UserPassword" type="password" name="UserPassword"  style="height:33px;" size="30" maxlength="16"/>
							</div>
							<br/>
							<div id="EnsurePasswordDiv">
								<span>确认密码：</span>
								<input class="input_" isempty="true" isture="true" id="EnsurePassword" type="password" name="密码"  style="height:33px;" size="30" maxlength="16"/>
							</div>
							<br/>
							<div id="UserTELDiv">
								<span>手机号码：</span>
								<input class="input_" isempty="true" isture="true" id="UserTEL" type="text" name="UserTEL" style="height:33px;" size="30" maxlength="12"/>
							</div>
							<br/>
							<div id="UserAddressDiv">
								<span>用户地址：</span>
								<input class="input_" isempty="true" isture="true" id="UserAddress" type="text" name="UserAddress" style="height:33px;" size="30" maxlength="12"/>
							</div>
							<br/>
							<div id="UserSexDiv">
								<span>性别：</span>
								<input class="input_" isempty="true" isture="true" id="UserSex" type="text" name="UserSex" style="height:33px;" size="30" maxlength="12"/>
							</div>
							<br/>
							<div id="UserAgeDiv">
								<span>年龄：</span>
								<input class="input_" isempty="true" isture="true" id="UserAge" type="text" name="UserAge" style="height:33px;" size="30" maxlength="12"/>
							</div>
							<br/>
							<button id="button"  style="float:center; width:130px; height:45px; color:white; background:#ffac38; border:none; cursor: pointer;">注册</button>
							
					</form>
					
			</div>
</body>
</html>