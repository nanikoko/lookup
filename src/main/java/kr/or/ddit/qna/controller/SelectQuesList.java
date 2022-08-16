package kr.or.ddit.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.qna.service.IQuesService;
import kr.or.ddit.qna.service.QuesServiceImpl;
import kr.or.ddit.qna.vo.QuestionVO;

@WebServlet("/selectQuesList.do")
public class SelectQuesList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectQuesList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("id");
		String status=request.getParameter("status");
		
		IQuesService service = QuesServiceImpl.getInstance();
		
		List<QuestionVO> list = null;
		if(status.equals("M")) {
			list = service.selectQuesList2();
		}else {
			list = service.selectQuesList(mem_id);
		}
		
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String room_no = request.getParameter("room_no");
		//System.out.println(room_no);
		
		IQuesService service = QuesServiceImpl.getInstance();
		List<QuestionVO> list = service.quesDatail(room_no);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}

}
