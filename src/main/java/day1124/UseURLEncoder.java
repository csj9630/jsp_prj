package day1124;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class UseURLEncoder {

	public static void main(String[] args) throws UnsupportedEncodingException {
		String name ="제임스";
		System.out.println(name);
		
		//문자열을 web Parameter 형식으로 변환
		String ename = URLEncoder.encode(name, "UTF-8");
		System.out.println(ename);
		
		String deName=URLDecoder.decode(ename, "UTF-8");
		System.out.println(deName);
		
		System.out.println("-------------------------");
		//String 사용
		String str = new String(ename.getBytes("8859_1"),"UTF-8");
		System.out.println(str);
	}//main

}//class
