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
	      int flag = 0;
	      
	      try {
	         con = pool.getConnection();
	         // 입력받은 id가 데이터베이스에 존재하는지 확인
	         sql = "select id,pw from admin where id = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         // 이름이 없으니 1을 반환
	         if(!rs.next()) {
	            flag = 1;
	            return flag;
	         }
	         // sql문을 돌려 나온 비밀번호가 입력받은 비밀번호와 일치하는지 확인
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
	   
	   
	   // 매개변수로 받은 id의 모든 정보를 반환(VO)
	      public AdminVO getAdmin(String id) {
	         AdminVO vo = new AdminVO();
	         Connection con = null;
	         PreparedStatement pstmt = null;   
	         String sql = null;
	         ResultSet rs = null;
	         try {
	            con = pool.getConnection();
	            sql = "select * from admin where id= ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	               vo.setId(rs.getString("id"));
	               vo.setPw(rs.getString("pw"));
	               vo.setMobile(rs.getString("mobile"));
	               vo.setAdminseq(rs.getInt("adminseq"));
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