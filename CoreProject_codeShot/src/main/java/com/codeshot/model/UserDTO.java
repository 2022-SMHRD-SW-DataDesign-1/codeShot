package com.codeshot.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class UserDTO 
{
	@NonNull private String email;
	@NonNull private String pw;
	private String name;
	private String career;
	private String isExpert;
	private String phone;
	private Timestamp joindate;
	private String type;
}
