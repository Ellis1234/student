<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<script language="JavaScript" type="text/JavaScript">
<!--
function chkPrice(obj){ 
obj.value = obj.value.replace(/[^\d.]/g,""); 
//���뱣֤��һλΪ���ֶ�����. 
obj.value = obj.value.replace(/^\./g,""); 
//��ֻ֤�г���һ��.��û�ж��. 
obj.value = obj.value.replace(/\.{2,}/g,"."); 
//��֤.ֻ����һ�Σ������ܳ����������� 
obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
} 
function chkLast(obj){ 
// ������ַǷ��ַ��ͽ�ȡ�� 
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
    <font color="#0000FF">����һ��Ժϵ��Ϣ</font></td>
  </tr>
  <tr>
    <td width="100%">��
    Ժϵ��ţ�
    <s:textfield name="departmentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    Ժϵ����:
    <s:textfield name="departmentNAME"/><br>
    Ժϵ���ܣ�
    <s:textfield name="departmentHEAD"/>
    ��ַ��
    <s:textfield name="address"/>
    ������
  <s:textfield name="number" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    <s:hidden name="action" value="add"/>
    <s:submit value="�ύ"/>
    </td>
  </tr>
</table>
</s:form>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="6">
    <font color="#0000FF">����Ժϵ����</font></td>
  </tr>
  <tr>
    <td width="15%" align="center">��
		Ժϵ���
    </td> 
    <td width="15%" align="center">��
		Ժϵ����
    </td>
    <td width="15%" align="center">��
		Ժϵ����
    </td> 
    <td width="15%" align="center">��
		��ַ
    </td>
    <td width="20%" align="center">��
		����
    </td>    
    <td width="20%" align="center">��
		ɾ��
    </td>    
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="15%" align="center">
    	<s:property value="departmentID"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="departmentNAME"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="departmentHEAD"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="address"/>��
    </td>
        <td width="10%" align="center">
    	<s:property value="number"/>��
    </td> 
    <td width="20%" align="center">��
		<a href="department.action?action=del&departmentID=<s:property value="departmentID"/>">
		ɾ��</a>  
  </tr>
</s:iterator>
</table>
</body>
</html>