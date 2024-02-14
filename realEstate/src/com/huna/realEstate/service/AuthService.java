package com.huna.realEstate.service;

import com.huna.realEstate.dto.request.CheckIdRequestDto;
import com.huna.realEstate.dto.request.SendCodeRequestDto;
import com.huna.realEstate.dto.response.CheckIdResponseDto;
import com.huna.realEstate.dto.response.SendCodeResponseDto;

public interface AuthService {
	CheckIdResponseDto checkId(CheckIdRequestDto dto);
	SendCodeResponseDto sendCode(SendCodeRequestDto dto);
}



