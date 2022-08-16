package kr.or.ddit.qna.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.qna.vo.QuestionVO;

public interface IQuesDao {
	
	public List<QuestionVO> selectQuesList(String id) throws SQLException;
	
	public List<QuestionVO> selectQuesList2() throws SQLException;
	
	public List<QuestionVO> quesDatail(String no) throws SQLException;
	
	public int quesDelete(int no) throws SQLException;
	
	public int answerInsert(QuestionVO vo) throws SQLException;
	
	public int quesInsert(QuestionVO vo) throws SQLException;
	
	
	public int seqInsert(QuestionVO vo) throws SQLException;
}
