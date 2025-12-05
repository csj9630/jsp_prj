package kr.co.sist.user.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import day1128.ParamDTO;
import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;

public class WebMemberLoginService {
	private static WebMemberLoginService wmls;

	private WebMemberLoginService() {
		// 생성자 잠금
	}// WebMemberLoginService

	/**
	 * 싱글톤 패턴 적용
	 * 
	 * @return
	 */
	public static WebMemberLoginService getInstance() {
		if (wmls == null) {
			wmls = new WebMemberLoginService();

		} // end if
		return wmls;
	}// getInstance

	public ParamDTO searchLogin(LoginDTO lDTO, String key) {
		ParamDTO pDTO = null;
		System.out.println("lDTO : "+lDTO);
		if (lDTO.getPassword() != null && !"".equals(lDTO.getPassword())) {
			try {
				lDTO.setPassword(DataEncryption.messageDigest("SHA-1", lDTO.getPassword()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} // end catch
		} // end if

		WebMemberLoginDAO wmlDAO = WebMemberLoginDAO.getInstance("jdbc/dbcp");

		try {
			pDTO = wmlDAO.selectLogin(lDTO);
			System.out.println(pDTO);
			//PDTO에는 아이디, 이름(암호화 > 복호화), 생년윌일이 할당
			DataDecryption dd=new DataDecryption(key);//대칭키 : 암호화키와 복호와키가 같아야한다.
			try {
			pDTO.setName(dd.decrypt(pDTO.getName()));
			} catch (Exception e) {
				e.printStackTrace();
			}//catch
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//catch

		return pDTO;
	}// searchLogin

}// class
