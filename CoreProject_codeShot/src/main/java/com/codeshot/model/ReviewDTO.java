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
	@NonNull
	private BigDecimal review_num;
	private String review_content;
	@NonNull
	private BigDecimal review_starrating;
	private BigDecimal post_num;
	private String mem_email;
	private Timestamp review_date;
	
}
