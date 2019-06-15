package cn.edu.cdu.practice.utils;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 * @Copyright (C), 2017, 成都大学信息科学与工程学院JavaWeb教材编写组.
 * @FileName MdPwdUtil.java
 * @version 1.0
 * @Description: MD5加密
 * @Author 陈天雄
 * @Date： 2017-4-18:下午6:43:40
 * Modification User： 程序修改时由修改人员编写
 * Modification Date： 程序修改时间
 */
public class MdPwdUtil {
	 public static String MD5Password(String oldstr) {
		 
	        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'a', 'b', 'c', 'd', 'e', 'f' };
	 
	        byte[] oldbytes = oldstr.getBytes();
	        
	        try {
	        	
	            MessageDigest md = MessageDigest.getInstance("MD5");// 获取对象
	            
	            md.update(oldbytes);// 初始化对象
	            
	            byte[] newBytes = md.digest();// 运行加密算法
	            
	            char[] newStr = new char[32];
	            
	            for (int i = 0; i < 16; i++) {
	            	
	                byte temp = newBytes[i];
	                
	                newStr[2 * i] = hexDigits[temp >>> 4 & 0xf];
	                
	                newStr[2 * i + 1] = hexDigits[temp & 0xf];
	                
	            }
	            
	            return new String(newStr);
	            
	        } catch (NoSuchAlgorithmException e) {
	        	
	            return null;
	            
	        }
	 }
}
