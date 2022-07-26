package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements Action{
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	String url="";
	url="./login";
	request.getRequestDispatcher(url).forward(request, response);
	request.getSession().removeAttribute("log");
	}
}
