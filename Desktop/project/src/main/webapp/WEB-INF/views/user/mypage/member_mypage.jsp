<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<link href="<%=request.getContextPath() %>/resources/mypage/css/mypage_main.css?ver=1" rel="stylesheet"/>
<%@include file="../header.jspf"%>
</head>
<body>
<%@include file="../top.jspf"%>

<!-- middle 시작 -->
<div class="middle_mypage_div">
	<div class="mypage_div">
		<div class="member_info_div">
			<div class="mypage_title">My Page</div>
			<div class="photo_div"><i id="member_icon" class="fa-solid fa-circle-user"></i></div>
			<div class="member_id_div">${sessionScope.signIn.mem_id}님</div>
			<div class="member_modify_div">
				<input type="button" class="member_pw_btn" onclick="location.href='./member_pw_modify'" value="비밀번호변경">
				<input type="button" class="member_modify_btn" onclick="location.href='./member_info_modify'" value="회원정보수정">
				<input type="button" class="member_delete_btn" onclick="location.href='./memberDelete'" value="회원탈퇴">
			</div>
		</div>
        
        <div class="recent_order_history_div">
        	<div class="recent_order_history_title">최근 주문내역</div>
        	<div class="product_photo_div">상품사진</div>
        	<div class="product_content_div">상품내용</div>
        	<div class="product_buttons_div">
        		<input type="button" class="review_btn" value="리뷰쓰기">
        		<input type="button" class="delivery_btn" value="배송조회">
        		<input type="button" class="cancel_refund_btn" value="취소/환불">
        	</div>
        </div>
        
        <div class="coupon_history_div">
        	<div class="coupon_history_title">나의 쿠폰</div>
	        <div class="coupon_content_div">나의 쿠폰 내용</div>
		</div>

		
        <div class="qna_history_div">
       		<div class="qna_history_title">나의 문의 내역 (1:1 상담)</div>
        	<div class="qna_content_div">나의 문의 내역 (1:1 상담) 내용</div>
		</div>
		
		<div class="review_history_div">
       		<div class="review_history_title" style="display: flex;">
       			<div>나의 리뷰 내역</div>
       			<div style="margin-left: auto;"><button id="more">더보기</button></div>
       		</div> 
       		<div class="review_histoy_content">
        	<table id="review_table">
        	<tr>
				<th id="product">상품이름</th>
				<th id="title">제목</th>
				<th id="date">등록일</th>
				<th id="rating">평점</th>
			</tr>	
				<c:forEach items="${reviews }" var="review">
				<tr>
					<td>${review.product_name }</td>
					<td id="review_content"><a href="<%=request.getContextPath() %>/review/detail?review_num=${review.review_num}">
					${review.review_content }</a></td>
					<td>${review.creationReviewDate }</td>
					<c:if test="${review.review_rating eq 5 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 4 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 3 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 2 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 1 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		
	</div>
</div>
<!-- middle 끝 -->
<script src="<%=request.getContextPath() %>/resources/mypage/js/mypage.js"></script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../bottom.jspf"%>