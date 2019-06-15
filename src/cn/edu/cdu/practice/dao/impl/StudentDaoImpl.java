package cn.edu.cdu.practice.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import cn.edu.cdu.practice.dao.StudentDao;
import cn.edu.cdu.practice.model.Student;
import cn.edu.cdu.practice.utils.DbUtils;
import cn.edu.cdu.practice.utils.EmailUtils;
import cn.edu.cdu.practice.utils.IdentifyCodeUtils;

/** 
* @author  作者 E-mail: lyh_ht@163.com
* @date 创建时间：2017年4月17日 下午3:20:49 
* @FileName:StudentDaoImpl.java
* @version 1.0 
* @Description: StudentDao接口的实现类  
* @Author: 刘永红
* @Modification User:
* @Modification Date:下午3:20:49
*/
public class StudentDaoImpl implements StudentDao {
	/**
	 * 插入一个学生记录
	 * @param: student 一个学生实体
	 * @return: true 插入成功；false 插入失败
	 */
	@Override
	public boolean insert(Student student) {
		Connection conn = DbUtils.getConnection();
		PreparedStatement pstmt = null;
		String sql="insert into student values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			//关闭自动提交
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, student.getNo());
			pstmt.setString(2, student.getName());
			pstmt.setInt(3, student.getGrade());
			pstmt.setString(4, student.getLevel());
			pstmt.setString(5, student.getProfessional());
			pstmt.setString(6, student.getGender());
			pstmt.setString(7, student.getClass_());
			pstmt.setString(8, student.getPassword());
			pstmt.setString(9, student.getMailbox());
			pstmt.setString(10, student.getSubjectBackground());
			pstmt.setString(11, student.getLearningExperience());
			pstmt.setString(12, student.getResearchDirection());
			//执行sql语句
			pstmt.executeUpdate();
			//事务提交
			conn.commit();
					
		} catch(SQLException e){
			e.printStackTrace();
			return false;
		} finally{
			DbUtils.closeConnection(conn, pstmt, null);
		}		
		return true;
	}

	/**
	 * 查询所有学生记录
	 * @return: 所有学生实体列表
	 */
	@Override
	public List<Student> findAll() {
		Connection conn=DbUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Student> list=new ArrayList<Student>();
		String sql="select * from student";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setNo(rs.getString("No"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getInt("grade"));
				student.setLevel(rs.getString("level"));
				student.setProfessional(rs.getString("professional"));
				student.setGender(rs.getString("gender"));
				student.setClass_(rs.getString("class"));
				student.setPassword(rs.getString("password"));
				student.setMailbox(rs.getString("mailbox"));
				student.setSubjectBackground(rs.getString("subject_background"));
				student.setLearningExperience(rs.getString("learning_experience"));
				student.setResearchDirection(rs.getString("research_direction"));
				list.add(student);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeConnection(conn, pstmt, rs);
		}		
		return list;
	}

	/**
	 * 查询指定学号学生记录
	 * @param id 学号
	 * @return 查到学生实体
	 */
	@Override
	public Student findById(String id) {
		Connection conn=DbUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Student student=new Student();
		String sql="select * from student where No=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				student.setNo(rs.getString("No"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getInt("grade"));
				student.setLevel(rs.getString("level"));
				student.setProfessional(rs.getString("professional"));
				student.setGender(rs.getString("gender"));
				student.setClass_(rs.getString("class"));
				student.setPassword(rs.getString("password"));
				student.setMailbox(rs.getString("mailbox"));
				student.setSubjectBackground(rs.getString("subject_background"));
				student.setLearningExperience(rs.getString("learning_experience"));
				student.setResearchDirection(rs.getString("research_direction"));
			}else{
				student = null;
			}
		}catch(SQLException e){
			e.printStackTrace();
			student = null;
		}finally{
			DbUtils.closeConnection(conn, pstmt, rs);
		}		
		return student;
	}

	/**
	 * 查询已选/未选学生（涉及多表查询，学生表+方案选择表）
	 * @param flag：1，查询已选学生；2，查询未选学生
	 * @return 查到学生实体列表 
	 */
	@Override
	public List<Student> findBySelected(int flag) {
		Connection conn=DbUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Student> list=new ArrayList<Student>();		
		String sql=null;
		if(flag==1)
			sql="select * from student  "
					+ "where No in (select studentNo from project_select )";
		else if(flag==2)
			sql="select * from student  "
					+ "where No not in (select studentNo from project_select )";
		else{
			DbUtils.closeConnection(conn, pstmt, rs);
			return null;
		}
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setNo(rs.getString("No"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getInt("grade"));
				student.setLevel(rs.getString("level"));
				student.setProfessional(rs.getString("professional"));
				student.setGender(rs.getString("gender"));
				student.setClass_(rs.getString("class"));
				student.setPassword(rs.getString("password"));
				student.setMailbox(rs.getString("mailbox"));
				student.setSubjectBackground(rs.getString("subject_background"));
				student.setLearningExperience(rs.getString("learning_experience"));
				student.setResearchDirection(rs.getString("research_direction"));
				list.add(student);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeConnection(conn, pstmt, rs);
		}		
		return list;
	}

	/**
	 * 管理员根据企业名称查询学生信息
	 * @param companyName 企业名称
	 * @return 查找到学生实体列表
	 */
	@Override
	public List<Student> findByCompany(String companyName) {
		Connection conn=DbUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Student> list=new ArrayList<Student>();		
		String sql="select * from student  "
				+ "where no in (select studentNo from project_select "
				+ "where company_name=?)";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, companyName);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setNo(rs.getString("No"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getInt("grade"));
				student.setLevel(rs.getString("level"));
				student.setProfessional(rs.getString("professional"));
				student.setGender(rs.getString("gender"));
				student.setClass_(rs.getString("class"));
				student.setPassword(rs.getString("password"));
				student.setMailbox(rs.getString("mailbox"));
				student.setSubjectBackground(rs.getString("subject_background"));
				student.setLearningExperience(rs.getString("learning_experience"));
				student.setResearchDirection(rs.getString("research_direction"));
				list.add(student);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			new DbUtils().closeConnection(conn, pstmt, rs);
		}		
		return list;		
	}

	/**
	 * 查询指定年级的学生记录
	 * @param grade 年级
	 * @return 查到学生实体列表
	 */
	@Override
	public List<Student> findByGrade(int grade) {
		Connection conn=DbUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Student> list=new ArrayList<Student>();		
		String sql="select * from student where grade=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, grade);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setNo(rs.getString("No"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getInt("grade"));
				student.setLevel(rs.getString("level"));
				student.setProfessional(rs.getString("professional"));
				student.setGender(rs.getString("gender"));
				student.setClass_(rs.getString("class"));
				student.setPassword(rs.getString("password"));
				student.setMailbox(rs.getString("mailbox"));
				student.setSubjectBackground(rs.getString("subject_background"));
				student.setLearningExperience(rs.getString("learning_experience"));
				student.setResearchDirection(rs.getString("research_direction"));
				list.add(student);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeConnection(conn, pstmt, rs);
		}		
		return list;		
	}

	/**
	 * 查询指定专业的学生
	 * @param major 专业名称
	 * @return 查到学生实体列表
	 */
	@Override
	public List<Student> findByMajor(String major) {
		Connection conn=DbUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Student> list=new ArrayList<Student>();		
		String sql="select * from student where professional=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, major);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setNo(rs.getString("No"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getInt("grade"));
				student.setLevel(rs.getString("level"));
				student.setProfessional(rs.getString("professional"));
				student.setGender(rs.getString("gender"));
				student.setClass_(rs.getString("class"));
				student.setPassword(rs.getString("password"));
				student.setMailbox(rs.getString("mailbox"));
				student.setSubjectBackground(rs.getString("subject_background"));
				student.setLearningExperience(rs.getString("learning_experience"));
				student.setResearchDirection(rs.getString("research_direction"));
				list.add(student);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeConnection(conn, pstmt, rs);
		}		
		return list;	
	}

	/**
	 * 管理员按年度查询学生记录（方案号中隐含年度）
	 * @param year 年度
	 * @return 查到学生实体列表
	 */
	@Override
	public List<Student> findByYear(int year) {
		Connection conn=DbUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Student> list=new ArrayList<Student>();		
		String sql="select * from student where No in"
				+ "(SELECT studentNo from project_select where projectNo like ?)";
		try{
			String strYear=""+year+"%";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, strYear);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setNo(rs.getString("No"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getInt("grade"));
				student.setLevel(rs.getString("level"));
				student.setProfessional(rs.getString("professional"));
				student.setGender(rs.getString("gender"));
				student.setClass_(rs.getString("class"));
				student.setPassword(rs.getString("password"));
				student.setMailbox(rs.getString("mailbox"));
				student.setSubjectBackground(rs.getString("subject_background"));
				student.setLearningExperience(rs.getString("learning_experience"));
				student.setResearchDirection(rs.getString("research_direction"));
				list.add(student);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeConnection(conn, pstmt, rs);
		}		
		return list;

	}

	@Override
	public List<Student> findByProcdure(String procdure) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean findByProcdure(String procdure, Object[] params) {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * 更新学生记录
	 * @param student 一个学生实体
	 * @return true:成功；false：失败 
	 */
	@Override
	public boolean update(Student student) {
		Connection conn = DbUtils.getConnection();
		PreparedStatement pstmt = null;
		String sql="update student set name=?,grade=?,level=?,professional=?,"
				+ "gender=?,class=?,password=?,mailbox=?,subject_background=?,"
				+ "learning_experience=?,research_direction=? where No=?";
		try{
			//关闭自动提交
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, student.getName());
			pstmt.setInt(2, student.getGrade());
			pstmt.setString(3, student.getLevel());
			pstmt.setString(4, student.getProfessional());
			pstmt.setString(5, student.getGender());
			pstmt.setString(6, student.getClass_());
			pstmt.setString(7, student.getPassword());
			pstmt.setString(8, student.getMailbox());
			pstmt.setString(9, student.getSubjectBackground());
			pstmt.setString(10, student.getLearningExperience());
			pstmt.setString(11, student.getResearchDirection());
			pstmt.setString(12, student.getNo());
			//执行sql语句
			pstmt.executeUpdate();
			//事务提交
			conn.commit();
					
		} catch(SQLException e){
			e.printStackTrace();
			return false;
		} finally{
			DbUtils.closeConnection(conn, pstmt, null);
		}		
		return true;
	}

	/**
	 * 更新学生的邮箱
	 * 
	 * 于曦
	 */
	public String updateEmail(String role, String account, String mbemail) {
		Connection con = (Connection) DbUtils.getConnection();
		String sql = "";
		ResultSet rs = null;
		int resultNum = 0;
		PreparedStatement ps = null;
		System.out.println("updateemail:"+role + account);
		try {
			//检查学生表里该登录用户是否有密保邮箱
			sql = "select * from student where No=?"; 
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, account);
			System.out.println(ps.toString());
			rs = ps.executeQuery();
			String mailbox = "";
			//获取该用户的密保邮箱
			while(rs.next()){
				mailbox = rs.getString("mailbox");
			}
			//如果该用户的密保邮箱为空或与输入的密保邮箱不同，则向用户输入的密保邮箱发送验证码
			if(mailbox.equals("") || !mailbox.equals(mbemail)){
				String identifyCode = IdentifyCodeUtils.getCode();
				Boolean emailSuccess = EmailUtils.sendMail(mbemail, Integer.parseInt(role),identifyCode);
				//如果验证码发送成功，则更新该记录的密保邮箱
				if(emailSuccess){
					sql = "update student set mailbox = ? where No = ?";
					ps = (PreparedStatement) con.prepareStatement(sql);
					ps.setString(1, mbemail);
					ps.setString(2, account);
					resultNum = ps.executeUpdate();
					//如果更新成功，则向页面输出验证码，否则，提示用户更新失败
					if(resultNum == 1){
						return identifyCode;
					}else {
						return "密保邮箱更新失败！";
					}
				//如果验证码发送失败，则提示用户输入邮箱有问题。
				}else{
					return "您输入的邮箱无法接受邮件，请检查您的输入！";
				}	
			//如果该用户的密保邮箱不为空且输入的密保邮箱与用户自身的邮箱一样，就直接向该用户的密保邮箱发送验证码
			}else{
				String identifyCode = IdentifyCodeUtils.getCode();
				EmailUtils.sendMail(mbemail, Integer.parseInt(role),identifyCode);
				return identifyCode;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtils.closeConnection(con, ps, rs);
		}
		return "";
	}
	/**
	 * 删除指定学生
     * @param id 学号
     * @return true 删除成功；false 删除失败
	 */
	@Override
	public boolean delete(String id) {
		Connection conn = DbUtils.getConnection();
		PreparedStatement pstmt = null;
		String sql="delete from student where No=?";
		try{
			//关闭自动提交
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			//执行sql语句
			pstmt.executeUpdate();
			//事务提交
			conn.commit();
					
		} catch(SQLException e){
			e.printStackTrace();
			return false;
		} finally{
			DbUtils.closeConnection(conn, pstmt, null);
		}		
		return true;
	}

	@Override
	public boolean importStudent(List<Student> list) {
		Connection conn = DbUtils.getConnection();
		PreparedStatement pstmt = null;
		String sql="insert into student values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			//关闭自动提交
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			for(Student student : list) {
				pstmt.setString(1, student.getNo());
				pstmt.setString(2, student.getName());
				pstmt.setInt(3, student.getGrade());
				pstmt.setString(4, student.getLevel());
				pstmt.setString(5, student.getProfessional());
				pstmt.setString(6, student.getGender());
				pstmt.setString(7, student.getClass_());
				pstmt.setString(8, student.getPassword());
				pstmt.setString(9, student.getMailbox());
				pstmt.setString(10, student.getSubjectBackground());
				pstmt.setString(11, student.getLearningExperience());
				pstmt.setString(12, student.getResearchDirection());
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			//事务提交
			conn.commit();
			System.out.println("成功");
					
		} catch(SQLException e){
			e.printStackTrace();
			return false;
		} finally{
			DbUtils.closeConnection(conn, pstmt, null);
		}		
		return true;
	}

	@Override
	public boolean exportStudent(String fileName) {
		// TODO Auto-generated method stub
		return false;
	}

}
