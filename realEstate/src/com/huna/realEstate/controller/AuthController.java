package com.huna.realEstate.controller;

import com.huna.realEstate.dto.request.CheckIdRequestDto;
import com.huna.realEstate.dto.request.SendCodeRequestDto;
import com.huna.realEstate.dto.response.CheckIdResponseDto;
import com.huna.realEstate.dto.response.SendCodeResponseDto;

// 입고와 출고의 개념
public interface AuthController {
	CheckIdResponseDto checkId(CheckIdRequestDto request);
	SendCodeResponseDto sendCode(SendCodeRequestDto request);
}
