package dao;

import java.sql.SQLException;
import java.util.Map;

import common.MyBatisDao;

public class MemberDaoImpl extends MyBatisDao implements IMemberDao {

	//dao객체 생성하기 - 싱글톤 방식으로
	private static IMemberDao dao;
	//1. private constructor
	private MemberDaoImpl () {}
	
	//2. static method
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
	
	@Override
	public String loginChk(Map<String, Object> map) throws SQLException {
		
		return selectOne("member.loginChk",map);
	}

}
