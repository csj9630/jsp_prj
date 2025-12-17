package kr.co.sist.map;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RestaurantService {
	//@formatter:off
	private static RestaurantService rs;
	private RestaurantService() {}
	public static RestaurantService getInstance() {
		if (rs == null) {rs = new RestaurantService();} // end if
		return rs;
	}// getInstance
	//@formatter:on

	// Restaurant
	public List<RestaurantDTO> searchRestaurant(String id) {
		List<RestaurantDTO> list = null;
		
		RestaurantDAO rDAO = RestaurantDAO.getInstance();
		
		try {
			list=rDAO.selectAllRestaurant(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch

		return list;
	}//searchRestaurant

}// class
