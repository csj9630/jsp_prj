package day1128;

import java.util.Arrays;

public class ParamDTO {
	private String id,pass,birth,loc,intro,code,ip,secChUaPlatform,userAgent;
	private String[] language;
	public ParamDTO() {
	}
	public ParamDTO(String id, String pass, String birth, String loc, String intro, String code, String ip,
			String secChUaPlatform, String userAgent, String[] language) {
		super();
		this.id = id;
		this.pass = pass;
		this.birth = birth;
		this.loc = loc;
		this.intro = intro;
		this.code = code;
		this.ip = ip;
		this.secChUaPlatform = secChUaPlatform;
		this.userAgent = userAgent;
		this.language = language;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	public String getSecChUaPlatform() {
		return secChUaPlatform;
	}
	public void setSecChUaPlatform(String secChUaPlatform) {
		this.secChUaPlatform = secChUaPlatform;
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
	@Override
	public String toString() {
		return "ParamDTO [id=" + id + ", pass=" + pass + ", birth=" + birth + ", loc=" + loc + ", intro=" + intro
				+ ", code=" + code + ", ip=" + ip + ", secChUaPlatform=" + secChUaPlatform + ", userAgent=" + userAgent
				+ ", language=" + Arrays.toString(language) + "]";
	}
		
	
}
