package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
	private DBConnMgr pool;

	   public AdminDAO() {
	      try {
	         pool = DBConnMgr.getInstance();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	   
	   // 회원가입
	   // 가입 성공여부에 따라 flag를 반환 (성공시 true 실패시 false  / default는 false)
	   // 멤버번호를 max를 사용해서 추가한다?
	   // 비밀번호 암호화?
	   public boolean insertUser(AdminVO vo) {
	      boolean flag = false;
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      String sql = null;
	      try {
	         con = pool.getConnection();
	         sql = "insert into admin(adminseq, name, mobile, id, pw)"
	               + "values((SELECT IFNULL(MAX(mNum), 0)+1 FROM admin A), ?, ?, ?, ?, ?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, vo.getId());
	         pstmt.setString(2, vo.getPw());
	         pstmt.setString(3, vo.getName());
	         pstmt.setString(4, vo.getMobile());
	         pstmt.setInt(5, vo.getAdminseq());
	   
	         // executeUpdate 의 반환값은 insert,update,delete인 경우, 관련된 레코드의 수를 반환
	         // create, drop, alter인 경우에는 0을 반환
	         // 회원가입에는 1명의 정보를 저장하기 때문에 성공적으로 가입이 되었다면 1을 반환할 것이다.
	         if (pstmt.executeUpdate() == 1) {
	            flag = true;            
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt);
	      }
	      return flag;
	   }
	   
	   

	   // 회원가입시 ID 중복체크
	   public boolean isid2Exist(String id) {
	      boolean flag = false;
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      String sql = null;
	      ResultSet rs = null;
	      try {
	         con = pool.getConnection();
	         sql = "select name from admin where id = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         // 결과물이 있다는 것은 입력받은 주민번호 뒷자리가 이미 존재한다는 뜻
	         if(rs.next()) {
	            flag = true;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return flag;
	   }
	   
	   

	   // 회원정보 수정전 비밀번호 확인
	   // 세션에 저장된 전화번호와 입력받은 비밀번호를 매개변수로 DB데이터와 대조
	   public boolean ChkPW(String Pw, String Mobile) {
	      boolean flag = false;
	      Connection con = null;
	      PreparedStatement pstmt = null;   
	      String sql = null;
	      ResultSet rs = null;
	      
	      try {
	         con = pool.getConnection();
	         sql = "select pw from admin where pw= ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, Pw);
	         rs = pstmt.executeQuery();
	         
	         // 나온 결과가 있는가?
	         if(rs.next()) {
	            // 결과가 입력받은 전화번호와 같은가?
	            if(rs.getString("Pw").equals(Pw)) {
	               flag = true;
	            }
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      
	      return flag;
	   }
	   
	   

	   // 로그인
	   // 다른 방법으로는 비밀번호를 입력하고 로그인에 시도할 때 입력받은 비밀번호를 암호화시키고 
	   // 암호화된 비밀번호와 DB에 있는 암호화된 비밀번호를 대조하는 방식
	   public int adlogin(String id, String pw) {
	      Connection con = null;            // 데이터베이스와의 연결
	      PreparedStatement pstmt = null;      // 사전에 컴파일 된 SQL문을 실행
	      String sql = null;
	      ResultSet rs = null;
	      
	      // 1 : 이름이 존재하지 않음
	      // 2 : 비밀번호가 일치하지 않음
	      // 3 : 로그인 성공
	      // 4 : 로그인은 성공했지만 로그인실패 카운트 초과로 추가인증
	      // 5 : 로그인은 성공했지만 블랙리스트에 지정되어 일정 기간동안 로그인 불가
	      int flag = 0;
	      
	      try {
	         con = pool.getConnection();
	         // 입력받은 전화번호가 데이터베이스에 존재하는지 확인
	         sql = "select name from admin where mobile = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         // 이름이 없으니 1을 반환
	         if(!rs.next()) {
	            flag = 1;
	            return flag;
	         }
	         // sql문을 돌려 나온 전화번호가 입력받은 전화번호와 일치하는지 확인
	         // 일치하지 않으면 2를 반환
	         else if(!(rs.getString("pw").equals(pw))) {
	            
	            flag = 2;
	            return flag;
	         } else {
	            // 아무것도 걸리지 않으면 3을 반환
	               flag = 3;
	            }
	               
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return flag;
	   }
	   
	   
	   // 매개변수로 받은 비밀번호의 모든 정보를 반환(VO)
	      public AdminVO getAdmin(String pw) {
	         AdminVO vo = new AdminVO();
	         Connection con = null;
	         PreparedStatement pstmt = null;   
	         String sql = null;
	         ResultSet rs = null;
	         try {
	            con = pool.getConnection();
	            sql = "select * from admin where pw= ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, pw);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	               vo.setId(rs.getString("id"));
	               vo.setPw(rs.getString("pw"));
	               vo.setMobile(rs.getString("mobile"));
	               vo.setAdminseq(rs.getInt("memberseq"));
	               vo.setName(rs.getString("name"));
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         } finally {
	            pool.freeConnection(con, pstmt, rs);
	         }
	         return vo;
	      }
	   
	}