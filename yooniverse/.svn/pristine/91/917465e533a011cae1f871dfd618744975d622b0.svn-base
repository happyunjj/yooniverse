package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import service.BoardServiceImpl;

@WebServlet("/heart")
public class Heart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service=new BoardServiceImpl();
		String id=req.getParameter("id");
		Long bno=Long.parseLong(req.getParameter("bno"));
		int result=service.heart(id, bno);
		int likeCount=service.getHeartCount(bno);
		resp.getWriter().print(result+""+likeCount);
	}
	
}
