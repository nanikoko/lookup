package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.ZipVO;

/**
 * Servlet implementation class Zipsearch
 */
@WebServlet("/Zipsearch.do")
public class Zipsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전송데이터받기
				String dong=request.getParameter("dong");
				//service객체 생성하기
				IMemberService service=MemberServiceImpl.getInstance();
				//service메소드 호출하여 결과값 얻기
				List<ZipVO>list=service.zipList(dong);
				//Gson객체 생성
				Gson gson=new Gson();
				String result=gson.toJson(list);
				
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out=response.getWriter();
				
				out.print(result);
	}

}
