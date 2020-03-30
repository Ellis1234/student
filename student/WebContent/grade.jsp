<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
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
<body>
<s:form method="post" action="grade" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">新增一个成绩课程信息</font></td>
  </tr>
  <tr>
    <td width="100%">　
    学号：
    <s:textfield name="studentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    课程号:
    <s:textfield name="courseID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/><br>
    学期：
    <s:textfield name="semester" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    成绩：
    <s:textfield name="score" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
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
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="6">
    <font color="#0000FF">已有课程数据</font></td>
  </tr>
  <tr>
    <td width="15%" align="center">　
		学号
    </td> 
    <td width="15%" align="center">　
		课程号
    </td>
    <td width="15%" align="center">　
		学期
    </td> 
    <td width="15%" align="center">　
		成绩
    </td>
    <td width="20%" align="center">　
		备注
    </td>    
    <td width="20%" align="center">　
		删除
    </td>      
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="15%" align="center">
    	<s:property value="studentID"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="courseID"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="semester"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="score"/>　
    </td>
        <td width="20%" align="center">
    	<s:property value="remark"/>　
    </td> 
    <td width="20%" align="center">　
		<a href="grade.action?action=del&studentID=<s:property value="studentID"/>">
		删除</a>
    </td>       
  </tr>
</s:iterator>
</table>
</body>
</html>