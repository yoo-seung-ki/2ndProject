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
	
	// 매개변수로 companyseq를 받아서 해당 seq에 해당하는 기업의 모든 정보를 반환(VO)
	public CompanyVO getCompany(int seq) {
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
	            vo.setCompanyname(rs.getString("Companyname"));
	            vo.setCeo(rs.getString("Ceo"));
	            vo.setAddress(rs.getString("Address"));
	            vo.setHomepage(rs.getString("Homepage"));
	            vo.setCompanytype(rs.getString("CompanyType"));
	            vo.setCompanycontent(rs.getString("CompanyContent"));
	            vo.setCompanysize(rs.getString("Companysize"));
	            vo.setRecrutype(rs.getString("Recrutype"));
	            vo.setWorkcontent(rs.getString("Workcontent"));
	            vo.setGraduate(rs.getString("Graduate"));
	            vo.setEmploycase(rs.getString("Employcase"));
	            vo.setPaytype(rs.getString("Paytype"));
	            vo.setSeverance(rs.getString("Severance"));
	            vo.setWorktime(rs.getString("Worktime"));
				vo.setRecrusize(rs.getInt("Recrusize"));
				vo.setWorkarea(rs.getString("Workarea"));
				vo.setCareer(rs.getString("Career"));
				vo.setInsurance(rs.getString("Insurance"));
				vo.setBonus(rs.getString("Bonus"));
				vo.setAddwork(rs.getString("Addwork"));
				vo.setMajor(rs.getString("Major"));
				vo.setComputer(rs.getString("Computer"));
				vo.setWelfare(rs.getString("Welfare"));
				vo.setLicense(rs.getString("License"));
				vo.setFacil(rs.getString("Facil"));
				vo.setTreatment(rs.getString("Treatment"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	// 모든 기업의 모든 정보를 담은 list반환
	// ArrayList<String> 형태로 반환
	public List<CompanyVO> getCompanyList() {
		List<CompanyVO> list = new ArrayList<CompanyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select * from mjt order by companyseq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CompanyVO vo = new CompanyVO();
				vo.setCompanyseq(rs.getInt("Companyseq"));
				vo.setCompanyname(rs.getString("Companyname"));
				vo.setCeo(rs.getString("Ceo"));
				vo.setCreateyear(rs.getString("Createyear"));
				vo.setAddress(rs.getString("Address"));
				vo.setHomepage(rs.getString("Homepage"));
				vo.setCompanytype(rs.getString("Companytype"));
				vo.setCompanycontent(rs.getString("Companycontent"));
				vo.setCompanysize(rs.getString("Companysize"));
				vo.setRecrutype(rs.getString("Recrutype"));
				vo.setWorkcontent(rs.getString("Workcontent"));
				vo.setGraduate(rs.getString("Graduate"));
				vo.setEmploycase(rs.getString("Employcase"));
				vo.setPaytype(rs.getString("Paytype"));
				vo.setSeverance(rs.getString("Severance"));
				vo.setWorktime(rs.getString("Worktime"));
				vo.setEtc(rs.getString("Etc"));
				vo.setRecrusize(rs.getInt("Recrusize"));
				vo.setWorkarea(rs.getString("Workarea"));
				vo.setCareer(rs.getString("Career"));
				vo.setWorktype(rs.getString("Worktype"));
				vo.setInsurance(rs.getString("Insurance"));
				vo.setBonus(rs.getString("Bonus"));
				vo.setAddwork(rs.getString("Addwork"));
				vo.setMajor(rs.getString("Major"));
				vo.setComputer(rs.getString("Computer"));
				vo.setWelfare(rs.getString("Welfare"));
				vo.setLicense(rs.getString("License"));
				vo.setFacil(rs.getString("Facil"));
				vo.setTreatment(rs.getString("Treatment"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}


}