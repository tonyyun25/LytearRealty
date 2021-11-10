package com.lytear.lytear.generalUser.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lytear.lytear.generalUser.model.GeneralUser;

@Repository
public interface GeneralUserDAO {

	
	
	public int insertUser(
			@Param("loginId") String loginId 
			, @Param("password") String password
			, @Param("email") String email
			, @Param("name") String name
			, @Param("mobile") String mobile
			
			);
	
	public int selectCountByID(@Param("loginId") String loginId );
	
	
	public GeneralUser selectUser(
			@Param("loginId") String loginId 
			, @Param("password") String password
			
			);
	
	
	
	
}
