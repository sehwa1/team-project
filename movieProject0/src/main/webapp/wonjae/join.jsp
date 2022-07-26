<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/form.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Join</title>
</head>

<body>
	<h1>Logo</h1>
	<form method="post" action="./Service">
			<input type="hidden" name="cmd" value="join">
		<div class="contents">

			<!-- 아이디 -->
			<input class="req" name="id" type="text" placeholder="사용할 ID 입력하세요">
			<span class="warning">필수값 입력 바랍니다.</span>

			<!-- 비밀번호 -->
			<div>
				<input class="req" name="password" type="password"
					placeholder="사용할 PW 입력하세요"> <span class="warning">필수값
					입력 바랍니다.</span> <input class="req" name="password" type="password"
					placeholder="위에 입력한 PW입력하세요"> <span class="warning">필수값
					입력 바랍니다.</span>
			</div>

			<!-- 이름 -->
			<input class="req" name="name" type="text" placeholder="name">
			<span class="warning">필수값 입력 바랍니다.</span>
			
			<!-- 닉네임ㅇ -->
			<input class="req" name="nickname" type="text" placeholder="nickname">
			<span class="warning">필수값 입력 바랍니다.</span>

			<!-- 생년월일 -->
			<div>
				<input class="req" name="year" type="text" pattern="[0-9]{4}"
					placeholder="생년" title="#### 출샌연도 4자리를 입력해주세요."> <span
					class="warning">필수값 입력 바랍니다.</span> <input class="req" name="month"
					type="number" min="1" max="12" placeholder="월"> <span
					class="warning">필수값 입력 바랍니다.</span> <input class="req" name="day"
					type="number" min="1" max="31" placeholder="일"> <span
					class="warning">필수값 입력 바랍니다.</span>
			</div>

			<!-- 성별 -->
			<select name="gender">
				<option value="none">성별</option>
				<option value="men">남자</option>
				<option value="women">여자</option>
			</select> <span class="warning">필수값 입력 바랍니다.</span> <input class="req"
				name="email" type="email" placeholder="email"> <span
				class="warning">필수값 입력 바랍니다.</span>

			<!-- 연락처 -->
			<div>
				<select name="country">
					<option value="kor">대한민국 +82</option>
					<option value="duch">네덜란드 +31</option>
					<option value="ger">독일 +49</option>
					<option value="rus">러시아 +7</option>
					<option value="usa">미국 +1</option>
					<option value="viet">베트남 +84</option>
					<option value="swiss">스위스 +41</option>
					<option value="spain">스페인 +34</option>
					<option value="uk">영국 +44</option>
					<option value="ost">오스트레일리아 +61</option>
					<option value="jap">일본 +81</option>
					<option value="china">중국 +86</option>
					<option value="czech">체코 +420</option>
					<option value="canada">캐나다 +1</option>
					<option value="thai">태국 +66</option>
					<option value="pol">폴란드 +48</option>
					<option value="france">프랑스 +33</option>
					<option value="phil">필리핀 +63</option>
				</select> 
				<input class="req" type="text" id="mobile" name="mobile"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="mobile"
					title="###-####-####"> <input type="button" value="인증"
					onclick="checkMobile(form)"> <span class="warning">필수값
					입력 바랍니다.</span>
			</div>
			
			<!-- 주소 -->
			<div>
				<input class="req" name="address" type="text" placeholder="시,구,동">
				<span class="warning">필수값 입력 바랍니다.</span> 
			</div>

		</div>
		<div class=buttons>
			<input type="button" value="뒤로" onclick="location.href = 'agree.jsp'">
			<input type="reset" value="재작성">
			<input type="button" value="확인" onclick="checkJoinVal(form)">
		</div>
	</form>
	<script src="script/validation.js"></script>
</body>
</html>