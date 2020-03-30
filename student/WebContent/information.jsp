<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>	
<html>
<head>
<link rel="stylesheet" type="text/css" href="/student/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="/student/css/icon.css" />
<script type="text/javascript" src="/student/js/jquery-3.1.1.min.js">
</script>
<script type="text/javascript" src="/student/js/jquery.easyui.min.js">
</script>
<script language="JavaScript" type="text/JavaScript">
<!--
function chkPrice(obj){ 
obj.value = obj.value.replace(/[^\d.]/g,""); 
//必须保证第一位为数字而不是. 
obj.value = obj.value.replace(/^\./g,""); 
//保证只有出现一个.而没有多个. 
obj.value = obj.value.replace(/\.{2,}/g,"."); 
//保证.只出现一次，而不能出现两次以上 
obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
} 
function chkLast(obj){ 
// 如果出现非法字符就截取掉 
if(obj.value.substr((obj.value.length - 1), 1) == '.') 
obj.value = obj.value.substr(0,(obj.value.length - 1)); 
}
//-->
</script>
</head>
<body>
<s:form method="post" action="information" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">  
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">新增一个学生信息</font></td>
  </tr>
  <tr>
    <td width="100%">　
    院系编号：
    <s:textfield name="departmentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    学号:
    <s:textfield name="studentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    姓名：
    <s:textfield name="name"/><br>
    性别：
    <s:textfield name="sex"/>
    学生类型：
  <s:textfield name="type"/>
    入学日期：
  <input name="date" class="easyui-datebox" editable="false"/><br>
    籍贯:
    <s:textfield name="native"/>
    身份证号：
    <s:textfield name="ID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    详细地址：
    <s:textfield name="address"/><br>
    出生日期：
  <input name="birthday" class="easyui-datebox" editable="false"/>
     专业：
    <s:textfield name="major"/>
    民族:
    <s:textfield name="nation"/><br>
    电话号码：
    <s:textfield name="phone" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    缴费总计：
    <s:textfield name="payment" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    已修学分：
  <s:textfield name="credit" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
     备注：
   <s:textfield name="remark"/>
    <s:hidden name="action" value="add"/>
    <s:submit value="提交"/>
    </td>
  </tr>
</table>
</s:form>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="17">
    <font color="#0000FF">已有学生数据</font></td>
  </tr>
  <tr>
    <td width="5%" align="center">　
		院系编号
    </td> 
    <td width="5%" align="center">　
		学号
    </td>
    <td width="5%" align="center">　
		姓名
    </td> 
    <td width="5%" align="center">　
		性别
    </td>
    <td width="5%" align="center">　
		学生类型
    </td>
        <td width="5%" align="center">　
		入学日期
    </td> 
    <td width="5%" align="center">　
		籍贯
    </td>
    <td width="5%" align="center">　
		身份证号
    </td> 
    <td width="5%" align="center">　
		详细地址
    </td>
    <td width="5%" align="center">　
		出生日期
    </td>
        <td width="5%" align="center">　
		专业
    </td> 
    <td width="5%" align="center">　
		民族
    </td>
    <td width="5%" align="center">　
		电话号码
    </td> 
    <td width="5%" align="center">　
		缴费总计
    </td>
    <td width="5%" align="center">　
		已修学分
    </td>
    <td width="5%" align="center">　
		备注
    </td>  
    <td width="20%" align="center">　
		删除
    </td>    
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="5%" align="center">
    	<s:property value="departmentID"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="studentID"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="name"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="sex"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="type"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="date"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="native"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="ID"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="address"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="birthday"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="major"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="nation"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="phone"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="payment"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="credit"/>　
    </td>
        <td width="5%" align="center">
    	<s:property value="remark"/>　
    </td>
    <td width="20%" align="center">　
		<a href="information.action?action=del&studentID=<s:property value="studentID"/>">
		删除</a>
    </td>      
  </tr>
</s:iterator>
</table>
</body>
</html>