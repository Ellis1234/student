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
<s:form method="post" action="grade" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">����һ���ɼ��γ���Ϣ</font></td>
  </tr>
  <tr>
    <td width="100%">��
    ѧ�ţ�
    <s:textfield name="studentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    �γ̺�:
    <s:textfield name="courseID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/><br>
    ѧ�ڣ�
    <s:textfield name="semester" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    �ɼ���
    <s:textfield name="score" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    ��ע��
  <s:textfield name="remark"/>
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
		ѧ��
    </td> 
    <td width="15%" align="center">��
		�γ̺�
    </td>
    <td width="15%" align="center">��
		ѧ��
    </td> 
    <td width="15%" align="center">��
		�ɼ�
    </td>
    <td width="20%" align="center">��
		��ע
    </td>    
    <td width="20%" align="center">��
		ɾ��
    </td>      
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="15%" align="center">
    	<s:property value="studentID"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="courseID"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="semester"/>��
    </td>
        <td width="15%" align="center">
    	<s:property value="score"/>��
    </td>
        <td width="20%" align="center">
    	<s:property value="remark"/>��
    </td> 
    <td width="20%" align="center">��
		<a href="grade.action?action=del&studentID=<s:property value="studentID"/>">
		ɾ��</a>
    </td>       
  </tr>
</s:iterator>
</table>
</body>
</html>