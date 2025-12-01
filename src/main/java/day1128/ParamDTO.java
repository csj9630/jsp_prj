package day1128;

import java.util.Arrays;

//id=testsdfg&pass=minjo123&birth=2025-11-06&loc=서울&intro=내소개&language=java&language=C&code=U3881
//요청 페이지 열어서 이름 복붙
public class ParamDTO {
	private String id,pass,bitrh,loc,intro,code,ip,userAgent;
	private String[] language;

	public ParamDTO() {
	}

	public ParamDTO(String id, String pass, String bitrh, String loc, String intro, String code, String ip,
			String userAgent, String[] language) {
		super();
		this.id = id;
		this.pass = pass;
		this.bitrh = bitrh;
		this.loc = loc;
		this.intro = intro;
		this.code = code;
		this.ip = ip;
		this.userAgent = userAgent;
		this.language = language;
	}

	@Override
	public String toString() {
		return "ParamDTO [id=" + id + ", pass=" + pass + ", bitrh=" + bitrh + ", loc=" + loc + ", intro=" + intro
				+ ", code=" + code + ", ip=" + ip + ", userAgent=" + userAgent + ", language="
				+ Arrays.toString(language) + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getBitrh() {
		return bitrh;
	}

	public void setBitrh(String bitrh) {
		this.bitrh = bitrh;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String[] getLanguage() {
		return language;
	}

	public void setLanguage(String[] language) {
		this.language = language;
	}

	
}//class
