package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComRegiServlet
 */
@WebServlet("/companyregi")
//comregister.jsp에서 기업회원가입을 시키면 action태그로 서블릿으로 보내줌 여기 서블릿에서는 함수명을 추가시켜 정보를 담아줄 메소드명을 작성한다.
public class ComRegiServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CompanyDAO Cdao = new CompanyDAO();

		boolean flag = Cdao.insertCompany(request);	
		// DAO에서 insertCompany 라는 이름의 함수명사용 --> 이걸 가져와서 request에 담아줌 DAO에 저 내용들을
		// 앞에 boolean형인것은 DAO에서 boolean형이라서 그대로 가져온것

	}
}