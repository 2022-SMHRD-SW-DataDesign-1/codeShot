package com.codeshot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class PostDTO {

	//게시물번호
	private BigDecimal post_num;
	//카테고리구분
	@NonNull private String post_category;
	//회원이메일
	@NonNull private String mem_email;
	//제목
	@NonNull private String post_title;
	//설명
	private String post_explain;
	//규격
	private String post_standard;
	//주의사항
	private String post_precautions;
	//가격
	private BigDecimal post_price;
	//첨부파일
	private String post_file;

	//소스코드게시물작성
	public PostDTO(@NonNull String post_category, @NonNull String mem_email, @NonNull String post_title,
			String post_explain, String post_standard, String post_precautions, BigDecimal post_price,
			String post_file) {
		this.post_category = post_category;
		this.mem_email = mem_email;
		this.post_title = post_title;
		this.post_explain = post_explain;
		this.post_standard = post_standard;
		this.post_precautions = post_precautions;
		this.post_price = post_price;
		this.post_file = post_file;
	}

	//외주 게시물작성
	public PostDTO(@NonNull String post_category, @NonNull String mem_email, @NonNull String post_title,
			String post_explain, String post_standard, String post_precautions, BigDecimal post_price) {
		this.post_category = post_category;
		this.mem_email = mem_email;
		this.post_title = post_title;
		this.post_explain = post_explain;
		this.post_standard = post_standard;
		this.post_precautions = post_precautions;
		this.post_price = post_price;
	}

	// 게시물 수정(첨부파일 수정 있음)
	public PostDTO(BigDecimal post_num, @NonNull String post_category, @NonNull String post_title, String post_explain,
			String post_standard, String post_precautions, BigDecimal post_price, String post_file) {
		this.post_num = post_num;
		this.post_category = post_category;
		this.post_title = post_title;
		this.post_explain = post_explain;
		this.post_standard = post_standard;
		this.post_precautions = post_precautions;
		this.post_price = post_price;
		this.post_file = post_file;
	}

	// 게시물 수정(첨부파일 수정 없음)
	public PostDTO(BigDecimal post_num, @NonNull String post_category,
			@NonNull String post_title, String post_explain, String post_standard, String post_precautions,
			BigDecimal post_price) {
		this.post_num = post_num;
		this.post_category = post_category;
		this.post_title = post_title;
		this.post_explain = post_explain;
		this.post_standard = post_standard;
		this.post_precautions = post_precautions;
		this.post_price = post_price;
	}
	
	



	
	


	
}
