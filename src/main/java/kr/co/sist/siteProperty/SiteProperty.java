package kr.co.sist.siteProperty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class SiteProperty {
//	private static SiteProperty sp;
//	
//	private SiteProperty() {
//		
//	}
//	
//	public static SiteProperty getInstance() {
//		if(sp == null) {
//			sp = new SiteProperty();
//		}
//		return sp;
//	}
//	
	public static SitePropertyVO spVO;

	// static 영역은 클래스가 사용되면 한번만 자동으로 호출되는 영역.
	static {
		DbConn db = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn();

			StringBuilder selectSiteInfo = new StringBuilder();
			selectSiteInfo
					.append(" select protocol,server_name,context_root,manage_path,key,title from site_property ");

			// **********사이트 세팅 1번 사용******************
			selectSiteInfo.append("where num = 1");
			pstmt = con.prepareStatement(selectSiteInfo.toString());
			rs = pstmt.executeQuery();

			//context root가 null이면 공백 처리
			if (rs.next()) {
				spVO = new SitePropertyVO(rs.getString("protocol"), rs.getString("server_name"),
						rs.getString("context_root")==null?"":rs.getString("context_root"), rs.getString("manage_path"), rs.getString("key"),
						rs.getString("title"));

			} // end if
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		} // en catch

	}// static
}
