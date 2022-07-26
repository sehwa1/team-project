package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;

public class LoginAction implements Action{
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	UserDAO dao = UserDAO.getInstance();

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	UserDTO user = new UserDTO(id, password);

	String url="";

	if(dao.loginCheck(user)){
		url = "./main";
	}
	else{
		
		url = "./login";
	}
	request.getRequestDispatcher(url).forward(request, response);
	request.getSession().setAttribute("log", user.getId());
	}
}
