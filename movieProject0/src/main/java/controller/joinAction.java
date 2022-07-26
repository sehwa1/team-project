package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDAO;


/**
 * Servlet implementation class joinAction
 */
//@WebServlet("/joinAction")
public class joinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		<jsp:setProperty name="user" property="userID" />
//		<jsp:setProperty name="user" property="userPassword" />
//		<jsp:setProperty name="user" property="userName" />
//		<jsp:setProperty name="user" property="userGender" />
//		<jsp:setProperty name="user" property="userEmail" />
//		<jsp:setProperty name="user" property="nickname" />
//		<jsp:setProperty name="user" property="country" />
//		<jsp:setProperty name="user" property="mobile" />
//		<jsp:setProperty name="user" property="year" />
//		<jsp:setProperty name="user" property="month" />
//		<jsp:setProperty name="user" property="day" />
		
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		String nickname = request.getParameter("nickname");
		String country = request.getParameter("country");
		String mobile = request.getParameter("mobile");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		
		userID = null;
		if (request.getSession().getAttribute("userID") != null){
			userID = (String) request.getSession().getAttribute("userID");
		}
		if (userID != null){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		User user = new User();
			if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null 
				|| user.getUserEmail() == null || user.getNickname() == null || user.getCountry() == null || user.getMobile() == null
				|| user.getYear() == 0 || user.getMonth() == 0 || user.getDay() == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디입니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					//session.setAttribute("userID", user.getUserID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원가입 완료')");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}	
			}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
