package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/memberMf")
public class MemberMf extends HttpServlet{
	MemberService service=new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/memberModify.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPut(req, resp);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");
        String email = req.getParameter("email");
        String name = req.getParameter("name");

        Member member = new Member(id, pwd, email, name);
        service.modify(member);
        HttpSession session = req.getSession();
        session.setAttribute("member", service.findBy(id));
        resp.sendRedirect("index.html");
	}

}
