package com.codeshot.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChattingDTO 
{
	
	private BigDecimal chat_num;
	private String talker;
	private String chat_content;
	private Timestamp chat_time;
	private BigDecimal room_num;
	
}
