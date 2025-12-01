package day1127;

public class DataDTO {
	private String name;
	private int myAge;
	@Override
	public String toString() {
		return "DataDTO [name=" + name + ", age=" + myAge + "]";
	}

	public DataDTO(String name, int myAge) {
		System.out.println("DataDTO의 인자 있는 생성자");
		this.name = name;
		this.myAge = myAge;
	}
	public DataDTO() {
		System.out.println("DataDTO의 기본 생성자");
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMyAge() {
		return myAge;
	}

	public void setMyAge(int myAge) {
		this.myAge = myAge;
	}
	
	
}
