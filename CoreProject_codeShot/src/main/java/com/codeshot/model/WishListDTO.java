package com.codeshot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class WishListDTO {
	//게시물번호
	private BigDecimal post_num;
	//카테고리구분
	@NonNull private String post_category;
	//회원이메일
	@NonNull private String mem_email;
	//제목
	@NonNull private String post_title;
	//가격
	private BigDecimal post_price;
	
	private String post_file;

	public WishListDTO(BigDecimal post_num, @NonNull String mem_email) {
		this.post_num = post_num;
		this.mem_email = mem_email;
	}

	
	
	
}
