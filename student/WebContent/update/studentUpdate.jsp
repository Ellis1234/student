<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
<s:form method="post" action="studentUpdate" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">要查询的条件</font></td>
  </tr>
  <tr>
    <td width="100%">　
    请输入学号：
    <s:textfield name="studentID"/>
    <s:hidden name="action" value="select"/>
    <s:submit value="提交"/>
    </td>
  </tr>
</table>
</s:form>
<s:form method="post" action="studentUpdate" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="6">
    <font color="#0000FF">查询到的学生数据</font></td>
  </tr>
  <tr>
    <td width="10%" align="center">序号</td>
    <td width="10%" align="center">院系编号</td> 
    <td width="20%" align="center">学号</td> 
    <td width="20%" align="center">姓名</td>
    <td width="20%" align="center">地址</td>  
    <td width="20%" align="center">缴费总计</td>    
  </tr>
<s:set name="stuArray" value="#request.stuArray" scope="action"/>
<s:if test="#stuArray!=null">
	<s:iterator value="#stuArray" status="status">
  <tr>
    <td width="10%" align="center"><s:property value="#status.count"/></td>
    <td width="10%" align="center"><s:property value="DepartmentID"/></td> 
    <td width="20%" align="center"><s:property value="StudentID"/></td> 
	<td width="20%" align="center">
	    <s:hidden name="stuParamArray[%{#status.index}].studentID" value="%{studentID}"/>
    <s:textfield name="stuParamArray[%{#status.index}].name" value="%{name}" size="12"/> 
    </td>
    <td width="20%" align="center">
    <s:textfield name="stuParamArray[%{#status.index}].address" value="%{address}" size="12"/> 
    </td>
    <td width="20%" align="center">
    <s:textfield name="stuParamArray[%{#status.index}].payment" value="%{payment}" size="12"/> 
    </td>
  </tr>
	</s:iterator>
</s:if> 
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="8">
    <font color="#0000FF">
    <s:submit value="确 定"/>
    </font></td>
  </tr>	
  <s:hidden name="action" value="update"/>
</table>
</s:form>
</body>
</html>