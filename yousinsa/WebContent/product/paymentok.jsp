<%@page import="java.util.ArrayList"%><%@page import="bean.CartVO"%><%@page import="bean.CartDAO"%><%@page import="java.util.Date"%><%@page import="bean.PaymentDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
    
    boolean pResult = false;	//payment테이블 insert 결과
    boolean cResult = false;	//cart테이블 update 결과
    boolean result = false;		//최종 결과
    String userId = request.getParameter("user_id");
    String destination1 = request.getParameter("destination1");	//우편번호
    String destination2 = request.getParameter("destination2");	//도로명주소
    String destination3 = request.getParameter("destination3");	//상세주소
    //주소 공백 제거
    destination1 = destination1.replaceAll("\\s", "");
    destination2 = destination2.replaceAll("\\s", "");
    destination3 = destination3.replaceAll("\\s", "");
  	//결제할 목록 불러오기
    CartDAO dao = new CartDAO();
    CartVO vo = new CartVO();
    ArrayList<CartVO> list = (ArrayList<CartVO>) dao.getUserCart(userId);
    int itemCount = list.size();
    //업데이트할 cart_id구하기
    String cIdList[] = new String[itemCount];
    for(int i = 0; i < itemCount; i++){
    	cIdList[i] = String.valueOf(list.get(i).getCart_id());
    }
    String date = request.getParameter("date");	//결제일
    int price = Integer.parseInt(request.getParameter("price"));//결제 총 금액
    PaymentDAO pDao = new PaymentDAO();
    //결제ID생성 : 결제일 + 첫번째 상품아이디
    String paymentId = date + "-" +  cIdList[0];
    pResult = pDao.addPayment(paymentId, userId, price, date, destination1+" "+destination2+" "+destination3);
    CartDAO cDao = new CartDAO();
    for(int i = 0; i < cIdList.length; i++){
    	cResult = cDao.updatePaymentID(Integer.parseInt(cIdList[i]), paymentId);
    }
    result = pResult & cResult;
    %><%=result%>