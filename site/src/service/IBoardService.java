package service;

import java.util.List;
import java.util.Map;

import vo.BoardVO;

public interface IBoardService {
	
	// 전체 글 갯수 조회
	public int countList();

	// 범위별 게시글 조회
	public List<BoardVO> boardList(Map<String, Object> map);
}
