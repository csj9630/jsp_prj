package kr.co.sist.user.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import day1128.ParamDTO;
import kr.co.sist.chipher.DataEncryption;
import kr.co.sist.dao.WebMemberDAO;

public class WebMemberService {

	private static WebMemberService wmService;

	private WebMemberService() {
		// 생성자 잠금
	}

	/**
	 * 서비스도 싱글톤 패턴 적용
	 * 
	 * @return
	 */
	public static WebMemberService getInstance() {
		if (wmService == null) {
			wmService = new WebMemberService();

		} // end if

		return wmService;
	}// getInstance

	public boolean searchId(String id) {
		boolean flag = false;

		WebMemberDAO wmDAO = WebMemberDAO.getInstance();

		try {
			flag = wmDAO.selectId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // end catch

		return flag;
	}// searchId

	public boolean addMember(ParamDTO pDTO, String key) throws Exception {
		boolean flag = false;

		WebMemberDAO wmDAO = WebMemberDAO.getInstance();

		// 암호화 과정
		// 근데 DataEncryption 이거 외부클래스를 못 읽어서 문제다.
		// 이 부분 작성 다 안됨.

//		String key = "a123456789012345";
		// 저장될 데이터의 중요도에 따라 일방향 헤시, 암호화 처리.
		// null / "" 들어가면 에러남.

		if (pDTO.getPass() != null && !"".equals(pDTO.getPass())) {
			try {
				pDTO.setPass(DataEncryption.messageDigest("SHA-1", pDTO.getPass()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} // end catch

		} // end if

	      DataEncryption de=new DataEncryption(key);
	      if(pDTO.getName()!=null && !"".equals(pDTO.getName())) {
	         try {
	            pDTO.setName(de.encrypt(pDTO.getName()));
	         } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	         }
	      }
	      if(pDTO.getEmail()!=null && !"".equals(pDTO.getEmail())) {
	         try {
	            pDTO.setEmail(de.encrypt(pDTO.getEmail()));
	         } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	         }
	      }
	      	

		try {
			// 회원 정보 1개 insert
			wmDAO.insertMember(pDTO);

			// 관심언어는 중요한 종류가 아니니 일단 회원 정보만 잘 넣으면 성공 취급
			flag = true;

			// 회원 언어정보 n개 insert
			String[] lang = pDTO.getLanguage();
			if (lang != null) {// 선택 언어가 있다면
				for (String tempLang : lang) {// 언어 수만큼 반복하여 insert 수행
					wmDAO.insertMemberLang(pDTO.getId(), tempLang);
				} // end for
			} // end if

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // end catch

		return flag;
	}// addMember

}// class
