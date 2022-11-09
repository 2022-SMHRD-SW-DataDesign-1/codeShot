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
public class PrchsDTO {
	private BigDecimal prch_num;
	private BigDecimal post_num;
	private StringBuffer mem_email;
	private BigDecimal prch_price;
	private Timestamp prch_date;
	
}
