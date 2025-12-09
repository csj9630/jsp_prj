package kr.co.sist.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1128.ParamDTO;
import kr.co.sist.dao.DbConn;
import kr.co.sist.emp.EmpDTO;
import kr.co.sist.emp.EmployeeDAO;

public class BoardDAO {
	// ------싱글톤 패턴----------
	private static BoardDAO bDAO;

	private BoardDAO() {
		// 생성자 잠금
	}

	public static BoardDAO getInstance() {
		if (bDAO == null) {
			bDAO = new BoardDAO();
		} // end if
		return bDAO;
	}// getInstance
		// ----------------------------

	/**
	 * 게시판 총 레코드의 수를 구한다.
	 * 
	 * @return
	 * @throws SQLException
	 */
	public int selectBoardTotalCnt() throws SQLException {
		int totalCnt = 0;

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
			String selectTotal = " select count(*) cnt from board ";
			pstmt = con.prepareStatement(selectTotal);
			// 6.쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalCnt = rs.getInt("cnt");
			} // 둥 if
		} finally {
			// 7.연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return totalCnt;
	}// selectId

	public List<BoardDTO> selectRangeBoard(RangeDTO rDTO) throws SQLException{
			List<BoardDTO> list = new ArrayList<BoardDTO>();
			
			DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				
//			1. JNDI 사용객체 생성
//			2 DataSource 얻기
//			3. connection 얻기
				con=dbCon.getConn();
//			4. 쿼리문 생성 객체 얻기
				String selectBoard = new  String();
				selectBoard = " select  rownum, NUM, TITLE, INPUT_DATE, IP, CNT, ID"
						+ "	from "
						+ " ( select  rownum, NUM, TITLE, INPUT_DATE, IP, CNT, ID ,"
						+ " row_number() over(order by input_date desc) rnum"
						+ "	from BOARD ) "
						+ " where rnum between ? and ?   ";
						
				pstmt=con.prepareStatement(selectBoard);
//			5. 바인드변수값 설정
				pstmt.setInt(1, rDTO.getStartNum());
				pstmt.setInt(2, rDTO.getEndNum());
				
//			6. 조회 결과 얻기
				BoardDTO bDTO = null;
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					bDTO = new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setTitle(rs.getString("title"));
					bDTO.setInput_date(rs.getDate("input_date"));
					bDTO.setCnt(rs.getInt("cnt"));
					bDTO.setId(rs.getString("id"));
					
					list.add(bDTO);
				}//end while
				
			}finally {
//			7. 연결 끊기
				dbCon.dbClose(rs, pstmt, con);
			}
			return list;
		}// selectRangeBoard

	public void insertBoard(BoardDTO bDTO)  throws SQLException {

			DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				// 1.JNDI 사용객체 생성
				// 2.DataSource 얻기
				// 3.DataSource에서 Connection 얻기
				con = dbCon.getConn();

				// 4.쿼리문 생성객체 얻기
				String insertBoard
				= "  insert into board(num, title, content, ip, id) "
						+ "	values(seq_board.nextval, ?,?,?,? ) ";
				pstmt = con.prepareStatement(insertBoard);
				
				//5.바인드 변수 값 설정
				pstmt.setString(1, bDTO.getTitle());
				pstmt.setString(2, bDTO.getContent());
				pstmt.setString(3, bDTO.getIp());
				pstmt.setString(4, bDTO.getId());
				
				// 6.쿼리문 수행 후 결과 얻기
				pstmt.executeUpdate();
		
			} finally {
				// 7.연결 끊기
				dbCon.dbClose(null, pstmt, con);
				
			} // end finally
			
		}//insertBoard
}// class
