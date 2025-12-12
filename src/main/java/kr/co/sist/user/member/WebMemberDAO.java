package kr.co.sist.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import day1128.ParamDTO;
import kr.co.sist.dao.DbConn;

public class WebMemberDAO {
	private static WebMemberDAO wmDAO;

	private WebMemberDAO() {
		// 생성자 잠금
	}// WebMemerDAO

	public static WebMemberDAO getInstance() {
		if (wmDAO == null) {
			wmDAO = new WebMemberDAO();

		} // end if

		return wmDAO;
	}// getInstance

	public boolean selectId(String id) throws SQLException {
		boolean resultFlag = false;

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1.JNDI 사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection 얻기
			con = dbCon.getConn();

			// 4.쿼리문 생성객체 얻기
			String selectId = " select id from web_member where id=?";
			pstmt = con.prepareStatement(selectId);
			// 5.바인드 변수 값 설정
			pstmt.setString(1, id);
			// 6.쿼리문 수행 후 결과 얻기

			rs = pstmt.executeQuery();
			resultFlag = !rs.next(); // 아이디 존재 유무로 true, false 확인
			// 아이디가 존재하면 사용 불가이므로 not 추가.
			// ㄴ 뺐음
			// ㄴ 다시 넣음
		} finally {
			// 7.연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return resultFlag;
	}// selectId

	/**
	 * 회원정보를 추가
	 * 
	 * @param pDTO
	 * @throws SQLException
	 */
	public void insertMember(ParamDTO pDTO) throws SQLException {
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			// 1.JNDI 사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection 얻기
			con = db.getConn();

			// 4.쿼리문 생성객체 얻기
			String insertMember = "insert into web_member(id,password,name,email,birth,loc,ip,intro) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(insertMember);
			// 5.바인드 변수 값 설정
			pstmt.setString(1, pDTO.getId());
			pstmt.setString(2, pDTO.getPass());
			pstmt.setString(3, pDTO.getName());
			pstmt.setString(4, pDTO.getEmail());
			pstmt.setString(5, pDTO.getBirth());
			pstmt.setString(6, pDTO.getLoc());
			pstmt.setString(7, pDTO.getIp());
			pstmt.setString(8, pDTO.getIntro());

			// 6.쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		} finally {
			// 7.연결 끊기
			db.dbClose(null, pstmt, con);
		} // end finally

	}// insertMember

	/**
	 * 회원이 선택한 언어를 추가
	 * 
	 * @param id
	 * @param lang
	 * @throws SQLException
	 */
	public void insertMemberLang(String id, String lang) throws SQLException {
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			// 1.JNDI 사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection 얻기
			con = db.getConn();

			// 4.쿼리문 생성객체 얻기
			String insertMemberLang = "insert into web_member_lang(id,lang) values(?,?)";
			pstmt = con.prepareStatement(insertMemberLang);
			// 5.바인드 변수 값 설정
			pstmt.setString(1, id);
			pstmt.setString(2, lang);
			// 6.쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		} finally {
			// 7.연결 끊기
			db.dbClose(null, pstmt, con);
		} // end finnaly
	}// insertMember

	/**
	 * 마이페이지에서 사용될 회원 정보를 조회한다..
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public ParamDTO selectMember(String id) throws SQLException {
		ParamDTO pDTO = null;

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

//		1. JNDI 사용객체 생성
//		2 DataSource 얻기
//		3. connection 얻기
			con = dbCon.getConn();
//		4. 쿼리문 생성 객체 얻기
			String selectMember = new String();
			selectMember = "select name, email, birth, input_date, ip, intro, profile, loc " + " from web_member "
					+ " where id = ? ";

			pstmt = con.prepareStatement(selectMember);
//		5. 바인드변수값 설정
			pstmt.setString(1, id);

//		6. 조회 결과 얻기

			rs = pstmt.executeQuery();
			if (rs.next()) {
				pDTO = new ParamDTO();

				pDTO.setName(rs.getString("name"));
				pDTO.setEmail(rs.getString("email"));
				pDTO.setBirth(rs.getString("birth"));
				pDTO.setInputDate(rs.getDate("input_date"));
				pDTO.setIp(rs.getString("ip"));
				pDTO.setIntro(rs.getString("intro"));
				pDTO.setProfile(rs.getString("profile"));
				pDTO.setLoc(rs.getString("loc"));
			} // end if

		} finally {
//		7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		//System.out.println("********이메일이?  : "+pDTO+"**********************");
		return pDTO;
	}// selectMember

	/**
	 * 회원정보를 수정
	 * 
	 * @param pDTO
	 * @throws SQLException
	 */
	public int upDateMember(ParamDTO pDTO) throws SQLException {
		int cnt = 0;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			// 1.JNDI 사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection 얻기
			con = db.getConn();

			// 4.쿼리문 생성객체 얻기
			StringBuilder upDateMember = new StringBuilder();
			
			upDateMember
				.append(" update web_member ")
				.append(" set email=?, birth=?, loc=?, intro=?, profile=? ")
				.append(" where id=? ");
			pstmt = con.prepareStatement(upDateMember.toString());

			// 5.바인드 변수 값 설정
			pstmt.setString(1, pDTO.getEmail());
			pstmt.setString(2, pDTO.getBirth());
			pstmt.setString(3, pDTO.getLoc());
			pstmt.setString(4, pDTO.getIntro());
			pstmt.setString(5, pDTO.getProfile());
			pstmt.setString(6, pDTO.getId());

			// 6.쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();
		} finally {
			// 7.연결 끊기
			db.dbClose(null, pstmt, con);
		} // end finally
		return cnt;
	}// insertMember

}// class