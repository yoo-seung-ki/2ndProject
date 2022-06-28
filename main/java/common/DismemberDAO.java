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
	
	// �쉶�썝媛��엯
	// 媛��엯 �꽦怨듭뿬遺��뿉 �뵲�씪 flag瑜� 諛섑솚 (�꽦怨듭떆 true �떎�뙣�떆 false  / default�뒗 false)
	// 硫ㅻ쾭踰덊샇瑜� max瑜� �궗�슜�빐�꽌 異붽��븳�떎?
	// 鍮꾨�踰덊샇 �븫�샇�솕?
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
	
			// executeUpdate �쓽 諛섑솚媛믪� insert,update,delete�씤 寃쎌슦, 愿��젴�맂 �젅肄붾뱶�쓽 �닔瑜� 諛섑솚
			// create, drop, alter�씤 寃쎌슦�뿉�뒗 0�쓣 諛섑솚
			// �쉶�썝媛��엯�뿉�뒗 1紐낆쓽 �젙蹂대�� ���옣�븯湲� �븣臾몄뿉 �꽦怨듭쟻�쑝濡� 媛��엯�씠 �릺�뿀�떎硫� 1�쓣 諛섑솚�븷 寃껋씠�떎.
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
	
	

	// �쉶�썝媛��엯�떆 二쇰�쇰쾲�샇 �뮮�옄由� 以묐났泥댄겕
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
			// 寃곌낵臾쇱씠 �엳�떎�뒗 寃껋� �엯�젰諛쏆� 二쇰�쇰쾲�샇 �뮮�옄由ш� �씠誘� 議댁옱�븳�떎�뒗 �쑜
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
	
	

	// �쉶�썝�젙蹂� �닔�젙�쟾 二쇰�쇰쾲�샇 �뮮�옄由� �솗�씤
	// �꽭�뀡�뿉 ���옣�맂 �쟾�솕踰덊샇�� �엯�젰諛쏆� 二쇰�쇰쾲�샇 �뮮�옄由щ�� 留ㅺ컻蹂��닔濡� DB�뜲�씠�꽣�� ��議�
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
			
			// �굹�삩 寃곌낵媛� �엳�뒗媛�?
			if(rs.next()) {
				// 寃곌낵媛� �엯�젰諛쏆� �쟾�솕踰덊샇�� 媛숈�媛�?
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
	
	

	// 濡쒓렇�씤
	// �떎瑜� 諛⑸쾿�쑝濡쒕뒗 鍮꾨�踰덊샇瑜� �엯�젰�븯怨� 濡쒓렇�씤�뿉 �떆�룄�븷 �븣 �엯�젰諛쏆� 鍮꾨�踰덊샇瑜� �븫�샇�솕�떆�궎怨� 
	// �븫�샇�솕�맂 鍮꾨�踰덊샇�� DB�뿉 �엳�뒗 �븫�샇�솕�맂 鍮꾨�踰덊샇瑜� ��議고븯�뒗 諛⑹떇
	public int login(String id, String pw) {
		Connection con = null;				// �뜲�씠�꽣踰좎씠�뒪���쓽 �뿰寃�
		PreparedStatement pstmt = null;		// �궗�쟾�뿉 而댄뙆�씪 �맂 SQL臾몄쓣 �떎�뻾
		String sql = null;
		ResultSet rs = null;
		
		// 1 : �씠由꾩씠 議댁옱�븯吏� �븡�쓬
		// 2 : 鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�쓬
		// 3 : 濡쒓렇�씤 �꽦怨�
		// 4 : 濡쒓렇�씤�� �꽦怨듯뻽吏�留� 濡쒓렇�씤�떎�뙣 移댁슫�듃 珥덇낵濡� 異붽��씤利�
		// 5 : 濡쒓렇�씤�� �꽦怨듯뻽吏�留� 釉붾옓由ъ뒪�듃�뿉 吏��젙�릺�뼱 �씪�젙 湲곌컙�룞�븞 濡쒓렇�씤 遺덇�
		int flag = 0;
		
		try {
			con = pool.getConnection();
			// �엯�젰諛쏆� �씠由꾩씠 �뜲�씠�꽣踰좎씠�뒪�뿉 議댁옱�븯�뒗吏� �솗�씤
			sql = "select Mobile from dismember where name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// �씠由꾩씠 �뾾�쑝�땲 1�쓣 諛섑솚
			if(!rs.next()) {
				flag = 1;
				return flag;
			}
			// sql臾몄쓣 �룎�젮 �굹�삩 �쟾�솕踰덊샇媛� �엯�젰諛쏆� �쟾�솕踰덊샇�� �씪移섑븯�뒗吏� �솗�씤
			// �씪移섑븯吏� �븡�쑝硫� 2瑜� 諛섑솚
			else if(!(rs.getString("pw").equals(pw))) {
				
				flag = 2;
				return flag;
			} else {
				// �븘臾닿쾬�룄 嫄몃━吏� �븡�쑝硫� 3�쓣 諛섑솚�븯硫댁꽌 濡쒓렇�씤 �떎�뙣 移댁슫�듃瑜� 0�쑝濡� 珥덇린�솕
					flag = 3;
				}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	
	// 留ㅺ컻蹂��닔濡� 諛쏆� 二쇰�쇰쾲�샇 �뮮�옄由ъ쓽 紐⑤뱺 �젙蹂대�� 諛섑솚(VO)
		public DismemberVO getUser(String personid2) {
			DismemberVO vo = new DismemberVO();
			Connection con = null;
			PreparedStatement pstmt = null;	
			String sql = null;
			ResultSet rs = null;
			try {
				con = pool.getConnection();
				sql = "select * from users where personid2 = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, personid2);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo.setMemberseq(rs.getInt("Memberseq"));
					vo.setName(rs.getString("Name"));
					vo.setPersonid1(rs.getString("Personid1"));
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
	
}
