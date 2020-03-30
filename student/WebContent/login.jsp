<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="/student/css/style1.css"type="text/css" />
<style>
    .code
    {
         font-family:Arial;
         font-style:italic;
         color:blue;
         font-size:30px;
         border:0;
         padding:2px 3px;
         letter-spacing:3px;
         font-weight:bolder;            
         float:left;           
         cursor:pointer;
         width:150px;
         height:50px;
         line-height:60px;
         text-align:center;
         vertical-align:middle;
         background-color:#D8B7E3;
     }
     span {
        text-decoration:none;
        font-size:12px;
        color:#288bc4;
        padding-left:10px;
    }

    span:hover {
        text-decoration:underline;
        cursor:pointer;
    }
   
</style>
<script language="javascript" type="text/javascript" src="/student/js/WdatePicker.js"> </script>
<script>
    //页面加载时，生成随机验证码
    window.onload=function(){
     createCode(4);    
    }

    //生成验证码的方法
    function createCode(length) {
        var code = "";
        var codeLength = parseInt(length); //验证码的长度
        var checkCode = document.getElementById("checkCode");
        ////所有候选组成验证码的字符，当然也可以用中文的
        var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
        //循环组成验证码的字符串
        for (var i = 0; i < codeLength; i++)
        {
            //获取随机验证码下标
            var charNum = Math.floor(Math.random() * 62);
            //组合成指定字符验证码
            code += codeChars[charNum];
        }
        if (checkCode)
        {
            //为验证码区域添加样式名
            checkCode.className = "code";
            //将生成验证码赋值到显示区
            checkCode.innerHTML = code;
        }
    }
    
    //检查验证码是否正确
    function validateCode()
    {
    	userid = window.form1.name.value;
    	passwd = window.form1.pwd.value;
        //获取显示区生成的验证码
        var checkCode = document.getElementById("checkCode").innerHTML;
        //获取输入的验证码
        var inputCode = document.getElementById("inputCode").value;
        console.log(checkCode);
        console.log(inputCode);
    	if(userid==""){
    	  	     window.alert("用户ID不能为空");
    	  		 window.form1.userId.focus(); return false;
    		  } 
    	  	  if(passwd==""){
    	  	     window.alert("用户密码不能为空");
    	  		 window.form1.passwd.focus(); return false;
    	  	  }
    	  else{
        if (inputCode.length <= 0)
        {
            alert("请输入验证码！");
            return false;
        }
        else if (inputCode.toUpperCase() != checkCode.toUpperCase())
        {
            alert("验证码输入有误！");
            createCode(4);
            return false;
        }
        else
        {
            return true;
        }
      }
    } 
</script>
</head>
<body>
<img src="/student/images/logo.jpg" align="middle" width="150" height="150"/>
<div class="htmleaf-container">
    <div id="wrapper" class="login-page">
      <div id="login_form" class="form">
		<s:form method="post" action="Login" name="form1" theme="simple">
		<td align="left">  
  		<s:fielderror/><s:property value="errormsg"/>
		<!-- 输出错误信息和数据校验提示 -->
  		</td>
		<label>用户名:<input type="text" name="username" id="name" class="Wdate" onClick="WdatePicker()"></label>
		<br/><br/>
		<label>密码:<input type="password" name="password" id="pwd"></label>
		<br/><br/>
		<label>输入验证码:<input type="text" id="inputCode"></label>
		<br/><br/>
		<tr>
            <td> <div id="checkCode" class="code"  onclick="createCode(4)" ></div></td>
            <td> <span onclick="createCode(4)">看不清换一张</span></td>
        </tr>
        <br/><br/><br/><br/>
		<button type="submit" name="submit" onMouseDown="validateCode()">登录</button>
		<s:hidden name="action" value="login"/>
		<p class="message">还没有账户? <a href="Register.action">立刻创建</a></p>
		</s:form>
      </div>
    </div>
</div>
</body>
</html>