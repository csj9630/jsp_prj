package kr.co.sist.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class WebMemberDAO {
	private static WebMemberDAO wmDAO;
	
	private WebMemberDAO() {
		//생성자 잠금
	}//WebMemerDAO

	public static WebMemberDAO getInstance() {
		if(wmDAO==null) {
			wmDAO=new WebMemberDAO();
			
		}//end if
		
		return wmDAO;
	}//getInstance
	
	public boolean selectId(String id) throws SQLException{
		boolean resultFlag = false;
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			//1.JNDI 사용객체 생성
			//2.DataSource 얻기
			//3.DataSource에서 Connection 얻기
			con = dbCon.getConn();
			
			//4.쿼리문 생성객체 얻기
			String selectId = " select id from web_member where id=?";
			pstmt = con.prepareStatement(selectId);
			//5.바인드 변수 값 설정
			pstmt.setString(1, id);
			//6.쿼리문 수행 후 결과 얻기
			
			rs=pstmt.executeQuery();
			resultFlag = !rs.next(); //아이디 존재 유무로 true, false 확인
			//아이디가 존재하면 사용 불가이므로 not 추가.
		}finally {
			//7.연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return resultFlag;
	}//selectId
	
}//class
