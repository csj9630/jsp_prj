package kr.co.sist.board;

import java.sql.SQLException;

public class BoardService {
	private static BoardService bs;
	private BoardService() {
		
	}
	public static BoardService getInstance() {
		if(bs == null) {
			bs = new BoardService();
		}//end if
		return bs;
	}//getInstance
	
	public boolean addBoard(BoardDTO bDTO) {
		boolean flag=false;
		BoardDAO bDAO = BoardDAO.getInstance();
		
		try {
			bDAO.insertBoard(bDTO);
			flag=true;
		}catch(SQLException e) {
			e.printStackTrace();
		}//end catch
		
		
		return flag;
	}//addBoard 
	
	
}//class
