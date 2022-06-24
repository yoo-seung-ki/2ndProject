package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DismemberDAO {

	private DBConMgr pool;

	public DismemberDAO() {
		try {
			pool = DBConMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ȸ������
	// ���� �������ο� ���� flag�� ��ȯ(������ true, default�� false)
	// �����ȣ�� max�� ����Ͽ� �߰��Ѵ�?
	// ��й�ȣ ��ȣȭ?
	public boolean insertUser(DismemberVO vo) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into dismember(memberseq, name, personid1, personid2, area, mobile, discase, disgrade)"
					+ "values((SELECT IFNULL(MAX(mNum), 0)+1 FROM dismember D), ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getMemberseq());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPersonid1());
			pstmt.setInt(4, vo.getPersonid2());
			pstmt.setString(5, vo.getArea());
			pstmt.setString(6, vo.getMobile());
			pstmt.setString(7, vo.getDiscase());
			pstmt.setString(8, vo.getDisgrade());
	
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
	
	

	// ȸ�����Խ� �ֹι�ȣ ���ڸ� �ߺ�üũ
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
	
	

	// ȸ������ ������ �ֹι�ȣ ���ڸ� Ȯ��
	// ���ǿ� ����� �ֹι�ȣ ���ڸ��� �Է¹��� ��ȭ��ȣ�� �Ű������� DB�����Ϳ� ����
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
	// �ٸ� ������δ� ��ȭ��ȣ�� �Է��ϰ� �α��ο� �õ��� �� �Է¹��� ��ȭ��ȣ�� ��ȣȭ��Ű�� 
	// ��ȣȭ�� ��й�ȣ�� DB�� �ִ� ��ȣȭ�� ��ȭ��ȣ�� �����ϴ� ���
	public int login(String id, String pw) {
		Connection con = null;				// �����ͺ��̽����� ����
		PreparedStatement pstmt = null;		// ������ ������ �� SQL���� ����
		String sql = null;
		ResultSet rs = null;
		
		// 1 : ���̵� �������� ����
		// 2 : ��й�ȣ�� ��ġ���� ����
		// 3 : �α��� ����
		// 4 : �α����� ���������� �α��ν��� ī��Ʈ �ʰ��� �߰�����
		// 5 : �α����� ���������� ������Ʈ�� �����Ǿ� ���� �Ⱓ���� �α��� �Ұ�
		int flag = 0;
		
		try {
			con = pool.getConnection();
			// �Է¹��� �̸��� �����ͺ��̽��� �����ϴ��� Ȯ��
			sql = "select Mobile from dismember where name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// id�� ������ 1�� ��ȯ
			if(!rs.next()) {
				flag = 1;
				return flag;
			}
			// sql���� ���� ���� ��ȭ��ȣ�� �Է¹��� ��ȭ��ȣ�� ��ġ�ϴ��� Ȯ��
			// ��ġ���� ������ 2�� ��ȯ
			else if(!(rs.getString("pw").equals(pw))) {
				
				flag = 2;
				return flag;
			} else if(rs.getInt("lgnFailCnt") < 5){
				// �ƹ��͵� �ɸ��� ������ 3�� ��ȯ�ϸ鼭 �α��� ���� ī��Ʈ�� 0���� �ʱ�ȭ
				pstmt.close();
				sql = "update users set lgnFailCnt = 0 where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				} else {
					flag = 3;
				}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	
}
