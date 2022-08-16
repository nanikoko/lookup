package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.LikeScheduleVO;

public class LikeDaoImpl implements ILikeDao{
	private static ILikeDao dao;
	private SqlMapClient smc;
	private LikeDaoImpl() {
		smc=SqlMapClientFactory.getSqlMapClient();
	}
	public static ILikeDao getInstance() {
		if(dao==null)dao=new LikeDaoImpl();
		return dao;
	}
	@Override
	public List<LikeScheduleVO> likeList(String id) throws SQLException {
		
		return smc.queryForList("like.likeList",id);
	}
}
