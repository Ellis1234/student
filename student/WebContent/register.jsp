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
	     window.alert("�û�ID����Ϊ��");
		 window.form1.userId.focus(); return false;
	  } 
	  if(passwd==""){
	     window.alert("�û����벻��Ϊ��");
		 window.form1.passwd.focus(); return false;
	  }
	  if(passwd!=repasswd){
	     window.alert("�����������벻һ��");
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
		<!-- ���������Ϣ������У����ʾ -->
  		</td>
		<label>�û���:<input type="text" name="username" id="name"></label>
		<br/><br/>
		<label>����:<input type="password" name="password" id="pwd"></label>
		<br/><br/>
		<label>ȷ������:<input type="password" name="repwd" id="repwd"></label>
		<label>�û�����:<s:select name="role" list="#{'1':'ѧ��',
    		'2':'ϵ��������Ա'}"></s:select></label>
		<button type="submit" name="submit" onMouseDown="checkData()">ע��</button>
		<s:hidden name="action" value="register"/>
		<p class="message">�Ѿ�����һ���˻�? <a href="Login.action">���̵�¼</a></p>
		</s:form>
	   </div>
    </div>
</div>
</body>
</html>