package com.codeshot.model;

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
	private String phone;
	private String checkJoin;
	private String career;
}
