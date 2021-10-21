package com.lytear.lytear.realEstate.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lytear.lytear.common.FileManagerService;
import com.lytear.lytear.realEstate.dao.RealEstateDAO;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	
	
	public int addList(
			int userId
			,String userNameTest
			,MultipartFile file
			,String memberType
			,String type
			,String address
			,double space
			,int price
			,int downPayment
			,int rent
			,int complexNumber
			,int housingUnitNumber 
			,String residence
			,String moveInDate
			,String option
			,String others
			,String startDate
			,String endDate
			
			
			
			) {
		String imagePath = FileManagerService.saveFile(userId, file);
		
		if(imagePath == null) {
			return -1;
		}
		
		return realEstateDAO.insertList(userId, userNameTest, imagePath, memberType, type, address, space, price, downPayment, rent, complexNumber, housingUnitNumber, residence, moveInDate, option, others, startDate, endDate);
	}
	
	
}
