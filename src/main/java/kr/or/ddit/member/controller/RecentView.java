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
import kr.or.ddit.member.vo.RecentSearchVO;

/**
 * Servlet implementation class RecentView
 */
@WebServlet("/RecentView.do")
public class RecentView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 HttpSession session=request.getSession();
		 MemberVO vo=(MemberVO)session.getAttribute("loginMember");
		 String id=vo.getMem_id();
		 
		 IMemberBoardViewService sv=MemberBoardViewServiceImpl.getInstance();
		 List<RecentSearchVO>flist=sv.freeboardDate(id);
		
		 List<RecentSearchVO>objlist=sv.objectboardDate(id);
		
		 List<RecentSearchVO>oblist=sv.obboardDate(id);
		
		 List<RecentSearchVO>totalList=new ArrayList<RecentSearchVO>();
		 List<RcBoardViewVO>rcList=new ArrayList<>();
		  
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("application/json; charset=utf-8");
		 PrintWriter out=response.getWriter();
		 Gson gson=new Gson();
		 
		 if(flist!=null) {
	 for(RecentSearchVO s:flist) {
		 totalList.add(s);
		 }
		 }
		 
		 
		 if(objlist!=null) {
		 for(RecentSearchVO s:objlist) {
			 totalList.add(s);
	 }
		 }
		 if(oblist!=null) {
		 for(RecentSearchVO s:oblist) {
			 totalList.add(s);
			 s.getOb_no();
		 }
		 }
		 
		 Collections.sort(totalList);
		 
		 System.out.println(totalList);
		 if(totalList.size()>=3) {
			 for(int i=0;i<3;i++) {
				 if(totalList.get(i).getFree_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.fboard(para));
				 }
				 if(totalList.get(i).getOb_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getOb_no()));
					 
					 rcList.add(sv.obboard(para));
					 
				 }
				 if(totalList.get(i).getObject_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getObject_no()));
					 rcList.add(sv.objboard(para));
				 }
			 }
		 }else {
			 if(totalList!=null) {
			 for(int i=0;i<totalList.size();i++) {
				 if(totalList.get(i).getFree_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.fboard(para));
				 }
				 if(totalList.get(i).getOb_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.obboard(para));
				 }
				 if(totalList.get(i).getObject_no()!=0) {
				//	 System.out.println(totalList.get(i).getObject_no());
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.objboard(para));
				 }
			 }
		 }else {
			 
		 }
		 }
	//	 System.out.println(rcList);
			String result=gson.toJson(rcList);
			out.println(result);
			out.flush();
		
		 
		 
		 
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 
		
		 String id=request.getParameter("id");
		 
		 IMemberBoardViewService sv=MemberBoardViewServiceImpl.getInstance();
		 List<RecentSearchVO>flist=sv.freeboardDate(id);
		
		 List<RecentSearchVO>objlist=sv.objectboardDate(id);
		
		 List<RecentSearchVO>oblist=sv.obboardDate(id);
		
		 List<RecentSearchVO>totalList=new ArrayList<RecentSearchVO>();
		 List<RcBoardViewVO>rcList=new ArrayList<>();
		  
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("application/json; charset=utf-8");
		 PrintWriter out=response.getWriter();
		 Gson gson=new Gson();
		 
		 if(flist!=null) {
	 for(RecentSearchVO s:flist) {
		 totalList.add(s);
		 }
		 }
		 
		 
		 if(objlist!=null) {
		 for(RecentSearchVO s:objlist) {
			 totalList.add(s);
	 }
		 }
		 if(oblist!=null) {
		 for(RecentSearchVO s:oblist) {
			 totalList.add(s);
			 s.getOb_no();
		 }
		 }
		 
		 Collections.sort(totalList);
		 
		 System.out.println(totalList);
		 if(totalList.size()>=3) {
			 for(int i=0;i<3;i++) {
				 if(totalList.get(i).getFree_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.fboard(para));
				 }
				 if(totalList.get(i).getOb_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getOb_no()));
					 
					 rcList.add(sv.obboard(para));
					 
				 }
				 if(totalList.get(i).getObject_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getObject_no()));
					 rcList.add(sv.objboard(para));
				 }
			 }
		 }else {
			 if(totalList!=null) {
			 for(int i=0;i<totalList.size();i++) {
				 if(totalList.get(i).getFree_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.fboard(para));
				 }
				 if(totalList.get(i).getOb_no()!=0) {
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.obboard(para));
				 }
				 if(totalList.get(i).getObject_no()!=0) {
					 System.out.println(totalList.get(i).getObject_no());
					 Map<String,String> para=new HashMap<>();
					 para.put("mem_id", id);
					 para.put("num",String.valueOf(totalList.get(i).getFree_no()));
					 rcList.add(sv.objboard(para));
				 }
			 }
		 }else {
			 
		 }
		 }
		 System.out.println(rcList);
			String result=gson.toJson(rcList);
			out.println(result);
			out.flush();
	}

}
