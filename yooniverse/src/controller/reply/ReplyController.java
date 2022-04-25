package controller.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.ReplyService;
import service.ReplyServiceImpl;
import vo.Member;
import vo.Reply;

@WebServlet("/reply")
public class ReplyController extends HttpServlet{
	private ReplyService service=new ReplyServiceImpl();
	private Gson gson=new Gson();
	//댓글 단일 조회
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long rno=Long.parseLong(req.getParameter("rno"));
		Reply reply=service.get(rno);
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(gson.toJson(reply));
	}
	
	//댓글 작성
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rno=req.getParameter("rno");
		if(rno==null) {
			String jsonData=req.getParameter("jsonData");
			Reply reply=gson.fromJson(jsonData, Reply.class);
			System.out.println(reply);
			service.write(reply);
		} else {
			doPut(req,resp);
		}
	}
	
	//댓글 수정
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReplyService service = new ReplyServiceImpl();
		Long rno=Long.parseLong(req.getParameter("rno"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		Member member=(Member) req.getSession().getAttribute("member");
		Reply original=service.get(rno);
		String writer=original.getId();
		String content=req.getParameter("content");
		Reply reply=new Reply(rno,content);
		
		if(member!=null && member.getId().equals(writer)) {
			service.modify(reply);
			if(req.getParameter("gallery")==null) {
				resp.sendRedirect("board/detail?bno="+original.getBno()+"&pageNum="+pageNum);
			}
			else {
				resp.sendRedirect("gallery/detail?bno="+original.getBno()+"&pageNum="+pageNum);
			}
		} else {
			resp.getWriter().print("Hey Don't do that! I'm angry");
		}
	}
	
	//댓글 삭제
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long rno=Long.parseLong(req.getParameter("rno"));
		Member member=(Member) req.getSession().getAttribute("member");
		String writer=service.findIdBy(rno);
		if(member!=null && member.getId().equals(writer)) {
			service.remove(rno);
			resp.getWriter().print(1);
		} else {
			resp.getWriter().print(0);
		}
	}
}
