package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;

public class JoinAction implements Action{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
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
}
