package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CompanyDAO {
	
	private DBConMgr pool;

	public CompanyDAO() {
		try {
			pool = DBConMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 매개변수로 받은 기업의 모든 정보를 반환(VO)
	public DismemberVO getUser(int seq) {
		CompanyVO vo = new CompanyVO();
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select * from mjt where companyseq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMemberseq(rs.getInt("Companyseq"));
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
