package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import service.BoardServiceImpl;
import service.ReplyService;
import service.ReplyServiceImpl;
import vo.Board;
import vo.Member;

@WebServlet("/board/detail")
public class Detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service=new BoardServiceImpl();
		Member member=((Member)req.getSession().getAttribute("member"));
		Long bno=Long.parseLong(req.getParameter("bno"));
		Board board=service.read(bno);
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		if(member==null|| board.getId()==null || !board.getId().equals(member.getId())) {
			service.hit(bno);
		}
		req.setAttribute("pageNum",pageNum);
		req.setAttribute("board",board);
		req.getRequestDispatcher("/WEB-INF/jsp/board/detail.jsp").forward(req, resp);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno=Long.parseLong(req.getParameter("bno"));
		BoardService service = new BoardServiceImpl();
		Member member=((Member)req.getSession().getAttribute("member"));
		String writer=service.findIdBy(bno);
		if(member!=null && member.getId().equals(writer)) {
			service.remove(bno);
			resp.getWriter().print(1);
		} else {
			resp.getWriter().print(0);
		}
	}
	
	
}
