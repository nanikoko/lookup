package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public class MemberDaoImpl implements IMemberDao{
	private static IMemberDao dao;
	private SqlMapClient smc;
	private MemberDaoImpl() {
		smc=SqlMapClientFactory.getSqlMapClient();
	}
	public static IMemberDao getInstance() {
		if(dao==null)dao=new MemberDaoImpl();
		return dao;
	}

	@Override
	public int memberIdCheck(String id) throws SQLException {
		
		return (int)smc.queryForObject("member.memberIdCheck",id);
	}
	@Override
	public List<ZipVO> zipList(String s) throws SQLException {
		
		return smc.queryForList("zip.zipList",s);
	}
	@Override
	public int insertMember(MemberVO vo) throws SQLException {
		int cnt=0;
		    if(smc.insert("member.insertMember",vo)==null) {
		    	cnt=1;
		    }
		return cnt;
	}
	@Override
	public int memlogin(Map<String, String> info) throws SQLException {
		
		return (int)smc.queryForObject("member.memlogin",info);
	}
	@Override
	public int logidCheck(String id) throws SQLException {
		// TODO Auto-generated method stub
		return (int)smc.queryForObject("member.logidCheck",id);
		
	}
	@Override
	public MemberVO memberIdSearch(String id) throws SQLException {
		// TODO Auto-generated method stub
		return (MemberVO)smc.queryForObject("member.memberIdSearch",id);
	}
	@Override
	public String memStatus(String memid) throws SQLException {
		// TODO Auto-generated method stub
		return (String)smc.queryForObject("member.memStatus",memid);
	}
	@Override
	public List<ZipVO> zipAllSearch() throws SQLException {
		
		return smc.queryForList("zip.zipAllSearch");
	}
	@Override
	public int updateMember(MemberVO memVo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("member.updateMember",memVo);
	}
	@Override
	public int nomalinsertMember(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("member.nomalinsertMember",memId);
	}
	@Override
	public void loginlogCreate(Map<String, String> map) throws SQLException {
		smc.insert("member.loginlogCreate",map);
		
	}
	@Override
	public int memStatusBUpdate(String id) throws SQLException{
	        
		return smc.update("member.memStatusBUpdate",id);
	}
	@Override
	public MemberVO login(Map<String, String> para) throws SQLException {
		
		return (MemberVO)smc.queryForObject("member.login",para);
	}
	@Override
	public int memstop(String id) throws SQLException {
		
		return smc.update("member.memstop",id);
	}

	

}
