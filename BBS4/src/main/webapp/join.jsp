<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="wodth=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹 사이트</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="flase">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">TMDB</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> 접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li ><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
						</ul>
						</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					<div class="form-group">
						<input class="form-control" name="year" type="text" pattern="[0-9]{4}"
						placeholder="생년" title="#### 출샌연도 4자리를 입력해주세요."> <span
						class="warning">필수값 입력 바랍니다.</span> <input class="form-control" name="month"
						type="number" min="1" max="12" placeholder="월"> <span
						class="warning">필수값 입력 바랍니다.</span> <input class="form-control" name="day"
						type="number" min="1" max="31" placeholder="일"> <span
						class="warning">필수값 입력 바랍니다.</span>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임" name="nickname" maxlength="20">
					</div>
					<div class="form-group">
						<select class="form-control" name="country" >
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
				<input class="form-control" type="text" id="mobile" name="mobile"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="mobile"
					title="###-####-####"> <input type="button" value="인증"
					onclick="checkMobile(form)"> <span class="warning">필수값
					입력 바랍니다.</span>
					</div>
					
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
		</div>
	</div>
	<div class="col-lg-r"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>
	function checkMobile(form) {
	    const val = form.mobile.value;
	    let check = val.match("(?=010|011|016|019)(?=([0-9]{3}-[0-9]{4}-[0-9]{4})).*");
	    
	    if (check !== null && check.index === 0) {
	        console.log("정상");

	    }
	    else {
	        console.log("비정상");
	        alert("올바르지 않은 휴대폰 번호입니다. ###-####-####")
	        form.mobile.value = "";
	    }
	}
	</script>
</body>
</html>