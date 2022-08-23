


<%@page import="user.User"%>
<%@page import="java.util.Vector"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"> 
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <title>modify</title>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	UserDAO userdao = new UserDAO();
	
	Vector<User> vec = userdao.checkUser((String) session.getAttribute("userID"));
	
	%>
   
    <div class="joinPart">
        <form class="J-form" method="post" action="modifyAction.jsp">
            <h1 class="joinTxt">회원정보수정</h1>
            <div class="inputBox">
                <input class="joinForm" type="text" name="userID" value="<%=vec.get(0).getUserID() %>" readonly maxlength="20">
                <label for="userID">아이디</label>
            </div>
            <div class="inputBox">
                <input class="joinForm" type="password" name="userPassword" value="<%=vec.get(0).getUserPassword() %>" maxlength="20">
               <label for="userPassword">비밀번호</label>
            </div>
            <div class="inputBox">
                <input class="joinForm" type="text" name="nickname" value="<%=vec.get(0).getNickname() %>" maxlength="20">
                <label for="nickname">닉네임</label>
            </div>
            <div class="inputBox">
                <input type="text" class="joinForm" name="userName" value="<%=vec.get(0).getUserName() %>" maxlength="20">
                <label for="userName">이름</label>
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
                <input type="email" class="joinForm" name="userEmail" value="<%=vec.get(0).getUserEmail() %>" maxlength="20">
                <label for="userEmail">e-mail</label>
            </div>
            <div class="inputBox2 inputBox">
            <%
            String arr[] = vec.get(0).getBirthdate().split("-");
            %>
                <input class="year" name="year" type="text" pattern="[0-9]{4}" title="#### 출생연도 4자리를 입력해주세요." value="<%=arr[0] %>">
                <label for="year">생년월일</label>
                <input class="month" name="month" type="number" min="1" max="12" value="<%=arr[1] %>">
                <input class="day" name="day" type="number" min="1" max="31" value="<%=arr[2] %>">
           
            </div>
            <div class="inputBox2">
                <select class="nation"  name="country">
                    <option value="kor" <%if(vec.get(0).getCountry().equals("kor")){ %>selected<%}%>>대한민국 +82</option>
                    <option value="duch" <%if(vec.get(0).getCountry().equals("duch")){ %>selected<%}%>>네덜란드 +31</option>
                    <option value="ger" <%if(vec.get(0).getCountry().equals("ger")){ %>selected<%}%>>독일 +49</option>
                    <option value="rus" <%if(vec.get(0).getCountry().equals("rus")){ %>selected<%}%>>러시아 +7</option>
                    <option value="usa" <%if(vec.get(0).getCountry().equals("usa")){ %>selected<%}%>>미국 +1</option>
                    <option value="viet" <%if(vec.get(0).getCountry().equals("vied")){ %>selected<%}%>>베트남 +84</option>
                    <option value="swiss" <%if(vec.get(0).getCountry().equals("siwss")){ %>selected<%}%>>스위스 +41</option>
                    <option value="spain" <%if(vec.get(0).getCountry().equals("spain")){ %>selected<%}%>>스페인 +34</option>
                    <option value="uk" <%if(vec.get(0).getCountry().equals("uk")){ %>selected<%}%>>영국 +44</option>
                    <option value="ost" <%if(vec.get(0).getCountry().equals("ost")){ %>selected<%}%>>오스트레일리아 +61</option>
                    <option value="jap" <%if(vec.get(0).getCountry().equals("jap")){ %>selected<%}%>>일본 +81</option>
                    <option value="china" <%if(vec.get(0).getCountry().equals("china")){ %>selected<%}%>>중국 +86</option>
                    <option value="czech" <%if(vec.get(0).getCountry().equals("czech")){ %>selected<%}%>>체코 +420</option>
                    <option value="canada" <%if(vec.get(0).getCountry().equals("canada")){ %>selected<%}%>>캐나다 +1</option>
                    <option value="thai" <%if(vec.get(0).getCountry().equals("thai")){ %>selected<%}%>>태국 +66</option>
                    <option value="pol" <%if(vec.get(0).getCountry().equals("pol")){ %>selected<%}%>>폴란드 +48</option>
                    <option value="france" <%if(vec.get(0).getCountry().equals("france")){ %>selected<%}%>>프랑스 +33</option>
                    <option value="phil" <%if(vec.get(0).getCountry().equals("phil")){ %>selected<%}%>>필리핀 +63</option>
                </select>
            </div>
            <div class="inputBox2">
                <input class="phone" type="text" id="mobile" name="mobile" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                    value="<%=vec.get(0).getMobile() %>" title="###-####-####">
                <input class="btn" type="button" value="인증" onclick="checkMobile(form)">
            </div>
            <input class="btn subBtn" type="submit" value="수정">  
        </form>
    </div>
		
   

    <script>
        function checkMobile(form) {
            const val = form.mobile.value;
            let check = val.match("(?=010|011|016|019)(?=([0-9]{3}-[0-9]{4}-[0-9]{4})).*");

            if (check !== null && check.index === 0) {
                console.log("정상");
				alert("인증완료")
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