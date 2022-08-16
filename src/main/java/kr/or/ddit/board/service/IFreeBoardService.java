package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.FreeComment2VO;
import kr.or.ddit.board.vo.FreeCommentVO;
import kr.or.ddit.board.vo.FreeboardDetailVO;
import kr.or.ddit.board.vo.FreeboardListVO;
import kr.or.ddit.board.vo.ObssVO;

public interface IFreeBoardService {

	public Map<String, Object> getPageInfo(int rqpage, String rqtype, String rqsord);
	
	public int totalCount(Map<String,String>map);
	
	public List<FreeboardListVO> selectList(Map<String, Object> map);
	
	public FreeboardDetailVO fdetail(String id);
	
	public int fbcount(String id);
	
	public List<FreeCommentVO> fcvlist(String id);
	
	public int freecomentin(Map<String, String> para);
	
	public int freecr(Map<String, String> para);
	
	public void fc2in(Map<String, String> para);

	public int fec2cnt(String comment_no);

	public List<FreeComment2VO> fc2list(int comment_no);

	public List<ObssVO> oblist(String id);

}
