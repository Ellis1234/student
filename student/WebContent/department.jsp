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
<s:form method="post" action="department" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">新增一个院系信息</font></td>
  </tr>
  <tr>
    <td width="100%">　
    院系编号：
    <s:textfield name="departmentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    院系名称:
    <s:textfield name="departmentNAME"/><br>
    院系主管：
    <s:textfield name="departmentHEAD"/>
    地址：
    <s:textfield name="address"/>
    人数：
  <s:textfield name="number" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    <s:hidden name="action" value="add"/>
    <s:submit value="提交"/>
    </td>
  </tr>
</table>
</s:form>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="6">
    <font color="#0000FF">已有院系数据</font></td>
  </tr>
  <tr>
    <td width="15%" align="center">　
		院系编号
    </td> 
    <td width="15%" align="center">　
		院系名称
    </td>
    <td width="15%" align="center">　
		院系主管
    </td> 
    <td width="15%" align="center">　
		地址
    </td>
    <td width="20%" align="center">　
		人数
    </td>    
    <td width="20%" align="center">　
		删除
    </td>    
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="15%" align="center">
    	<s:property value="departmentID"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="departmentNAME"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="departmentHEAD"/>　
    </td>
        <td width="15%" align="center">
    	<s:property value="address"/>　
    </td>
        <td width="10%" align="center">
    	<s:property value="number"/>　
    </td> 
    <td width="20%" align="center">　
		<a href="department.action?action=del&departmentID=<s:property value="departmentID"/>">
		删除</a>  
  </tr>
</s:iterator>
</table>
</body>
</html>