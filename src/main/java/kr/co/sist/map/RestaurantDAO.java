package kr.co.sist.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDTO;
import kr.co.sist.dao.DbConn;

public class RestaurantDAO {
	private static RestaurantDAO rDAO;

	private RestaurantDAO() {
		// 생성자 잠금
	}// WebMemerDAO

	public static RestaurantDAO getInstance() {
		if (rDAO == null) {
			rDAO = new RestaurantDAO();

		} // end if

		return rDAO;
	}// getInstance
	//Restaurant
	
	public List<RestaurantDTO> selectAllRestaurant(String id) throws SQLException{
		List<RestaurantDTO> list = new ArrayList<RestaurantDTO>();
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

//			1. JNDI 사용객체 생성
//			2 DataSource 얻기
//			3. connection 얻기
			con = dbCon.getConn();
//			4. 쿼리문 생성 객체 얻기
			StringBuilder selectRestaurant = new StringBuilder();
			selectRestaurant
			.append(" select rest_num, rest_name, menu, info, lat, lng, input_date   ")
			.append(" from restaurant   ")
			.append(" where id=?  ");
			

			//5.바인드변수값 설정
			pstmt = con.prepareStatement(selectRestaurant.toString());
			pstmt.setString(1, id);

//			6. 조회 결과 얻기
			BoardDTO bDTO = null;

			rs = pstmt.executeQuery();
			RestaurantDTO rDTO=null;
			while (rs.next()) {
				rDTO = new RestaurantDTO();
				rDTO.setRest_num(rs.getInt("rest_num"));
				
				list.add(rDTO);
			} // end while

		} finally {
//			7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectAllRestaurant
	
	public void insertRestaurant(RestaurantDTO rDTO) throws SQLException{
		
	}//insertRestaurant
	
	
}// class
