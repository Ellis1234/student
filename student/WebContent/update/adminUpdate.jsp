<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
<s:form method="post" action="adminUpdate" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">Ҫ��ѯ������</font></td>
  </tr>
  <tr>
    <td width="100%">��
    �������û�����
    <s:textfield name="username"/>
    <s:hidden name="action" value="select"/>
    <s:submit value="�ύ"/>
    </td>
  </tr>
</table>
</s:form>
<s:form method="post" action="adminUpdate" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="4">
    <font color="#0000FF">��ѯ�����û�����</font></td>
  </tr>
  <tr>
    <td width="10%" align="center">���</td>
    <td width="30%" align="center">�û���</td> 
    <td width="30%" align="center">����</td> 
    <td width="30%" align="center">���</td>  
  </tr>
<s:set name="stuArray" value="#request.stuArray" scope="action"/>
<s:if test="#stuArray!=null">
	<s:iterator value="#stuArray" status="status">
  <tr>
    <td width="10%" align="center"><s:property value="#status.count"/></td>
    <td width="30%" align="center"><s:property value="username"/></td> 
    <td width="30%" align="center"><s:property value="password"/></td> 
    <td width="30%" align="center">  
    <s:hidden name="stuParamArray[%{#status.index}].username" value="%{username}"/>
        <s:select name="stuParamArray[%{#status.index}].role" value="%{role}" list="#{'1':'ѧ��',
    		'2':'ϵ��������Ա'}"/>
    </td>
  </tr>
	</s:iterator>
</s:if> 
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="8">
    <font color="#0000FF">
    <s:submit value="ȷ ��"/>
    </font></td>
  </tr>	
  <s:hidden name="action" value="update"/>
</table>
</s:form>
</body>
</html>