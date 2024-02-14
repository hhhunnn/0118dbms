package com.huna.realEstate.controller.implement;

import com.huna.realEstate.controller.AuthController;
import com.huna.realEstate.dto.request.CheckIdRequestDto;
import com.huna.realEstate.dto.request.SendCodeRequestDto;
import com.huna.realEstate.dto.response.CheckIdResponseDto;
import com.huna.realEstate.dto.response.SendCodeResponseDto;
import com.huna.realEstate.interfaces.Code;
import com.huna.realEstate.service.AuthService;
import com.huna.realEstate.service.implement.AuthServiceImplement;

public class AuthControllerImplement implements AuthController {

//	private AuthService authService = new AuthServiceImplement();
//	solid 원칙 지키위해서는 원래 위에 있는 거 대신 이렇게 만들어 줘야함
	private AuthService authService;
	
	public AuthControllerImplement(AuthService authService) {
		this.authService = authService;
	}
	
	@Override
	public CheckIdResponseDto checkId(CheckIdRequestDto request) {
		
		boolean validId = request.validId();
		if (!validId) return new CheckIdResponseDto(Code.VF, null);
		
		CheckIdResponseDto response = authService.checkId(request);
		return response;
	}
	
	@Override
	public SendCodeResponseDto sendCode (SendCodeRequestDto request) {
		boolean valid = request.validEmail();
		if(!valid) return new SendCodeResponseDto(Code.VF, null);
		
		SendCodeResponseDto response = authService.sendCode(request);
		return response;
	}

}
