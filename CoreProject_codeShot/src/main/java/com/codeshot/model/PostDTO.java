package com.codeshot.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class PostDTO {

	//게시물번호
	private int post_num;
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
	private String post_price;
	//첨부파일
	private String post_file;

}
