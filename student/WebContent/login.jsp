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
    //ҳ�����ʱ�����������֤��
    window.onload=function(){
     createCode(4);    
    }

    //������֤��ķ���
    function createCode(length) {
        var code = "";
        var codeLength = parseInt(length); //��֤��ĳ���
        var checkCode = document.getElementById("checkCode");
        ////���к�ѡ�����֤����ַ�����ȻҲ���������ĵ�
        var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
        //ѭ�������֤����ַ���
        for (var i = 0; i < codeLength; i++)
        {
            //��ȡ�����֤���±�
            var charNum = Math.floor(Math.random() * 62);
            //��ϳ�ָ���ַ���֤��
            code += codeChars[charNum];
        }
        if (checkCode)
        {
            //Ϊ��֤�����������ʽ��
            checkCode.className = "code";
            //��������֤�븳ֵ����ʾ��
            checkCode.innerHTML = code;
        }
    }
    
    //�����֤���Ƿ���ȷ
    function validateCode()
    {
    	userid = window.form1.name.value;
    	passwd = window.form1.pwd.value;
        //��ȡ��ʾ�����ɵ���֤��
        var checkCode = document.getElementById("checkCode").innerHTML;
        //��ȡ�������֤��
        var inputCode = document.getElementById("inputCode").value;
        console.log(checkCode);
        console.log(inputCode);
    	if(userid==""){
    	  	     window.alert("�û�ID����Ϊ��");
    	  		 window.form1.userId.focus(); return false;
    		  } 
    	  	  if(passwd==""){
    	  	     window.alert("�û����벻��Ϊ��");
    	  		 window.form1.passwd.focus(); return false;
    	  	  }
    	  else{
        if (inputCode.length <= 0)
        {
            alert("��������֤�룡");
            return false;
        }
        else if (inputCode.toUpperCase() != checkCode.toUpperCase())
        {
            alert("��֤����������");
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
		<!-- ���������Ϣ������У����ʾ -->
  		</td>
		<label>�û���:<input type="text" name="username" id="name" class="Wdate" onClick="WdatePicker()"></label>
		<br/><br/>
		<label>����:<input type="password" name="password" id="pwd"></label>
		<br/><br/>
		<label>������֤��:<input type="text" id="inputCode"></label>
		<br/><br/>
		<tr>
            <td> <div id="checkCode" class="code"  onclick="createCode(4)" ></div></td>
            <td> <span onclick="createCode(4)">�����廻һ��</span></td>
        </tr>
        <br/><br/><br/><br/>
		<button type="submit" name="submit" onMouseDown="validateCode()">��¼</button>
		<s:hidden name="action" value="login"/>
		<p class="message">��û���˻�? <a href="Register.action">���̴���</a></p>
		</s:form>
      </div>
    </div>
</div>
</body>
</html>