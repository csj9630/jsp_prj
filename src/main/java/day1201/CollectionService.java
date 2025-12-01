package day1201;

import java.util.ArrayList;
import java.util.List;

import day1127.DataDTO;

public class CollectionService {
	public String[] arr(){
		return "Java,Oracle,JDBC,HTML,JSS,CSS,JSP".split(",");
	}//arr
	
	public List<String> list(){
		
		List<String> list = new ArrayList<String>();
		
		list.add("옥션");
		list.add("옥션2");
		list.add("옥션3");
		list.add("옥션4");
		
		return list;
	}//
	
	public List<DataDTO> searchMember(){
		List<DataDTO> list = new ArrayList<DataDTO>();
		list.add(new DataDTO("옥션",26));
		list.add(new DataDTO("맘스터치",22));
		list.add(new DataDTO("조커",51));
		list.add(new DataDTO("배트맨",23));
		
		return list;
		
	}//
	
	public String poll() {
		return "최신 설문";
	}
	public String notice() {
		return "최신 공지";
	}
	

}
