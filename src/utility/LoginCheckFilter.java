package utility;
 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
public class LoginCheckFilter implements Filter {
 
    public void init(FilterConfig arg0) throws ServletException { 
    	
    }
 
    public void doFilter(ServletRequest request, ServletResponse response, 
            FilterChain chain)
    throws IOException, ServletException {
        
        // Filter가 요청 중간에서 request 객체를 추출합니다.
        HttpServletRequest httpRequest = (HttpServletRequest)request;
 
        // 새로운 세션을 생성하지않고 request 객체에서 기존의 세션 반환
        HttpSession session = httpRequest.getSession(false);
        
        // 로그인 하지 않았다고 가정
        boolean login = false;
        
        if (session != null) { // session 객체가 생성되어 있는지 확인
        	if (session.getAttribute("id") != null&&!session.getAttribute("id").equals("")){
        		login = true;  // 로그인되었다면
        	}
        }
        
        // 정상적으로 로그인이 되었다면 요청 페이지로 이동합니다.
        if (login) {
            chain.doFilter(request, response); //요청 페이지로 이동
        } else {
            response.setContentType("text/html; charset=UTF-8");

            PrintWriter out = response.getWriter();

            out.println("<script type='text/javascript'>alert('회원 서비스입니다.\\n로그인 해주세요');location.href='/home.jsp'; </script>");  //location.href='/home.jsp'; 
            
            out.flush();
           
        }
    }
 
    public void destroy() {
    }
}
 
 