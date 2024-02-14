package com.huna.realEstate.repository;

import java.sql.SQLException;

// repository 의 이름은 보통 테이블의 이름과 동일하게 지음

public interface EmailAuthenticationRepository {
	
	boolean existsByEmail (String email) throws SQLException;
	
	void save(String email, String authenticationCode) throws SQLException;
	
}
