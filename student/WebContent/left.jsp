<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>Frame left</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="/student/js/page_common.js"></script>
    <link href="/student/css/common_style_blue.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		// ��ʾ�����ض����˵� 
		function menuClick( menuDiv ){
			$(".MenuLevel2").not( $(menuDiv).next() ).hide();
			$(menuDiv).next().toggle();
		}
		
		$(function(){
			// Ĭ��ֻ��ʾ��1�������˵�
			$(".MenuLevel2").hide();
			$(".MenuLevel2:first").show();
		});
	</script>
	<style type="text/css">
<!--
html{
height: 100%;
}
body {
	background: none repeat scroll 0 0 #D8EDFC;
	margin: 0;
	padding: 0;
}
#Menu {
    margin: 0;
    padding: 0;
    width: 155px;
	background: none repeat scroll 0 0 #D8EBF7;
    list-style: none outside none;
	
	margin-left: 3px;
	border-top: 3px solid #4891C6;
}
#Menu .level1 {
 color: #005790;
    font-weight: bold;
    padding-bottom: 1px;
	  cursor: pointer;
}
#Menu .level1 .level1Style {
  background: url("/student/images/menu_btn_bg.gif") no-repeat scroll 0 0 transparent;
    height: 23px;
    padding-left: 20px;
    padding-top: 5px;
    width: 135px;
	margin-bottom: -4px
}
#Menu .level1 .level1Style .Icon {
	margin-top: -2px;
}
#Menu .level1 .MenuLevel2 {
 background: none repeat scroll 0 0 #D8EBF7;
    list-style: none outside none;
    margin: 0;
    padding: 0;
}
#Menu .level1 .MenuLevel2 .level2Style{
	color: #005790;
    font-weight: normal;
	border-top: 1px solid #EFF6FB;
	height: 18px;
	padding-left: 43px;
	padding-top: 5px;
	width: 112px;
	background-image:url(/student/images/menu_arrow_single.gif);
	background-color: #8EC4E9;
	background-repeat: no-repeat;
	background-position: 29px center;
}
-->
</style>
</head>
<body>
<s:set name="role" value="#session.role" scope="action"/>  
    <ul id="Menu">
    <s:if test="#role!=null&&(#role==2)">
	    <li class="level1">
            <div onClick="menuClick(this);" class="level1Style">
				<img src="/student/images/admin1.png" class="Icon" /> 
				Ժϵ��Ϣ����
			</div>
            <ul class="MenuLevel2">
            	<li class="level2 level2Style">
                    <a target="main" href="department.action">��Ϣ��ѯ��ɾ��</a>
				</li>
                <li class="level2 level2Style">
                	<a target="main" href="update/departmentUpdate.action">��Ϣ�޸�</a>
				</li>              
            </ul>
        </li>
        <li class="level1">
            <div onClick="menuClick(this);" class="level1Style">
				<img src="/student/images/admin1.png" class="Icon" /> 
				ѧ����Ϣ����
			</div>
            <ul class="MenuLevel2">
        <li class="level2 level2Style">
                    <a target="main" href="information.action">��Ϣ��ѯ��ɾ��</a>
				</li>
                <li class="level2 level2Style">
                	<a target="main" href="update/studentUpdate.action">��Ϣ�޸�</a>
				</li>              
            </ul>
        </li>
                <li class="level1">
            <div onClick="menuClick(this);" class="level1Style">
				<img src="/student/images/admin1.png" class="Icon" /> 
				�γ���Ϣ����
			</div>
            <ul class="MenuLevel2">
        <li class="level2 level2Style">
                    <a target="main" href="course.action">��Ϣ��ѯ��ɾ��</a>
				</li>
                <li class="level2 level2Style">
                	<a target="main" href="update/courseUpdate.action">��Ϣ�޸�</a>
				</li>              
            </ul>
        </li>
        <li class="level1">
            <div onClick="menuClick(this);" class="level1Style">
				<img src="/student/images/admin1.png" class="Icon" /> 
				�ɼ�����
			</div>
            <ul class="MenuLevel2">
        <li class="level2 level2Style">
                    <a target="main" href="grade.action">��Ϣ��ѯ��ɾ��</a>
				</li>
                <li class="level2 level2Style">
                	<a target="main" href="update/gradeUpdate.action">��Ϣ�޸�</a>
				</li>              
            </ul>
        </li>
                <li class="level1">
            <div onClick="menuClick(this);" class="level1Style">
				<img src="/student/images/admin1.png" class="Icon" /> 
				�û�����
			</div>
            <ul class="MenuLevel2">
                <li class="level2 level2Style">
                	<a target="main" href="update/adminUpdate.action">��Ϣ�޸�</a>
				</li>              
            </ul>
            <ul class="MenuLevel2">
            	<li class="level2 level2Style">
                    <a target="_top" href="Login.action" ��nclick=top.location.replace("index.jsp")>ע��</a>
				</li>           
            </ul>
        </li>
        </s:if>
        <s:if test="#role!=null&&(#role==1)">
        <li class="level1">
            <div onClick="menuClick(this);" class="level1Style">
				<img src="/student/images/admin1.png" class="Icon" /> 
				ѧ����Ϣ
			</div>
            <ul class="MenuLevel2">
            	<li class="level2 level2Style">
                    <a target="main" href="student.action">��ѯ</a>
				</li>           
            </ul>
            <ul class="MenuLevel2">
            	<li class="level2 level2Style">
                    <a target="_top" href="Login.action" ��nclick=top.location.replace("index.jsp")>ע��</a>
				</li>           
            </ul>
        </li>
		</s:if>       
    </ul>
</body>
</html>