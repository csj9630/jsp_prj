package day1216;

import java.util.ArrayList;
import java.util.List;

/**
 * jsp에서 작동이 안되서 테스트하려고 만든 클래스, 삭제하여도 무방하다. 
 */
public class RssTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		List<RssDTO> list = new ArrayList<RssDTO>();
		list.add(new RssDTO("/newsflesh","속보","newsflesh"));
		list.add(new RssDTO("/issue","이슈 Top10","issue"));
		list.add(new RssDTO("/politics","정치","politics"));
		list.add(new RssDTO("/economy","경제","economy"));
		list.add(new RssDTO("/society","사회","society"));
		list.add(new RssDTO("/international","국제","international"));
		list.add(new RssDTO("/culture","문화","culture"));
		list.add(new RssDTO("/entertainment","연애","entertainment"));
		list.add(new RssDTO("/sports","스포츠","sports"));
		list.add(new RssDTO("/weather","날씨","weather")); 
		
		for (RssDTO rssDTO : list) {
			System.out.println(rssDTO);
		}
	}

}
