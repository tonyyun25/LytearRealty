package com.lytear.lytear.realEstate.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lytear.lytear.common.FileManagerService;
import com.lytear.lytear.realEstate.dao.RealEstateDAO;
import com.lytear.lytear.realEstate.model.RealEstate;

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
	
	public List<RealEstate> getRealEstateList(int userId) {
		List<RealEstate> realEstateList = realEstateDAO.selectRealEstateList();
		
		return realEstateList;
	}
	
	// reservation 하나당 (해당하는) real Estate 주소 가져오기
	
//	public RealEstate getRealEstateByReservationId(int reservationId){ //reservationId 변수는 없다. realEstateId를 받는지 / 매물정보를 찾고 있으니까
	public RealEstate getRealEstateByReservationId(int id){
		return realEstateDAO.selectRealEstateByRealEstateId(id);
	}
	
	
	
}
