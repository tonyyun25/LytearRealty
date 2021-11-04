package com.lytear.lytear.reservation.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lytear.lytear.realEstate.bo.RealEstateBO;
import com.lytear.lytear.realEstate.model.RealEstate;
import com.lytear.lytear.reservation.dao.ReservationDAO;
import com.lytear.lytear.reservation.model.Reservation;
import com.lytear.lytear.reservation.model.ReservationDetail;
import com.lytear.sns.post.model.PostDetail;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO; 
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	public int getReserveDate(
			
			int userId
			,String userNameTest
			,String reserveDate
			,String reserveTime
			,int realEstateId
			
			) {
		
		return reservationDAO.insertReserveDate(userId, userNameTest, reserveDate, reserveTime, realEstateId);
		
	}
	
	//public List<Reservation> getReservationList(int userId) {
	public List<ReservationDetail> getReservationList(int userId) {
		
		
		//return reservationDAO.selectReservationList(userId);
		List<Reservation> reservationList = reservationDAO.selectReservationList(userId);//realEstateId에 해당하는 예약리스트는 다 불러와야 한다
		
		List<ReservationDetail> reservationDetailList = new ArrayList<>();
		
		// reservation 하나당 (해당하는) real Estate 주소 가져오기
		for(Reservation reservation : reservationList) {
			
			//List<RealEstate> realEstateList = realEstateBO.getRealEstateListByReservationId();
			List<RealEstate> realEstateList = realEstateBO.getRealEstateListByRealEstateId(realEstateId);
			
			
			
			
			// [참고] post 와 댓글이 매칭  => 두 개 값을 저장할 수 있는 클래스를 post/model 아래에 만든다 (post, 코멘트)
			/*
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setLike(isLike);
			postDetail.setLikeCount(likeCount);
			//postDetail.setUserId(userId);// PostBO에서 like 처리를 위해 userId 값 추가 
			
			postDetailList.add(postDetail);
			*/	
		}
		
		// 방문예약이 기준 (매물을 기준으로 방문예약 불러오는 게 아니라 방문예약(post 각각) 기준으로 매물(댓글)을 불러온다)
		// 방문예약 리스트를 먼저 가져오고, 반복문으로 리스트 하나씩 꺼내고
		// 거기에 들어있는 매물 id로 해당하는 매물정보를 select 해 오고
		// 그 정보를 새로 만든 detail 클래스에 set을 해 준다.
		// 방문 + 매물 객체 합쳐서 하나의 셋으로
		
		
		return reservationDetailList;
	}
	
	
	
	
}
