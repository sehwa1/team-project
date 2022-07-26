package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;

/**
 * Servlet implementation class JoinAction
 */
//@WebServlet("/JoinAction")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		UserDAO dao = UserDAO.getInstance();
		UserDTO user = null;


		String id = request.getParameter("id");
		String[] password = request.getParameterValues("password");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");

		user = new UserDTO(id, password[0], name, nickname, year, month, day, gender, email, country, mobile, address);
//		user = new UserDTO(id);
		String url="";

		if(dao.checkDupl(user)){
			// 중복검사
			url ="./main";
		}
		else{
			// 회원가입 성공
			url ="./login";
		}
		request.getRequestDispatcher(url).forward(request, response);
		request.getSession().setAttribute("log", user.getId());

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
