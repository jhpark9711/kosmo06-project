<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Annotation.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Annotation(어노테이션)</legend>
		<h2>리퀘스트 영역에 저장된 값들</h2>
		\${requestScope.loginInfo } : ${requestScope.loginInfo }
		<hr />
		<fieldset>
			<legend>@RequestMapping / @PathVariable</legend>
			<h4>@RequestMapping("/요청URL패턴"):GET/POST둘다 처리 가능</h4>

			<form method="get"
				action="<c:url value='/Annotation/RequestMappingBoth.do'/>">
				아이디 <input type="text" name="UserID" /> 
				비번 <input type="password" name="UserPWD" /> 
				<input type="submit" value="로그인" />
			</form>
			<h4>@RequestMapping(value="/요청URL패턴",method=RequestMethod.GET):GET/POST둘중
				하나만 처리 가능</h4>
			<form method="post"
				action='<c:url value="/Annotation/RequestMappingOne.do"/>'>
				아이디 <input type="text" name="user" /> 
				비번 <input type="password" name="pass" /> 
				<input type="submit" value="로그인" />
			</form>
		</fieldset>
		<hr />

		<span style="color: green; font-size: 1.4em">이름: ${name} ,10년후
			나이:${years}</span>
			
		<fieldset>
			<legend>@RequestParam ${errorNumber}${empty param.error ?"":"나이는 숫자만 입력"}</legend>
			<!-- 
     		예]
  			//컨트롤러 메소드]
			  public String 메소드(@RequestParam 자료형 매개변수){
			  
			  }
 
       			단, 파라미터명과  매개변수명이 일치하지 않은 경우
    			@RequestParam("파라미터명") 자료형 매개변수명
      
     - 해당 파라미터의 자료형으로 받을 수 있다 
              즉 형변환 불필요
     - 파라미터가 1~2개 정도일때 유리       
     -->
			<h4>파라미터명과 매개변수명 일치시</h4>
			<form action='<c:url value="/Annotation/RequestParamEqual.do"/>'>
				이름 <input type="text" name="name" value="${param.name}" /> 나이 <input
					type="text" name="years" value="${param.years}" /> <input
					type="submit" value="확인" />
			</form>
			<h4>파라미터명과 매개변수명 불일치시</h4>
			<form action='<c:url value="/Annotation/RequestParamDiff.do"/>'>
				이름 <input type="text" name="nick2" /> 
				나이 <input type="text"	name="age" /> 
				<input type="submit" value="확인" />
			</form>
			<h4>파라미터를 맵으로 모두 받기</h4>

			<span style="color: green; font-size: 1.2em; font-weight: bold">이름:${nick },나이:${age },관심사항:${inters },성별:${gender }</span>

			<form action='<c:url value="/Annotation/RequestParamMap.do"/>'>
				이름 <input type="text" name="nick" /> 나이 <input type="text"
					name="age" /> 관심사항: <input type="checkbox" name="inters"
					value="정치" />정치 <input type="checkbox" name="inters" value="경제" />경제
				<input type="checkbox" name="inters" value="연예" />연예 성별: <input
					type="radio" name="gender" value="남자" />남자 <input type="radio"
					name="gender" value="여자" />여자 <input type="submit" value="확인" />
			</form>
		</fieldset>
		<hr />
		<fieldset>
			<legend>@ModelAttribute</legend>
			<form action="<c:url value='/Annotation/ModelAttribute.do'/>"
				method="post">
				<table bgcolor="gray" cellspacing="1" width="60%">
					<tr bgcolor="white">
						<td>이름</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr bgcolor="white">
						<td>나이</td>
						<td><input type="text" name="years" /></td>
					</tr>
					<tr bgcolor="white">
						<td>성별</td>
						<td><input type="radio" name="gender" value="남자" />남자 <input
							type="radio" name="gender" value="여자" />여자</td>
					</tr>
					<tr bgcolor="white">
						<td>관심사항</td>
						<td><input type="checkbox" name="inters" value="정치" />정치 <input
							type="checkbox" name="inters" value="경제" />경제 <input
							type="checkbox" name="inters" value="스포츠" />스포츠</td>
					</tr>
					<tr bgcolor="white">
						<td>학력</td>
						<td><select name="grade">
								<option value="초등학교">초등학교</option>
								<option value="중학교">중학교</option>
								<option value="고등학교">고등학교</option>
								<option value="대학교">대학교</option>
						</select></td>
					</tr>
					<tr bgcolor="white">
						<td>자기소개</td>
						<td><textarea name="self" cols="30" rows="10"></textarea></td>
					</tr>
					<tr bgcolor="white" align="center">
						<td colspan="2"><input type="submit" value="확인" /></td>
					</tr>
				</table>
			</form>
		</fieldset>
		<hr />
		<fieldset>
			<legend>DI와 관련된 어노테이션들${message !=null ? message : ""}</legend>
			<ul style="list-style-type: decimal;">
				<li><a href="<c:url value='/Annotation/Required.do'/>">@Required</a></li>
				<li><a href="<c:url value='/Annotation/Autowired.do'/>">@Autowired</a></li>
				<li><a href="<c:url value='/Annotation/Resource.do'/>">@Resource</a></li>
			</ul>
		</fieldset>
		<hr />
		<fieldset>
			<legend>기타 어노테이션들</legend>
			<h4>@SessionAttribute</h4>
			<span style="color: red; font-size: 1.4em; font-weight: bold">${requestScope.errorMessage }</span>
		
			\${sessionScope.loginCommand  } : ${sessionScope.loginCommand}
			<c:if test="${empty sessionScope.loginCommand }" var="isNotLogin">
			<%-- 
			<c:if test="${empty sessionScope.user }" var="isNotLogin">
			--%>
				<form method="post"	action='<c:url value="/Annotation/SessionAttributeLogin.do"/>'>
					아이디 <input type="text" name="user" /> 
					비번 <input type="password" name="pass" /> 
					<input type="submit" value="로그인" />
				</form>
			</c:if>
			<c:if test="${not isNotLogin}">
				세션영역:${sessionScope.user}<br/>
				리퀘스트 영역:${requestScope.user}<br/>
			
				${sessionScope.user}${sessionScope.loginCommand.user}님 즐감하세요!!!<br />
				<a href="<c:url value="/Annotation/SessionAttributeLogout.do"/>">로그아웃</a>
			</c:if>
			<br /> 
			<a href="<c:url value="/Annotation/isLogin.do"/>">로그인 여부 판단</a><br/>
			\${param.error } : ${param.error }<br/>
			\${param.error2 } : ${param.error2 }
			<ul>
				<li>서블릿 API(HttpSession사용시) :${isLoginMessage }</li>
				<li>@SessionAttribute사용시 :${empty param.error ? "":"로그인 하세요"}${isLoginMessage }


				</li>
			</ul>
			<h4>
				<a href="<c:url value="/Annotation/ResponseBody.do"/>">@ResponseBody</a>
			</h4>
			
			<h4>
				<a href="<c:url value="/Annotation/RequestHeader.do"/>">@RequestHeader</a>
			</h4>
		</fieldset>
		${browser}

	</fieldset>
</body>
</html>