package test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import cn.edu.cdu.practice.dao.impl.StudentDaoImpl;
import cn.edu.cdu.practice.model.Student;
import cn.edu.cdu.practice.service.impl.StudentServiceImpl;

/** 
* @author  作者 E-mail: 
* @date 创建时间：2017年4月19日 下午1:03:01 
* @FileName:TestStudentDao.java
* @version 1.0 
* @Description: 学生信息管理中Dao层测试 
* @Author: 刘永红
* @Modification User:
* @Modification Date:下午1:03:01
*/
public class TestStudentDao {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	/*
	@Test
	public void testStudentInsert(){
		Student stu=new Student();
		stu.setNo("201401");
		stu.setName("张山");
		stu.setGrade(2014);
		stu.setLevel("见习");
		stu.setProfessional("软件工程");
		stu.setGender("男");
		stu.setClass_("3班");
		stu.setPassword("123");
		stu.setMailbox("123@qq.com");
		stu.setSubjectBackground(null);
		stu.setLearningExperience(null);
		stu.setResearchDirection(null);
		StudentDaoImpl stuDI=new StudentDaoImpl();
		stuDI.insert(stu);
	}
	*/
	@Test
	public void testQuery(){
		List<Student> list=null;
		//Student student=new Student();
		//StudentDaoImpl stuDI=new StudentDaoImpl();
		StudentServiceImpl stuSI=new StudentServiceImpl();
		//list=stuDI.findByCompany("中云测");
		//list=stuDI.findByMajor("自动化(本)");
		//student=stuDI.findById("201401");
		//list=stuDI.findByYear(2017);
		list=stuSI.findByYear(2017);
		
		if(list.size()>0)
			for(int i=0;i<list.size();i++){
				System.out.println("找到的学生有：\n"+list.get(i).getName());
			}
		else
			System.out.println("没找到指定学生!");		
			
		/*
		if(student!=null){
			System.out.println("找到的学生有：\n"+student.getName());
		}else
			System.out.println("没找到指定学生!");
	    */
	}
	/*
	@Test
	public void testStudentUpdate(){
		Student stu=new Student();
		stu.setNo("201401");
		stu.setName("张小山");
		stu.setGrade(2014);
		stu.setLevel("概念实习");
		stu.setProfessional("软件工程(本)");
		stu.setGender("男");
		stu.setClass_("3班");
		stu.setPassword("123");
		stu.setMailbox("123@qq.com");
		stu.setSubjectBackground("软件工程本科学历");
		stu.setLearningExperience(null);
		stu.setResearchDirection(null);
		StudentDaoImpl stuDI=new StudentDaoImpl();
		stuDI.update(stu);
	}*/
	/*
	@Test
	public void testDelete(){
		String id="1";
		StudentDaoImpl stuDI=new StudentDaoImpl();
		boolean b=stuDI.delete(id);
		
		if(b)
			System.out.println("删除成功！");
		else
			System.out.println("删除失败!");
	}*/

}
