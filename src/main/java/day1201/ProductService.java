package day1201;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductService {

	public List<ProductDTO> searchPrd(){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		list.add(new ProductDTO("img_1.png","마인크래프트","모쟝",3500,new Date()));
		list.add(new ProductDTO("img_2.png","슬레이더스파이어","카드",23500,new Date(System.currentTimeMillis()-(60*60*24))));
		list.add(new ProductDTO("img_3.png","이터널리턴","지금바로다운로드",500,new Date(System.currentTimeMillis()-(60*60*24*2))));
		
		
		return list;
	}
	
}
