package com.huna.realEstate.dto.request;

public class CheckIdRequestDto {

	private String id;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public boolean validId() {
		boolean valid = id.length() <= 20;
		return valid;
	}
	
	
	// 필드에 값 넣는 방법 1. 생성자, 2. set, 3. 선언할 때 바로 값 넣기
	
}
