package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.BoardServiceImpl;
import service.MemberService;
import service.MemberServiceImpl;
import service.ReplyService;
import service.ReplyServiceImpl;
import vo.Member;

@WebServlet("/withdraw")
public class Withdraw extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/WEB-INF/jsp/member/withdraw.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			MemberService service=new MemberServiceImpl();
			String id=req.getParameter("id");
			service.withdraw(id);
			req.getSession().invalidate();
			resp.sendRedirect("index.html");
	}

}
