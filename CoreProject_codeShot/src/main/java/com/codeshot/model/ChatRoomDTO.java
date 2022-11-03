package com.codeshot.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChatRoomDTO 
{
	private BigDecimal room_num;
	private String seller_email;
	private String buyer_email;
	private String room_title;
	private String room_description;
	private Timestamp room_opendate;
}
