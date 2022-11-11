package com.codeshot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.ChatDAO;
import com.codeshot.model.UserDTO;

public class getSellerInfoService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String sellerEmail = request.getParameter("sellerEmail");
		
		UserDTO sellerInfo = new ChatDAO().getSellerInfo(sellerEmail);
		
		
		
		return null;
	}

}
