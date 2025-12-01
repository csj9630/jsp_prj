package day1127;

public class Counter {
	private int cnt;
	
	public Counter() {
		cnt=0;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}
	
}
