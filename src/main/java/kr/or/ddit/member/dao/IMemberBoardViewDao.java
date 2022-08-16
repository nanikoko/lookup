package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.RcBoardViewVO;
import kr.or.ddit.member.vo.RcBoardViewVO2;
import kr.or.ddit.member.vo.RecentSearchVO;
import kr.or.ddit.member.vo.RecentSearchVO2;

public interface IMemberBoardViewDao {
	public List<RecentSearchVO> freeboardDate(String memid) throws SQLException;
	public List<RecentSearchVO> objectboardDate(String memid) throws SQLException;
	public List<RecentSearchVO> obboardDate(String memid) throws SQLException;
	public String search(String s)throws SQLException;
	public RcBoardViewVO fboard(Map<String, String> para) throws SQLException;
	public RcBoardViewVO objboard(Map<String, String> para) throws SQLException; 
	public RcBoardViewVO obboard(Map<String, String> para) throws SQLException;
	public List<RecentSearchVO2> freecommentdDate(String id)throws SQLException;
	public List<RecentSearchVO2> objectcommentDate(String id)throws SQLException;
	public RcBoardViewVO2 fcboard(Map<String, String> para)throws SQLException;
	public RcBoardViewVO2 objcboard(Map<String, String> para)throws SQLException; 
}
