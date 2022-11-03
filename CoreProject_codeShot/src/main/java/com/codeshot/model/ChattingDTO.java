package com.codeshot.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChattingDTO 
{
	
	private int chat_num;
	private String talker;
	private String chat_content;
	private String chat_time;
	private int room_num;
	
}
