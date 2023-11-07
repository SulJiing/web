package service;

import java.sql.SQLException;
import java.util.Map;

import dao.IMemberDao;
import dao.MemberDaoImpl;

public class MemberServiceImpl implements IMemberService {

	private IMemberDao dao;
	private static IMemberService service;
	//1
	private MemberServiceImpl() {
		 dao = MemberDaoImpl.getInstance();
	}
	//2
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public String loginChk(Map<String, Object> map) {
	
		//dao가 넘겨주는 자료를 받아서 controller로 넘겨줘야 함..
		String memId = "";
		try {
			memId = dao.loginChk(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memId;
	}
}
