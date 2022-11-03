package com.codeshot.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChatRoomDTO 
{
	private int room_num;
	private String mem_email;
	private String room_title;
	private String room_description;
	private String room_opendate;
}
