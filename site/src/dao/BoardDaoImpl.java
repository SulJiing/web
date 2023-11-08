package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import common.MyBatisDao;
import vo.BoardVO;

public class BoardDaoImpl extends MyBatisDao implements IBoardDao {

	private static IBoardDao dao;
	// 서비스에서 사용한 dao객체 생성하기 - 싱글톤 방식
	// 1. private constructor
	// 2. static method
	private BoardDaoImpl() {
	}
	public static IBoardDao getInstance() {
		if(dao==null) dao = new BoardDaoImpl();
		return dao;
	}
	
	@Override
	public int countList() throws SQLException {
		return selectOne("brd.countList");
	}
	@Override
	public List<BoardVO> boardList(Map<String, Object> map) {
		return selectList("brd.boardList",map);
	}
}
