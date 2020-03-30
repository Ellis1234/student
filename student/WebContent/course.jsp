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
<s:form method="post" action="course" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">新增一个课程信息</font></td>
  </tr>
  <tr>
    <td width="100%">　
    课程号：
    <s:textfield name="courseID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    课程名称:
    <s:textfield name="courseNAME"/><br>
    年级：
    <s:textfield name="grade"/>
    学时数：
    <s:textfield name="hour" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    学分：
  <s:textfield name="credit" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
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
		课程编号
    </td> 
    <td width="15%" align="center">　
		课程名称
    </td>
    <td width="15%" align="center">　
		年级
    </td> 
    <td width="15%" align="center">　
		学时数
    </td>
    <td width="20%" align="center">　
		学分
    </td>    
    <td width="20%" align="center">　
		删除
    </td>      
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="15%" align="center">
    	<s:property value="courseID"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="courseNAME"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="grade"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="hour"/>　
    </td>
        <td width="20%" align="center">
    	<s:property value="credit"/>　
    </td> 
    <td width="20%" align="center">　
		<a href="course.action?action=del&courseID=<s:property value="courseID"/>">
		删除</a>
    </td>       
  </tr>
</s:iterator>
</table>
</body>
</html>