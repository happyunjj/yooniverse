package util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendMail")
public class MailSend extends HttpServlet{
	
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String use=req.getParameter("tempPwd");
		String code=randomCode();
		String tmpPwd=createTmpPw();
		System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
		Properties props = System.getProperties();
//        props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		// 세션 및 메세지 객체 생성
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				//변수를 받아와서 새팅하는 방법 확인 
				String name = "mongjaiscute@gmail.com";
				String pw = "mongja1215!";
				return new PasswordAuthentication(name, pw);
			}
			
		});
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setFrom(new InternetAddress("mongjaiscute@gmail.com", "Yonniverse"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			if(use==null) {
			msg.setSubject("인증번호가 도착했습니다~");
			msg.setText("인증번호는 "+code+"입니다.", "utf-8");
			}else {
				msg.setSubject("임시비밀번호가 도착했습니다~");
				msg.setText("임시비밀번호는 "+tmpPwd+"입니다. 로그인 후 비밀번호를 수정해주세요.", "utf-8");
			}
			resp.getWriter().print(use==null?code:tmpPwd);
			Transport.send(msg);
			System.out.println("이메일 발송 완료");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("이메일 확인 불가");
		}
	}

	public void sendMail(String title, String content,String to) {        
        // SMTP 설정
    }
	public String randomCode() {
		String str="";
		for(int i=1;i<=6;i++) {
			str+=(int)(Math.random() *10)+"";
		}
		return str;
	}
	
	public String createTmpPw() {
		String pw = "";		
		for(int i = 1 ; i <= 6 ; i++) {  // 6자리 비밀번호 생성을 위해 6번 반복
			int r = (int)(Math.random()*3)+1; //랜덤 숫자 1 ~ 3			
			if(r==1) { 
				pw += (int)(Math.random() * 10) + "";	
			} else if(r==2) {      
				up : while(true) {
					int upCase = (int)(Math.random()*90) + 1;
					if(upCase >= 'A') {
						pw += "" + (char)upCase;
						break up;
					} else {
						continue up;
					}	
				}
			} else {      
				low : while(true) {
					int lowCase = (int)(Math.random()*122) + 1;
					if(lowCase >= 'a') {
						pw += "" + (char)lowCase;
						break low;
					} else {
						continue low;
					}	
				}								
			}
		} return pw;	
	}



}
