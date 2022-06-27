package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class photoMgr {

	private DBConMgr pool;
	
public Vector<PhotoVO> getPhotoImgUrl(String keyWord, int start, int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		Vector<PhotoVO> vlist = new Vector<PhotoVO>();
		System.out.println("keyWord : "+keyWord);
		try {
			con = pool.getConnection();
			if(keyWord == null || keyWord == "") {
			sql = "select * from mjt order by companyseq desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					PhotoVO bean = new PhotoVO();
					bean.setPhotoUrl(rs.getString("logo"));
					
					vlist.add(bean);
				}
			} else {
			sql = "select " + keyWord + " from mjt order by companyseq desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);	
				rs = pstmt.executeQuery();
			
				while (rs.next()) {
					PhotoVO vo = new PhotoVO();
					vo.setPhotoUrl(rs.getString(1));
					
					vlist.add(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
}


