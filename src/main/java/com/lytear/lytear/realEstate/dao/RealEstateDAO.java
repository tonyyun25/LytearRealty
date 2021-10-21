package com.lytear.lytear.realEstate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lytear.lytear.realEstate.model.RealEstate;

@Repository
public interface RealEstateDAO {

	public int insertList(
			
			@Param("userId") int userId
			,@Param("userNameTest") String userNameTest
			,@Param("imagePath") String imagePath
			,@Param("memberType") String memberType
			// memberType을 int로 할지 전혀 정의되지 않은 상황이기 때문에 그대로 받으면 String이 된다
			
			,@Param("type") String type 
			,@Param("address") String address 
			,@Param("space") double space 
			,@Param("price") int price 
			,@Param("downPayment") int downPayment 
			,@Param("rent") int rent 
			,@Param("complexNumber") int complexNumber 
			,@Param("housingUnitNumber") int housingUnitNumber 
			,@Param("residence") String residence 
			,@Param("moveInDate") String moveInDate 
			,@Param("option") String option 
			,@Param("others") String others 
			,@Param("startDate") String startDate
			,@Param("endDate") String endDate 
			
			
			);
	
	public List<RealEstate> selectRealEstateList();
	
	
}
