package dao;

import java.sql.SQLException;
import java.util.Map;

public interface IMemberDao {

	//로그인 id-pw 검증
	public String loginChk(Map<String, Object> map) throws SQLException;
}
