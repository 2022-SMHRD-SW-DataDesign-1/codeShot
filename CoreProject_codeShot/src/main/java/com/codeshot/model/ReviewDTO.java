package com.codeshot.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class ReviewDTO {
	private int review_num;
	private String review_content;
	@NonNull
	private int review_starrating;
	private int post_num;
	private String mem_email;
	private Timestamp review_date;
	
}
