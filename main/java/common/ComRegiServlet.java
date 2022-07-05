package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComRegiServlet
 */
@WebServlet("/ComRegi")
//comregister.jsp에서 기업회원가입을 시키면 action태그로 서블릿으로 보내줌 여기 서블릿에서는 함수명을 추가시켜 정보를 담아줄 메소드명을 작성한다.
public class ComRegiServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		// HttpServeltRequest : http상에서 들어오는 모든 요청을 담고 있는 클래스.
		// HttpServletResponse :  http상에서 보내는 모든 응답을 담고 있는 클래스.
			throws ServletException, IOException { 
		// 현재까지의 코드는 서블릿 생성 이후 기본적으로 세팅해야하는 코드들.
		
		request.setCharacterEncoding("UTF-8");
		// 이전 페이지에서 들어온 요청(request)들의 인코딩 타입을 설정하는 메소드. 
		
		CompanyDAO Cdao = new CompanyDAO();
		// DAO 객체생성
		
		boolean flag = Cdao.insertCompany(request);	
		// DAO에서 insertCompany 라는 이름의 메소드를 호출하여 request 매개변수를 집어넣는다. 
		// --> 그 return 값을 flag 변수에 담는다.  
		// 변수의 자료형이 boolean인 이유는 insertcompany()의 반환형이 boolean 이기 때문.
		
		response.setContentType("text/html; charset=UTF-8");
		// 응답을 보내는 데이터의 자료형을 text/html, UTF-8로 설정.
		 
		PrintWriter writer = response.getWriter();
		//printerwriter: 서블릿에서 html코드를 작성하기 위해서 사용하는 클래스 <-- 추가 검색 필요
		if(flag) {
			writer.println("<script>alert('가입 성공했습니다.'); location.href='./jsp/home.jsp'</script>");
			writer.close();
		} else {
			writer.println("<script>alert('가입에 실패했습니다.'); location.href='./jsp/companyregister.jsp'</script>");
			writer.close();
		}
		
		// id pw 중복시 가입 실패 db에도 들어가지 않음
		


	}
}
