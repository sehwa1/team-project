package controller;

import controller.action.Action;
import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;

public class ActionFactory {
	private ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getinstance() {
		return instance;
	}
	
	public Action getAction(String cmd) {
		Action action = null;
		if(cmd.equals("join")) action = new JoinAction();
		else if(cmd.equals("login")) action = new LoginAction();
		else if(cmd.equals("logout")) action = new LogoutAction();
		
		return action;
	}
}
