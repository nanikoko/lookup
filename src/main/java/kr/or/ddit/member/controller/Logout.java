package kr.or.ddit.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout.do")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
         Date n=new Date();
           String end=sdf1.format(n);
		HttpSession session=request.getSession();
		String start=String.valueOf(session.getAttribute("start"));
		   int time=0;
		try {
			Date s=sdf1.parse(start);
			Date e=sdf1.parse(end);
			time=(int)((e.getTime()-s.getTime())/1000);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MemberVO mem=(MemberVO)session.getAttribute("loginMember");
		Map<String,String>para=new HashMap<>();
		para.put("mem_id",mem.getMem_id());
		para.put("time",String.valueOf(time));
	//	System.out.println(time);
		IMemberService sv=MemberServiceImpl.getInstance();
		sv.loginlogCreate(para);
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/main/main.jsp");	
	}

}
