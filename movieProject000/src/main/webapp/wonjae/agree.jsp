<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Agreement</title>
</head>
<body>
	<h1>로고</h1>
	<form action="join.jsp">
		<div class="contents">
			<input id="checkAll" type="checkbox" name="checkAll" value="checkAll">이용약관,
			개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수진(선택)에 모두 동의합니다.<br> <br>
			<input type="checkbox" name="agree" value="1">그린뮤비쉐어 이용약관 동의(필수)<br>
			<p>여러분을 환영합니다. 
			당사의 서비스를 이용하거나 당사 소유, 운영하는 본 개인 정보 보호 정책에 연결된 자회사(총칭:"GREENMOVIESHARE","당사")와 상호 작용하는 경우, 
			귀하는 개인 정보 보호 정책에 동의하여야합니다. 개인 정보 보호 정책에 설명된대로 정보를 수집, 전송, 저장, 철, 공개 및 사용합니다. 
			여기에는 해당 법률에 따라 중요한 것으로 간중되는 사용자가 제공하기로 선택한 모든 정보가 포함됩니다.</p>
			
			<input type="checkbox" name="agree" value="2">개인정보 수집 및 이용
			동의(필수)<br>
			<p>여러분을 환영합니다. 
			당사의 서비스를 이용하거나 당사 소유, 운영하는 본 개인 정보 보호 정책에 연결된 자회사(총칭:"GREENMOVIESHARE","당사")와 상호 작용하는 경우, 
			귀하는 개인 정보 보호 정책에 동의하여야합니다. 개인 정보 보호 정책에 설명된대로 정보를 수집, 전송, 저장, 철, 공개 및 사용합니다. 
			여기에는 해당 법률에 따라 중요한 것으로 간중되는 사용자가 제공하기로 선택한 모든 정보가 포함됩니다.</p>

			<input type="checkbox" name="agree" value="3">위치기반서비스 이용약관
			동의(선택)<br>
			<p>여러분을 환영합니다. !
			당사의 서비스를 이용하거나 당사 소유, 운영하는 본 개인 정보 보호 정책에 연결된 자회사(총칭:"GREENMOVIESHARE","당사")와 상호 작용하는 경우, 
			귀하는 개인 정보 보호 정책에 동의하여야합니다. 개인 정보 보호 정책에 설명된대로 정보를 수집, 전송, 저장, 철, 공개 및 사용합니다. 
			여기에는 해당 법률에 따라 중요한 것으로 간중되는 사용자가 제공하기로 선택한 모든 정보가 포함됩니다.</p>

			<input type="checkbox" name="agree" value="4">프로모션 정보 수신
			동의(선택)<br>
			<p>여러분을 환영합니다. 
			당사의 서비스를 이용하거나 당사 소유, 운영하는 본 개인 정보 보호 정책에 연결된 자회사(총칭:"GREENMOVIESHARE","당사")와 상호 작용하는 경우, 
			귀하는 개인 정보 보호 정책에 동의하여야합니다. 개인 정보 보호 정책에 설명된대로 정보를 수집, 전송, 저장, 철, 공개 및 사용합니다. 
			여기에는 해당 법률에 따라 중요한 것으로 간중되는 사용자가 제공하기로 선택한 모든 정보가 포함됩니다.</p>
		</div>
		<div class="buttons">
			<div class="warning">
				<span>필수 항목을 모두 동의해주세요</span><br> <br>
			</div>
			<input type="button" onclick="location.href = 'login.jsp'" value="취소"> 
			<input type="button" onclick="checkVal(form)" value="확인">
		</div>
	</form>
	<script src="script/validation.js"></script>
</body>
</html>