package service;

public class BoardServiceTests {
	BoardService service=new BoardServiceImpl();
	
	public static void main(String[] args) {
		BoardServiceTests tests=new BoardServiceTests();
		tests.testRemove();
	}
	
	public void testRemove() {
		service.remove(89L);
	}
	
}
