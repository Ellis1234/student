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
</head>
<body>
<s:form method="post" action="information" theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="1500">  
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">����һ��ѧ����Ϣ</font></td>
  </tr>
  <tr>
    <td width="100%">��
    Ժϵ��ţ�
    <s:textfield name="departmentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    ѧ��:
    <s:textfield name="studentID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    ������
    <s:textfield name="name"/><br>
    �Ա�
    <s:textfield name="sex"/>
    ѧ�����ͣ�
  <s:textfield name="type"/>
    ��ѧ���ڣ�
  <input name="date" class="easyui-datebox" editable="false"/><br>
    ����:
    <s:textfield name="native"/>
    ���֤�ţ�
    <s:textfield name="ID" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    ��ϸ��ַ��
    <s:textfield name="address"/><br>
    �������ڣ�
  <input name="birthday" class="easyui-datebox" editable="false"/>
     רҵ��
    <s:textfield name="major"/>
    ����:
    <s:textfield name="nation"/><br>
    �绰���룺
    <s:textfield name="phone" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    �ɷ��ܼƣ�
    <s:textfield name="payment" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
    ����ѧ�֣�
  <s:textfield name="credit" onkeyup="chkPrice(this)" onblur="chkLast(this)" onpaste="javascript: return false;"/>
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
    <td width="100%" bgcolor="#C0C0C0" align="center" colspan="17">
    <font color="#0000FF">����ѧ������</font></td>
  </tr>
  <tr>
    <td width="5%" align="center">��
		Ժϵ���
    </td> 
    <td width="5%" align="center">��
		ѧ��
    </td>
    <td width="5%" align="center">��
		����
    </td> 
    <td width="5%" align="center">��
		�Ա�
    </td>
    <td width="5%" align="center">��
		ѧ������
    </td>
        <td width="5%" align="center">��
		��ѧ����
    </td> 
    <td width="5%" align="center">��
		����
    </td>
    <td width="5%" align="center">��
		���֤��
    </td> 
    <td width="5%" align="center">��
		��ϸ��ַ
    </td>
    <td width="5%" align="center">��
		��������
    </td>
        <td width="5%" align="center">��
		רҵ
    </td> 
    <td width="5%" align="center">��
		����
    </td>
    <td width="5%" align="center">��
		�绰����
    </td> 
    <td width="5%" align="center">��
		�ɷ��ܼ�
    </td>
    <td width="5%" align="center">��
		����ѧ��
    </td>
    <td width="5%" align="center">��
		��ע
    </td>  
    <td width="20%" align="center">��
		ɾ��
    </td>    
  </tr>
<s:iterator value="#request.userArray" status="status">
  <tr>
    <td width="5%" align="center">
    	<s:property value="departmentID"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="studentID"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="name"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="sex"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="type"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="date"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="native"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="ID"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="address"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="birthday"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="major"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="nation"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="phone"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="payment"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="credit"/>��
    </td>
        <td width="5%" align="center">
    	<s:property value="remark"/>��
    </td>
    <td width="20%" align="center">��
		<a href="information.action?action=del&studentID=<s:property value="studentID"/>">
		ɾ��</a>
    </td>      
  </tr>
</s:iterator>
</table>
</body>
</html>