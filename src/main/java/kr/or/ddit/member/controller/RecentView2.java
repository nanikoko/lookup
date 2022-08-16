package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberBoardViewService;
import kr.or.ddit.member.service.MemberBoardViewServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.RcBoardViewVO;
import kr.or.ddit.member.vo.RcBoardViewVO2;
import kr.or.ddit.member.vo.RecentSearchVO;
import kr.or.ddit.member.vo.RecentSearchVO2;

/**
 * Servlet implementation class RecentView2
 */
@WebServlet("/RecentView2.do")
public class RecentView2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 HttpSession session=request.getSession();
		 MemberVO vo=(MemberVO)session.getAttribute("loginMember");
		 String id=vo.getMem_id();
		// System.out.println(id);
		 //String id=requst.getParameter("id");
		 IMemberBoardViewService sv=MemberBoardViewServiceImpl.getInstance();
		
		 List<RecentSearchVO2>fclist=sv.freecommentdDate(id); 
		
		 List<RecentSearchVO2>objclist=sv.objectcommentDate(id);
		
		
		 
		 List<RecentSearchVO2>totalList=new ArrayList<RecentSearchVO2>();
		 List<RcBoardViewVO2>rcList=new ArrayList<>();
		  
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("application/json; charset=utf-8");
		 PrintWriter out=response.getWriter();
		 Gson gson=new Gson();
		 
		 if(fclist!=null) {
	 for(RecentSearchVO2 s:fclist) {
		 totalList.add(s);
		 }
		 }
		 
		 
		 if(objclist!=null) {
		 for(RecentSearchVO2 s:objclist) {
			 totalList.add(s);
	 }
		 }
		 
		 
		 Collections.sort(totalList);
		 
		 System.out.println(totalList);
		 if(totalList.size()>=3) {
			 for(int i=0;i<3;i++) {
				 if(totalList.get(i).getFree_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getComment_no()));
					 rcList.add(sv.fcboard(para));
				 }
				
				 if(totalList.get(i).getObject_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getComment_no()));
					 rcList.add(sv.objcboard(para));
				 }
			 }
		 }else {
			 if(totalList!=null) {
			 for(int i=0;i<totalList.size();i++) {
				 if(totalList.get(i).getFree_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getComment_no()));
					 rcList.add(sv.fcboard(para));
				 }
				
				 if(totalList.get(i).getObject_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getComment_no()));
					 rcList.add(sv.objcboard(para));
				 }
			 }
		 }else {
			 
		 }
		 }
		// System.out.println(rcList);
			String result=gson.toJson(rcList);
			out.println(result);
			out.flush();
		
		 
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
