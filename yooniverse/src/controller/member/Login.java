package controller.member;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/login")
public class Login extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String backUrl=(String)req.getHeader("referer");
		req.setAttribute("backUrl", backUrl);
		req.getRequestDispatcher("/WEB-INF/jsp/member/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service=new MemberServiceImpl();
		String id=req.getParameter("id");
		String backUrl=req.getParameter("backUrl");

		HttpSession session=req.getSession();
		session.setAttribute("member", service.findBy(id));
		
		//아이디 저장
		Cookie cookie=new Cookie("savedId",id);
		cookie.setMaxAge(req.getParameter("savedId")==null?0:60*60*24*365);
		System.out.println(backUrl);
		resp.addCookie(cookie);
		if(backUrl.equals("")) {
			resp.sendRedirect("index.html");
		}else {
			resp.sendRedirect(backUrl);
		}
		
	}
	
}
