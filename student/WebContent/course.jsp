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
<s:form method="post" action="course" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">����һ���γ���Ϣ</font></td>
  </tr>
  <tr>
    <td width="100%">��
    �γ̺ţ�
    <s:textfield name="courseID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    �γ�����:
    <s:textfield name="courseNAME"/><br>
    �꼶��
    <s:textfield name="grade"/>
    ѧʱ����
    <s:textfield name="hour" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    ѧ�֣�
  <s:textfield name="credit" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    <s:hidden name="action" value="add"/>
    <s:submit value="�ύ"/>
    </td>
  </tr>
</table>
</s:form>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="6">
    <font color="#0000FF">���пγ�����</font></td>
  </tr>
  <tr>
    <td width="15%" align="center">��
		�γ̱��
    </td> 
    <td width="15%" align="center">��
		�γ�����
    </td>
    <td width="15%" align="center">��
		�꼶
    </td> 
    <td width="15%" align="center">��
		ѧʱ��
    </td>
    <td width="20%" align="center">��
		ѧ��
    </td>    
    <td width="20%" align="center">��
		ɾ��
    </td>      
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="15%" align="center">
    	<s:property value="courseID"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="courseNAME"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="grade"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="hour"/>��
    </td>
        <td width="20%" align="center">
    	<s:property value="credit"/>��
    </td> 
    <td width="20%" align="center">��
		<a href="course.action?action=del&courseID=<s:property value="courseID"/>">
		ɾ��</a>
    </td>       
  </tr>
</s:iterator>
</table>
</body>
</html>