package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DismemberDAO {

   private DBConnMgr pool;

   public DismemberDAO() {
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
   public boolean insertUser(DismemberVO vo) {
      boolean flag = false;
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "insert into dismember(name, personid1, personid2, area, mobile, discase, disgrade)"
               + "values(?, ?, ?, ?, ?, ?, ?)"; // memberseq는 auto increment이기 때문에 따로 value값을 설정안해줘도 된다.
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, vo.getName());
         pstmt.setString(2, vo.getPersonid1());
         pstmt.setString(3, vo.getPersonid2());
         pstmt.setString(4, vo.getArea());
         pstmt.setString(5, vo.getMobile());
         pstmt.setString(6, vo.getDiscase());
         pstmt.setString(7, vo.getDisgrade());
   
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
   
   

   // 회원가입시 주민번호 뒷자리 중복체크
   public boolean isid2Exist(String personid2) {
      boolean flag = false;
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      ResultSet rs = null;
      try {
         con = pool.getConnection();
         sql = "select name from dismember where personid2 = ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, personid2);
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
   
   

   // 회원정보 수정전 주민번호 뒷자리 확인
   // 세션에 저장된 전화번호와 입력받은 주민번호 뒷자리를 매개변수로 DB데이터와 대조
   public boolean ChkPW(String personid2, String Mobile) {
      boolean flag = false;
      Connection con = null;
      PreparedStatement pstmt = null;   
      String sql = null;
      ResultSet rs = null;
      
      try {
         con = pool.getConnection();
         sql = "select Mobile from dismember where personid2 = ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, personid2);
         rs = pstmt.executeQuery();
         
         // 나온 결과가 있는가?
         if(rs.next()) {
            // 결과가 입력받은 전화번호와 같은가?
            if(rs.getString("Mobile").equals(Mobile)) {
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
   public int dismemlogin(String name, String mobile) {
      Connection con = null;            // 데이터베이스와의 연결
      PreparedStatement pstmt = null;      // 사전에 컴파일 된 SQL문을 실행
      String sql = null;
      ResultSet rs = null;
      
      // 1 : 이름이 존재하지 않음
      // 2 : 전화번호가 일치하지 않음
      // 3 : 로그인 성공
      int flag = 0;
      
      try {
         con = pool.getConnection();
         // 입력받은 전화번호가 데이터베이스에 존재하는지 확인
         sql = "select name,mobile from dismember where mobile = ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, mobile);
         rs = pstmt.executeQuery();
         // 이름이 없으니 1을 반환
         if(!rs.next()) {
            flag = 1;
            return flag;
         }
         // sql문을 돌려 나온 전화번호가 입력받은 전화번호와 일치하는지 확인
         // 일치하지 않으면 2를 반환
         else if(!(rs.getString("mobile").equals(mobile))) {
            
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
   
   
   // 매개변수로 받은 전화번호의 모든 정보를 반환(VO)
      public DismemberVO getUser(String mobile) {
         DismemberVO vo = new DismemberVO();
         Connection con = null;
         PreparedStatement pstmt = null;   
         String sql = null;
         ResultSet rs = null;
         try {
            con = pool.getConnection();
            sql = "select * from dismember where mobile = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, mobile);
            rs = pstmt.executeQuery();
            if(rs.next()) {
               vo.setMemberseq(rs.getInt("Memberseq"));
               vo.setName(rs.getString("Name"));
               vo.setPersonid1(rs.getString("Personid1"));
               vo.setPersonid2(rs.getString("Personid2"));
               vo.setArea(rs.getString("Area"));
               vo.setMobile(rs.getString("Mobile"));
               vo.setDiscase(rs.getString("Discase"));
               vo.setDisgrade(rs.getString("Disgrade"));
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            pool.freeConnection(con, pstmt, rs);
         }
         return vo;
      }
      
      
      // 관심기업명을 해당 유저의 interestcompany에 추가하는 메소드
      public boolean intercom(int dismemberseq, String interestcompany) {
    	  boolean flag = false;
    	  Connection con = null;
    	  PreparedStatement pstmt = null;
    	  String sql = null;
    	  try {
    		  con = pool.getConnection();
    		  sql = "update dismember set interestcompany = concat(interestcompany, ',', ?) where memberseq = ?;";
    		  pstmt = con.prepareStatement(sql);
    		  pstmt.setString(1, interestcompany);
    		  pstmt.setInt(2, dismemberseq);
    		  if(pstmt.executeUpdate() == 1) {
    			  flag = true;
    		  }
    		  	
    	  } catch (Exception e) {
    		  e.printStackTrace();
    	  } finally {
    		  pool.freeConnection(con, pstmt);
    	  }
    	  return flag;
      }
      
      
      
      // 입사지원기업명을 해당 유저의 proposecompany에 추가하는 메소드
      public boolean procom(int memberseq, String proposecompany) {
    	  boolean flag = false;
    	  Connection con = null;
    	  PreparedStatement pstmt = null;
    	  String sql = null;
    	  try {
    		  con = pool.getConnection();
    		  sql = "insert into dismember(proposecompany) value(?) where memberseq = ? ";
    		  pstmt = con.prepareStatement(sql);
    		  pstmt.setString(1, proposecompany);
    		  pstmt.setInt(2, memberseq);
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
      
      // 매개변수로 전화번호를 받아서 해당 사용자의 interestcompany의 값들을 배열 형태로 반환
      public String listintercom (String usermobile) {
    	  String list = null;
    	  Connection con = null;
    	  PreparedStatement pstmt = null;
    	  ResultSet rs = null;
    	  String sql = null;
    	  try {
    		  con = pool.getConnection();
    		  sql = "select interestcompany from dismember where mobile = ?";
    		  pstmt = con.prepareStatement(sql);
    		  pstmt.setString(1, usermobile);
    		  rs = pstmt.executeQuery();
    		  if(rs.next()) {
    			  list = rs.getString("interestcompany");
    			  }
    	  } catch (Exception e) {
    		  e.printStackTrace();
    	  } finally {
    		  pool.freeConnection(con, pstmt);
    	  } 
    	  return list;
      }
      
   
}