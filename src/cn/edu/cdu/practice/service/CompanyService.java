package cn.edu.cdu.practice.service;

import java.util.List;

import cn.edu.cdu.practice.model.Company;
import cn.edu.cdu.practice.model.MailboxVerification;

/**
  * @Copyright (C), 2017, 成都大学信息科学与工程学院JavaWeb教材编写组.
  * @FileName CompanyService.java
  * @version 1.0
  * @Description: 企业信息管理操作
  * @Author 陈天雄
  * @Date： 2017-4-21:下午2:41:54
  * Modification User： 程序修改时由修改人员编写
  * Modification Date： 程序修改时间
  */
public interface CompanyService {
	/**
	 * <p>Title: registerCompanyInfo</p>
	 * <p>Description: 该接口方法主要处理公司注册</p>
	 * @param company Company实体类的对象引用
	 * @return 返回注册成功与否的标志，成功返回true，失败返回false
	 */
	boolean registerCompanyInfo(String username,String companyName,String mailbox,String password,
			String invideCode,String yzm);
	
	/**
	 * <p>Title: updateCompanyInfo</p>
	 * <p>Description:该接口方法主要处理企业修改注册页面信息 </p>
	 * @param company Company实体类的对象引用
	 * @return 返回修改成功与否的标志，成功返回true，失败返回false
	 */
	boolean updateCompanyInfo(Company company);
	
	
	/**
	 * <p>Title: updatePassword</p>
	 * <p>Description: 该接口方法主要处理修改密码</p>
	 * @param companyName 企业注册的用户名
	 * @param newPassword 企业登录密码
	 * @return 返回修改成功与否的标志，成功返回true，失败返回false
	 */
	boolean updateCompanyPassword(String companyUserName,String newPassword);
	
	/**
	 * <p>Title: queryViryFyCompanys</p>
	 * <p>Description: 查询企业</p>
	 * @param condition 查询条件
	 * @return 返回查询到的企业的集合
	 */
	public List<Company> queryCompanys(String condition);
	/**
	 * <p>Title: deleteCompany</p>
	 * <p>Description: 删除企业信息</p>
	 * @param companyUsername 企业注册时的用户名
	 * @return 返回删除的结果，即true/false
	 */
	boolean deleteCompany(String companyUsername);
	/**
	 * <p>Title: checkCompany</p>
	 * <p>Description:该接口方法主要处理管理员审核企业信息</p>
	 * @param company Company实体类引用对象
	 * @return 返回一个检查完的标志,审核通过返回true,审核不通过返回false
	 */
	boolean checkCompany(Company company);
	
	/**
	 * <p>Title: queryByUserName</p>
	 * <p>Description: 根据注册的用户名查询企业</p>
	 * @param account 注册用户名
	 * @return 公司
	 */
	Company queryByUserName(String account);
	/**
	 * <p>Title: backReview</p>
	 * <p>Description: 退审</p>
	 * @param companyUsername 用户名
	 * @return 返回退审成功与否的标志
	 */
	boolean backReview(Company company);
	
	boolean setMail_verification(MailboxVerification mailboxVerification);
}
