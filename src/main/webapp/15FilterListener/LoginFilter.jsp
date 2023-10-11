<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginFilter.jsp</title>
</head>
<body>
	<h2>로그인 페이지[Filter]</h2>
	<span style="color:red; font-size:1.2rem;">
		<%= request.getAttribute("LoginErrMsg") ==null
			? "" : request.getAttribute("LoginErrMsg") %>
	</span>
	<%
	if (session.getAttribute("UserId")==null){
	%>
		<script>
		function validateForm(form){
			if(!form.user_id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(form.user_pw.value==""){
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
		</script>
		<form method="post" name="loginFrm" onsubmit="return validateForm(this);">
			<input type='hidden' name='backUrl' value="${ param.backUrl }"/>
			아이디 : <input type="text" name="user_id"/>
			패스워드 : <input type="password" name="user_pw"/>
			<input type="submit" value="로그인하기" />
		</form>
	<%
	} else {
	%>
		<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
		<a href="?mode=logout">[로그아웃]</a>
		
	<%
	}
	%>
</body>
</html>