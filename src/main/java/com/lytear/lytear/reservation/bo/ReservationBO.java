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
//			List<RealEstate> realEstateList = realEstateBO.getRealEstateListByRealEstateId(reservation.getRealEstateId());
			
//			List<RealEstate> realEstateList = realEstateBO.getRealEstateListByReservationId(reservation.getId());  
			
			RealEstate realEstate = realEstateBO.getRealEstateByReservationId(reservation.getId());  
			
			
			//<= reservation에 해당하는 매물은 딱 하나니까 List<RealEstate>가 아니라 RealEstate 객체 자체로 만들자.예약정보 안의 매물정보(이미 들어있다)를 통해서 가져와야 해
			// 매물 하나에 예약 정보 여러개면 저장할 방법이 없어. 이 예약 상태의 매물은 뭐다. reser/id로 매물 table select 해 오면 된다. 두 개를 묶어 하나의 데이터를 만들면 된다
			
			
//			[참고] SNS
//			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId()); 
			
			
			ReservationDetail reservationDetail = new ReservationDetail();
			reservationDetail.setReservation(reservation);
			reservationDetail.setRealEstate(realEstate);
			
			reservationDetailList.add(reservationDetail);
			
//			public RealEstate getRealEstate() {
//				return realEstate;
//			}
//			public void setRealEstate(RealEstate realEstate) {
//				this.realEstate = realEstate;
//			}
			
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
