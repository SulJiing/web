package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.BoradVO;

public interface IBoardDao {
	// 전체 글 갯수 조회
	public int countList() throws SQLException;
	
	// 범위별 게시글 조회
	public List<BoradVO> boardList(Map<String, Object> map) throws SQLException;
}
