<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join</title>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="joinPart">
        <form method="post" action="joinAction.jsp">
            <h1>회원가입</h1>
            <div class="inputBox">
                <input class="joinForm" type="text" name="userID" placeholder="아이디" maxlength="20">
                
            </div>
            <div class="inputBox">
                <input class="joinForm" type="password" name="userPassword" placeholder="비밀번호" maxlength="20">
            </div>
            <div class="inputBox">
                <input class="joinForm" type="text" name="nickname" placeholder="닉네임" maxlength="20">
            </div>
            <div class="inputBox">
                <input type="text" class="joinForm" name="userName" placeholder="이름" maxlength="20">
            </div>
            <div>
                <label>
                    <input class="selButton" type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
                </label>
                <label>
                    <input class="selButton" type="radio" name="userGender" autocomplete="off" value="여자">여자
                </label>
            </div>
            <div class="inputBox">
                <input type="email" class="joinForm" name="userEmail" placeholder="이메일" maxlength="20">
            </div>
            <div class="inputBox2 inputBox">
                <input class="year" name="year" type="text" pattern="[0-9]{4}" title="#### 출생연도 4자리를 입력해주세요." placeholder="연도(4글자)">
                <input class="month" name="month" type="number" min="1" max="12" placeholder="월">
                <input class="day" name="day" type="number" min="1" max="31" placeholder="일">
            </div>
            <div class="inputBox2">
                <select class="nation" name="country">
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
            </div>
            <div class="inputBox2">
                <input class="phone" type="text" id="mobile" name="mobile" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                    placeholder="휴대폰번호" title="###-####-####">
                <input class="btn" type="button" value="인증" onclick="checkMobile(form)">
            </div>
            <input class="btn subBtn" type="submit" value="회원가입">
        </form>
    </div>
    <footer></footer>

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