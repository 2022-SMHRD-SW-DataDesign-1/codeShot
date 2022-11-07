package com.codeshot.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class PortfolioDTO {
	// 포트폴리오 순번
	private BigDecimal pf_num;
	// 게시판 번호
	@NonNull
	private BigDecimal post_num;
	// 파일 이름
	@NonNull
	private String pf_file;
}
