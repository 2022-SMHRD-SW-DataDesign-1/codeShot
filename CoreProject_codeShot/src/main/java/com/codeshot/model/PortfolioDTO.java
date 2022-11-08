package com.codeshot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
@ToString
public class PortfolioDTO {
	// 포트폴리오 순번
	private BigDecimal pf_num;
	// 회원 이메일
	@NonNull private String mem_email;
	// 파일 이름
	@NonNull private String pf_file;
}
