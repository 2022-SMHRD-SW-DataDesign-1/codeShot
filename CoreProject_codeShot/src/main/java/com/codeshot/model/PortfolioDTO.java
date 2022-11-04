package com.codeshot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PortfolioDTO {
	// 포트폴리오 순번
	private BigDecimal pf_num;
	// 게시판 번호
	private BigDecimal post_num;
	// 파일 이름
	private String pf_file;
}
