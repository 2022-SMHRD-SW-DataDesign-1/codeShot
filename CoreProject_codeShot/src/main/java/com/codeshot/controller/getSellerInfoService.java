package com.codeshot.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.ChatDAO;
import com.codeshot.model.UserDTO;
import com.google.gson.Gson;

public class getSellerInfoService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[getSellerInfoService]");
		
		String sellerEmail = request.getParameter("sellerEmail");
		UserDTO sellerInfo = new ChatDAO().getSellerInfo(sellerEmail);
		
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String jsonSellerInfo = gson.toJson(sellerInfo);
			System.out.println("seller json 변환 완료");
			out.print(jsonSellerInfo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
