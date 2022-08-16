package kr.or.ddit.qna.service;

import java.util.List;

import kr.or.ddit.qna.vo.QuestionVO;

public interface IQuesService {
	
	public List<QuestionVO> selectQuesList(String id);
	
	public List<QuestionVO> selectQuesList2();
	
	public List<QuestionVO> quesDatail(String no);
	
	public int quesDelete(int no);
	
	public int answerInsert(QuestionVO vo);
	
	public int quesInsert(QuestionVO vo);
	
	
	public int seqInsert(QuestionVO vo);

}
