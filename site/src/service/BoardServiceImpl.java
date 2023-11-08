package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.BoardDaoImpl;
import dao.IBoardDao;
import vo.BoardVO;

public class BoardServiceImpl implements IBoardService {

	private IBoardDao dao;
	private static IBoardService service;
	// 1.
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	// 2.
	public static IBoardService getInstance() {
		if(service==null) service = new BoardServiceImpl();
		return service;
	}
	
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = dao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	@Override
	public List<BoardVO> boardList(Map<String, Object> map) {
		List<BoardVO> list = null;
		try {
			list = dao.boardList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
