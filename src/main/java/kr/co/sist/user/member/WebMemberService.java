package kr.co.sist.user.member;

import java.sql.SQLException;

public class WebMemberService {
	
	private static WebMemberService wmService;
	
	private WebMemberService() {
		//생성자 잠금
	}
	
	/**
	 * 서비스도 싱글톤 패턴 적용
	 * @return
	 */
	public static WebMemberService getInstance() {
		if(wmService==null) {
			wmService=new WebMemberService();
			
		}//end if
		
		return wmService;
	}//getInstance
	
	public boolean searchId(String id) {
		boolean flag=false;
		
		WebMemberDAO wmDAO = WebMemberDAO.getInstance();
		
		try {
			flag=wmDAO.selectId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//searchId
	

}//class
