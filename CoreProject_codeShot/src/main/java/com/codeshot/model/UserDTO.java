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
	@NonNull private String name;
	@NonNull private String phone;
	@NonNull private String checkJoin;
	private String career;
	
	public UserDTO(@NonNull String email, @NonNull String pw, @NonNull String name, @NonNull String phone,
			@NonNull String checkJoin) {
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.checkJoin = checkJoin;
	}

	public UserDTO(@NonNull String email, @NonNull String pw, @NonNull String name, @NonNull String phone,
			@NonNull String checkJoin, String career) {
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.checkJoin = checkJoin;
		this.career = career;
	}
	
}
