package com.codeshot.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class ReviewDTO {
	//리뷰번호 
	@NonNull
	private BigDecimal review_num;
	//리뷰내용
	private String review_content;
	//리뷰별점
	@NonNull
	private BigDecimal review_starrating;
	//게시물번호
	private BigDecimal post_num;
	//회원이메일
	private String mem_email;
	//리뷰날짜
	private Timestamp review_date;
	//이미지대신 임시로 게시물파일
	private String post_file;
	
	public ReviewDTO(@NonNull BigDecimal review_num, String review_content, @NonNull BigDecimal review_starrating,
			BigDecimal post_num, String mem_email, Timestamp review_date) {
		this.review_num = review_num;
		this.review_content = review_content;
		this.review_starrating = review_starrating;
		this.post_num = post_num;
		this.mem_email = mem_email;
		this.review_date = review_date;
	}

	public ReviewDTO(String review_content, @NonNull BigDecimal review_starrating, BigDecimal post_num,
			String mem_email) {
		super();
		this.review_content = review_content;
		this.review_starrating = review_starrating;
		this.post_num = post_num;
		this.mem_email = mem_email;
	}




}

