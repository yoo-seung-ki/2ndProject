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
	   
	   // ȸ������
	   // ���� �������ο� ���� flag�� ��ȯ (������ true ���н� false  / default�� false)
	   // �����ȣ�� max�� ����ؼ� �߰��Ѵ�?
	   // ��й�ȣ ��ȣȭ?
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
	   
	         // executeUpdate �� ��ȯ���� insert,update,delete�� ���, ���õ� ���ڵ��� ���� ��ȯ
	         // create, drop, alter�� ��쿡�� 0�� ��ȯ
	         // ȸ�����Կ��� 1���� ������ �����ϱ� ������ ���������� ������ �Ǿ��ٸ� 1�� ��ȯ�� ���̴�.
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
	   
	   

	   // ȸ�����Խ� ID �ߺ�üũ
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
	         // ������� �ִٴ� ���� �Է¹��� �ֹι�ȣ ���ڸ��� �̹� �����Ѵٴ� ��
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
	   
	   

	   // ȸ������ ������ ��й�ȣ Ȯ��
	   // ���ǿ� ����� ��ȭ��ȣ�� �Է¹��� ��й�ȣ�� �Ű������� DB�����Ϳ� ����
	   public boolean ChkPW(String pw, String Mobile) {
	      boolean flag = false;
	      Connection con = null;
	      PreparedStatement pstmt = null;   
	      String sql = null;
	      ResultSet rs = null;
	      
	      try {
	         con = pool.getConnection();
	         sql = "select Mobile from admin where pw= ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, pw);
	         rs = pstmt.executeQuery();
	         
	         // ���� ����� �ִ°�?
	         if(rs.next()) {
	            // ����� �Է¹��� ��ȭ��ȣ�� ������?
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
	   
	   

	   // �α���
	   // �ٸ� ������δ� ��й�ȣ�� �Է��ϰ� �α��ο� �õ��� �� �Է¹��� ��й�ȣ�� ��ȣȭ��Ű�� 
	   // ��ȣȭ�� ��й�ȣ�� DB�� �ִ� ��ȣȭ�� ��й�ȣ�� �����ϴ� ���
	   public int dismemlogin(String id, String pw) {
	      Connection con = null;            // �����ͺ��̽����� ����
	      PreparedStatement pstmt = null;      // ������ ������ �� SQL���� ����
	      String sql = null;
	      ResultSet rs = null;
	      
	      // 1 : �̸��� �������� ����
	      // 2 : ��й�ȣ�� ��ġ���� ����
	      // 3 : �α��� ����
	      // 4 : �α����� ���������� �α��ν��� ī��Ʈ �ʰ��� �߰�����
	      // 5 : �α����� ���������� ������Ʈ�� �����Ǿ� ���� �Ⱓ���� �α��� �Ұ�
	      int flag = 0;
	      
	      try {
	         con = pool.getConnection();
	         // �Է¹��� ��ȭ��ȣ�� �����ͺ��̽��� �����ϴ��� Ȯ��
	         sql = "select name from dismember where mobile = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         // �̸��� ������ 1�� ��ȯ
	         if(!rs.next()) {
	            flag = 1;
	            return flag;
	         }
	         // sql���� ���� ���� ��ȭ��ȣ�� �Է¹��� ��ȭ��ȣ�� ��ġ�ϴ��� Ȯ��
	         // ��ġ���� ������ 2�� ��ȯ
	         else if(!(rs.getString("pw").equals(pw))) {
	            
	            flag = 2;
	            return flag;
	         } else {
	            // �ƹ��͵� �ɸ��� ������ 3�� ��ȯ
	               flag = 3;
	            }
	               
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return flag;
	   }
	   
	   
	   // �Ű������� ���� ��й�ȣ�� ��� ������ ��ȯ(VO)
	      public AdminVO getUser(String pw) {
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