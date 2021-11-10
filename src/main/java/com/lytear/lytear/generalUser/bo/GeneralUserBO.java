package com.lytear.lytear.generalUser.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lytear.lytear.common.EncryptUtils;
import com.lytear.lytear.generalUser.dao.GeneralUserDAO;
import com.lytear.lytear.generalUser.model.GeneralUser;

@Service
public class GeneralUserBO {

	@Autowired
	private GeneralUserDAO generalUserDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int addUser(String loginId, String password, String email, String name, String mobile) {
		String encryptPassword = EncryptUtils.md5(password);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUp] 암호화실패 !!!");
			return 0;
		}
		
		return generalUserDAO.insertUser(loginId, encryptPassword, email, name, mobile);
	}
	
	public boolean isDuplicateId(String loginId) {
		
		int count = generalUserDAO.selectCountByID(loginId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
	
	
	public GeneralUser getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		
		
		
		return generalUserDAO.selectUser(loginId, encryptPassword);
		
		
		
	}
	
	
}
