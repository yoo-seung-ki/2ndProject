package common;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CompanyDAO {

	private DBConnMgr pool;
	private static final String SAVEFOLDER = "C:/Users/admin/Documents/2ndproject/src/main/webapp/img"; 
	// final은 상수라는 의미인데 상수는 변화되지 않고 고정된 값으로 SAVEFOLDER를 대문자로 쓴것은 그것을 표현하기 위해서임 그렇게하기로 약속됨 밑에도 같음
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 10 * 1024 * 1024;
	// 최대 10메가까지 파일사이즈를 허용한다는 의미

	public CompanyDAO() {
		try {
			pool = DBConnMgr.getInstance();
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
				vo.setCompanyseq(rs.getInt("Companyseq"));
				vo.setCompanyname(rs.getString("Companyname"));
				vo.setLogo(rs.getString("Logo"));
				vo.setCeo(rs.getString("Ceo"));
				vo.setAddress(rs.getString("Address"));
				vo.setCreateyear(rs.getString("Createyear"));
				vo.setWorktype(rs.getString("Worktype"));
				vo.setEtc(rs.getString("Etc"));
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
				vo.setComid(rs.getString("Comid"));
				vo.setCompw(rs.getString("Compw"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	
	
	// 매개변수로 comid를 받아서 해당 comid에 해당하는 기업의 모든 정보를 반환(VO)
		public CompanyVO getCompanyfromid(String comid) {
			CompanyVO vo = new CompanyVO();
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try {
				con = pool.getConnection();
				sql = "select * from mjt where comid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, comid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo.setCompanyseq(rs.getInt("Companyseq"));
					vo.setCompanyname(rs.getString("Companyname"));
					vo.setLogo(rs.getString("Logo"));
					vo.setCeo(rs.getString("Ceo"));
					vo.setAddress(rs.getString("Address"));
					vo.setCreateyear(rs.getString("Createyear"));
					vo.setWorktype(rs.getString("Worktype"));
					vo.setEtc(rs.getString("Etc"));
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
					vo.setComid(rs.getString("Comid"));
					vo.setCompw(rs.getString("Compw"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vo;
		}
	
	
	// 매개변수로 companyname을 받아서 해당 name에 해당하는 기업의 모든 정보를 반환(VO)
		public CompanyVO getCompanyfromname(String name) {
			CompanyVO vo = new CompanyVO();
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try {
				con = pool.getConnection();
				sql = "select * from mjt where companyname = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo.setCompanyseq(rs.getInt("Companyseq"));
					vo.setCompanyname(rs.getString("Companyname"));
					vo.setLogo(rs.getString("Logo"));
					vo.setCeo(rs.getString("Ceo"));
					vo.setAddress(rs.getString("Address"));
					vo.setCreateyear(rs.getString("Createyear"));
					vo.setWorktype(rs.getString("Worktype"));
					vo.setEtc(rs.getString("Etc"));
					vo.setEmplodate(rs.getString("emplodate"));
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
					vo.setComid(rs.getString("Comid"));
					vo.setCompw(rs.getString("Compw"));
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
				vo.setLogo(rs.getString("Logo"));
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
				vo.setComid(rs.getString("Comid"));
				vo.setCompw(rs.getString("Compw"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}



	// 기업이 총 몇개인지 계산하는 메소드
	public int getPostCount() {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select companyseq from mjt ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return cnt;
	}



	// 전체 기업 리스트를 10개씩 끊어서 ArrayList<CompanyVO> 형으로 반환
	public List<CompanyVO> getCompanyListTen(int startRow, int pageSize) {
		List<CompanyVO> list = new ArrayList<CompanyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select companyname,companyseq,logo,address,recrutype,emplodate from mjt order By companyseq limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				CompanyVO vo = new CompanyVO();
				vo.setCompanyname(rs.getString("Companyname"));
				vo.setCompanyseq(rs.getInt("Companyseq"));
				vo.setLogo(rs.getString("Logo"));
				vo.setAddress(rs.getString("Address"));
				vo.setRecrutype(rs.getString("Recrutype"));
				vo.setEmplodate(rs.getString("Emplodate"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	
	
	
	public List<CompanyVO> getSearch(String searchText){//검색하는 메소드
        List<CompanyVO> list = new ArrayList<CompanyVO>();
        Connection con = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
	      try {
	    	   con = pool.getConnection();
	           if(searchText != null && !searchText.equals("") ){//이거 빼면 안 나온다ㅜ 왜지?
	        	   sql =" select * from mjt where companyname LIKE ? order by companyseq desc limit 10";
		           pstmt = con.prepareStatement(sql);
		           pstmt.setString(1,"%" + searchText + "%");
		           rs = pstmt.executeQuery();
	            
				//select
	         while(rs.next()) {
	            CompanyVO vo = new CompanyVO();
	            vo.setCompanyseq(rs.getInt("Companyseq"));
	            vo.setLogo(rs.getString("Logo"));
	            vo.setCompanyname(rs.getString("Companyname"));
	            vo.setAddress(rs.getString("Address"));
	            vo.setWorkcontent(rs.getString("Workcontent"));
	            vo.setRecrutype(rs.getString("Recrutype"));
	            vo.setEmplodate(rs.getString("Emplodate"));
	            list.add(vo);//list에 해당 인스턴스를 담는다.
	         }         
	            }
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;//게시글 리스트 반환
	   }
	

		// 채용 게시물 삭제
		public boolean deleteCompany(int seq) {
			boolean flag = false;
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "delete from mjt where companyseq = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, seq);
				
				// 관련된 레코드의 숫자가 반환되는데, delete로 1줄이 영향을 받는건 알겠지만, 트리거도 카운트가 되는지는 모르겠음
				// 만약 트리거가 영향을 준다면 2일때 flag를 true로 바꿔줘야 함
				if (pstmt.executeUpdate() == 1) {
					flag = true;
				}
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				pool.freeConnection(con, pstmt);
			}
			
			return flag;
		}
		
		
		
		
		   // 기업의 회원가입
		   // 가입 성공여부에 따라 flag를 반환 (성공시 true 실패시 false  / default는 false)
		   // 파일이 저장될 폴더, 파일의 최대크기, 파일의 Encording Type 설정 및 추가, 파일명 안겹치게만들기
		   public boolean insertCompany(HttpServletRequest request) {	
			   // HttpServletRequest request는 서블릿을 만들어서 이렇게 수정시킴
		      boolean flag = false;
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      String sql = null;
		      MultipartRequest multi = null;
		      String filename = null; 
		     
		      try {
		         con = pool.getConnection();
		         File file = new File(SAVEFOLDER);
		         // 위에서 File file 에서 file은 form 태그 안의 input 태그 중 type="file"인 input의 name을 받아온다 
		         // 받아와서 그 파일이 저장될 경로를 (SAVEFOLDER) 라는 명령어를 통해 설정한다.
		         if (!file.exists()) // file이 존재하지 않는다면
		        	 file.mkdirs(); // mkdirs() = 파일이 저장될 폴더를 만들어주는 메소드
		         
		         multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
		         // DefaultFileRenamePolicy() ==> 파일이 동일한 이름으로 저장되지 않도록 방지해주는 메소드
		         if(multi.getFilesystemName("file") != null) { // not null = 업로드된 파일이 있다는 의미
		        	 filename = multi.getFilesystemName("file");
		         }

		         sql = "insert into mjt(companyname, ceo, createyear, address, homepage, "
		         		+ "companytype, companycontent, companysize,  comid, compw, logo)"
		               + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		         pstmt = con.prepareStatement(sql);
		         //request.getParameter("")이랑 똑같다
		         pstmt.setString(1, multi.getParameter("companyname"));
		         pstmt.setString(2, multi.getParameter("ceo"));
		         pstmt.setString(3, multi.getParameter("createyear"));
		         pstmt.setString(4, multi.getParameter("address"));
		         pstmt.setString(5, multi.getParameter("homepage"));
		         pstmt.setString(6, multi.getParameter("companytype"));
		         pstmt.setString(7, multi.getParameter("companycontent"));
		         pstmt.setString(8, multi.getParameter("companysize"));
		         pstmt.setString(9, multi.getParameter("comid"));
		         pstmt.setString(10, multi.getParameter("compw"));
		         pstmt.setString(11, filename);
		   
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
		   
		   
		   
		   // 기업의 공고등록
		   // 등록 성공여부에 따라 flag를 반환 (성공시 true 실패시 false  / default는 false)
		   public boolean advercompany(int comseq, CompanyVO vo) {
		      boolean flag = false;
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      String sql = null;
		      try {
		         con = pool.getConnection();
		         sql = "update mjt set recrutype = ? , workcontent = ?, graduate = ?, employcase = ?,"
		         		+ "paytype = ?, severance = ?, worktime = ?, etc = ?, recrusize = ?, "
		         		+ "workarea = ?, career = ?, worktype = ?, insurance = ?, bonus = ?, "
		         		+ "addwork = ?, major = ?, computer = ?, welfare = ?, license = ?, "
		         		+ "facil = ?, treatment = ?, logo = ? where companyseq = ?" ;
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, vo.getRecrutype());
		         pstmt.setString(2, vo.getWorkcontent());
		         pstmt.setString(3, vo.getGraduate());
		         pstmt.setString(4, vo.getEmploycase());
		         pstmt.setString(5, vo.getPaytype());
		         pstmt.setString(6, vo.getSeverance());
		         pstmt.setString(7, vo.getWorktime());
		         pstmt.setString(8, vo.getEtc());
		         pstmt.setInt(9, vo.getRecrusize());
		         pstmt.setString(10, vo.getWorkarea());
		         pstmt.setString(11, vo.getCareer());
		         pstmt.setString(12, vo.getWorktype());
		         pstmt.setString(13, vo.getInsurance());
		         pstmt.setString(14, vo.getBonus());
		         pstmt.setString(15, vo.getAddwork());
		         pstmt.setString(16, vo.getMajor());
		         pstmt.setString(17, vo.getComputer());
		         pstmt.setString(18, vo.getWelfare());
		         pstmt.setString(19, vo.getLicense());
		         pstmt.setString(20, vo.getFacil());
		         pstmt.setString(21, vo.getTreatment());
		         pstmt.setString(22, vo.getLogo());
		         pstmt.setInt(23, comseq);
		         // executeUpdate 의 반환값은 insert,update,delete인 경우, 관련된 레코드의 수를 반환
		         // create, drop, alter인 경우에는 0을 반환
		         // 공고등록에는 1명의 정보를 저장하기 때문에 성공적으로 등록이 되었다면 1을 반환할 것이다.
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
		   
		   
		   // 기업 로그인 메소드
		   public int comlogin(String comid, String compw) {
			   
			   Connection con = null;
			   PreparedStatement pstmt = null;
			   ResultSet rs = null;
			   String sql = null;
			   	// 1 : 이름이 존재하지 않음
			    // 2 : 전화번호가 일치하지 않음
			    // 3 : 로그인 성공
			   int flag = 0;
			   try {
				   con = pool.getConnection();
				   // 입력받은 아이디가 데이터베이스에 존재하는지 확인
				   sql = "select comid, compw from mjt where comid = ?";
				   pstmt = con.prepareStatement(sql);
				   pstmt.setString(1, comid);
				   rs = pstmt.executeQuery();
				   // rs.next()는 다음 행을 하나씩 내려간다는것을 뜻하는 메소드인데 
				   // 다음 행이 아예 없다는것은 쿼리문을 돌려서 나온 레코드 결과값이 0이라는 뜻이고
				   // 그 뜻은 아이디가 없다는 뜻이다. 이때 아이디가 없으면 1을 반환.
				   if(!rs.next()) {
					   flag = 1;
					   return flag;
				   } 
				   // sql문을 돌려 나온 패스워드가 입력받은 패스워드와 일치하는지 확인
			       // 일치하지 않으면 2를 반환
				   else if(!(rs.getString("compw").equals(compw))) {
					   flag = 2;
					   return flag;
				   } else {
					// 아무것도 걸리지 않으면 3을 반환
					   flag = 3;
				   }
			   } catch(Exception e) {
				   e.printStackTrace();
			   } finally {
				   pool.freeConnection(con,pstmt,rs);
			   }
			   return flag;
		   }
		   
		   

}