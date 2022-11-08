package com.codeshot.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.UserDTO;
import com.codeshot.model.WishListDAO;
import com.codeshot.model.WishListDTO;

public class WishAddService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[찜한 게시물 테이블에 추가]");
		
		HttpSession session = request.getSession();
		UserDTO u_dto = (UserDTO) session.getAttribute("info");
		String mem_email =  u_dto.getEmail();
		
		BigDecimal postNum = new BigDecimal(request.getParameter("postNum"));
		System.out.println(postNum);
		
		WishListDTO w_dto = new WishListDTO(postNum, mem_email);
		
		new WishListDAO().WishAddService(w_dto);
		return null;
	}

}
