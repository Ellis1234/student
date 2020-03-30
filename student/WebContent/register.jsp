<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="/student/css/style1.css" type="text/css" />
<script type="text/javascript">
<!--
 function checkData(){
      var userid = window.form1.name.value;
	  var passwd = window.form1.pwd.value;
	  var repasswd = window.form1.repwd.value;
	  if(userid==""){
	     window.alert("用户ID不能为空");
		 window.form1.userId.focus(); return false;
	  } 
	  if(passwd==""){
	     window.alert("用户密码不能为空");
		 window.form1.passwd.focus(); return false;
	  }
	  if(passwd!=repasswd){
	     window.alert("两次输入密码不一致");
		 return false;
	  }  
	  return true;
 }
-->
</script>
</head>
<body>
<img src="/student/images/logo.jpg" align="middle" width="150" height="150"/>
<div class="htmleaf-container">
    <div id="wrapper" class="login-page">
      <div id="login_form" class="form">
		<s:form method="post" action="Register1" name="form1" theme="simple">
		 <td align="left">  
  		<s:fielderror/><s:property value="errormsg"/>
		<!-- 输出错误信息和数据校验提示 -->
  		</td>
		<label>用户名:<input type="text" name="username" id="name"></label>
		<br/><br/>
		<label>密码:<input type="password" name="password" id="pwd"></label>
		<br/><br/>
		<label>确认密码:<input type="password" name="repwd" id="repwd"></label>
		<label>用户类型:<s:select name="role" list="#{'1':'学生',
    		'2':'系部管理人员'}"></s:select></label>
		<button type="submit" name="submit" onMouseDown="checkData()">注册</button>
		<s:hidden name="action" value="register"/>
		<p class="message">已经有了一个账户? <a href="Login.action">立刻登录</a></p>
		</s:form>
	   </div>
    </div>
</div>
</body>
</html>