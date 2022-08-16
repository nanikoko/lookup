package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.dao.FreeBoardDaoImpl;
import kr.or.ddit.board.dao.IFreeBoardDao;
import kr.or.ddit.board.vo.FreeComment2VO;
import kr.or.ddit.board.vo.FreeCommentVO;
import kr.or.ddit.board.vo.FreeboardDetailVO;
import kr.or.ddit.board.vo.FreeboardListVO;
import kr.or.ddit.board.vo.ObssVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class FreeBoardServiceImpl implements IFreeBoardService{
	 private static IFreeBoardService service;
	 private IFreeBoardDao dao;
	 private FreeBoardServiceImpl() {
		 dao=FreeBoardDaoImpl.getInstance();
	 }
	 public static IFreeBoardService getInstance() {
		 if(service==null)service=new FreeBoardServiceImpl();
		 return service;
	 }
	@Override
	public Map<String, Object> getPageInfo(int page, String type, String word) {
		Map<String, Object> map=new HashMap<>();
		//한페이지당 출력할 글 갯수
		int perlist=2;
		
		//한 화면에 출력할 페이지 갯수:
		int perpage=3;
		
		
		Map<String,String>paramap=new HashMap<>();
		paramap.put("stype",type);
		paramap.put("sword",word);
		
		//전체 글갯 수
		int count=this.totalCount(paramap);
		
		//전체페이지 수
		int totalPage=(int)Math.ceil(count/(double)perlist);
		
		//start //end
		int start=(page-1)*perlist+1;
		int end=start+perlist-1;
		if(end>count) {
			end=count;
		}
		
		//startPage,endPage구하기
		//page 1=>1
		//page 2=>1
		//page 3=>3
		//page 4=>3
		//.....
		//page 7=>7 8
		
		int startPage=((page-1)/perpage*perpage)+1;
		int endPage=startPage+perpage-1;
		
		
		if(endPage>totalPage)endPage=totalPage;
		map.put("startpage",startPage);
		map.put("endpage",endPage);
		map.put("start",start);
		map.put("end", end);
		map.put("totalPage", totalPage);
		return map;
	}

	
	@Override
	public int totalCount(Map<String, String> map) {
		int cnt=0;
		      try {
				cnt=dao.totalCount(map);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return cnt;
	}
	@Override
	public List<FreeboardListVO> selectList(Map<String, Object> map) {
		List<FreeboardListVO>list=null;
		   try {
			list=dao.selectList(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public FreeboardDetailVO fdetail(String id) {
		FreeboardDetailVO vo=null;
		    try {
				vo=dao.fdetail(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return vo;
	}
	@Override
	public int fbcount(String id) {
		int cnt=0;
		try {
			cnt=dao.fbcount(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<FreeCommentVO> fcvlist(String id) {
		List<FreeCommentVO>list=null;
		try {
			list=dao.fcvlist(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int freecr(Map<String, String> para) {
		int cnt=0;
		try {
			cnt=dao.freecr(para);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public void fc2in(Map<String, String> para) {
		   try {
			dao.fc2in(para);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public int fec2cnt(String comment_no) {
		int cnt=0;
		try {
			cnt=dao.fec2cnt(comment_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<FreeComment2VO> fc2list(int comment_no) {
		List<FreeComment2VO>list=null;;
		try {
			list=dao.fc2list(comment_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public int freecomentin(Map<String, String> para) {
		int cnt=0;
		   try {
			cnt=dao.freecomentin(para);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<ObssVO> oblist(String id) {
		List<ObssVO>list=null;
		try {
			list=dao.oblist(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
