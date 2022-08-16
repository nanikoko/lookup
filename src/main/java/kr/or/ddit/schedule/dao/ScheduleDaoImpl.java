package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.schedule.vo.ScheVO;


public class ScheduleDaoImpl implements IScheduleDao {

	private static IScheduleDao dao;
	private SqlMapClient smc;
	
	private ScheduleDaoImpl () {
		smc = SqlMapClientFactory.getSqlMapClient();
	};
	
	public static IScheduleDao getInstance() {
		if(dao == null) dao = new ScheduleDaoImpl();
		return dao;
	}
	
	
	
	@Override
	public String insertSchedule(ScheVO vo) throws SQLException {
		return (String)smc.insert("schedule.insertSchedule", vo);
	}

	@Override
	public List<ScheVO> allSchedule() throws SQLException {
		return smc.queryForList("schedule.allSchedule");
	}

	@Override
	public List<ScheVO> allMemSchedule(ScheVO vo) throws SQLException {
		return smc.queryForList("schedule.allMemSchedule", vo);
	}
	
	@Override
	public String addMemSchedule(ScheVO vo) throws SQLException {
		return (String)smc.insert("schedule.addMemSchedule", vo);
	}
	
	@Override
	public int deleteSchedule(ScheVO vo) throws SQLException {
		return smc.delete("schedule.deleteSchedule", vo);
	}

	@Override
	public int updateSchedule(ScheVO vo) throws SQLException {
		return smc.update("schedule.updateSchedule", vo);
	}

	@Override
	public String insertMemSchedule(ScheVO vo) throws SQLException {
		return (String)smc.insert("schedule.insertMemSchedule", vo);
	}

	@Override
	public String insertMemSchedule2(ScheVO vo) throws SQLException {
		return (String)smc.insert("schedule.insertMemSchedule2", vo);
	}
	
	@Override
	public int deleteMemSchedule(ScheVO vo) throws SQLException {
		return smc.delete("schedule.deleteMemSchedule", vo);
	}

	@Override
	public int updateMemSchedule(ScheVO vo) throws SQLException {
		return smc.update("schedule.updateMemSchedule", vo);
	}




	

}
