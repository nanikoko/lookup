package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class BlockMemberDaoImpl implements IBlockMemberDao{
	private static IBlockMemberDao dao;
	private SqlMapClient smc;
	private BlockMemberDaoImpl() {
		smc=SqlMapClientFactory.getSqlMapClient();
	}
	public static IBlockMemberDao getInstance() {
		if(dao==null)dao=new BlockMemberDaoImpl();
		return dao;
	}
	@Override
	public List<String> blacklist(String id) throws SQLException {
		
		return smc.queryForList("black.blacklist",id);
	}
	@Override
	public int blockCancele(Map<String, String> para) throws SQLException {
		
		return smc.delete("black.blockCancele",para);
	}
	

}
