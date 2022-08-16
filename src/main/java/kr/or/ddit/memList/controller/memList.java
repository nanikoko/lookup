package kr.or.ddit.memList.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.memList.service.IMemListService;
import kr.or.ddit.memList.service.MemListServiceImpl;
import kr.or.ddit.memList.vo.MemListVO;

@WebServlet("/memList.do")
public class memList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMemListService service = MemListServiceImpl.getInstance();
		
		List<MemListVO> list = service.selectMemList();
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
