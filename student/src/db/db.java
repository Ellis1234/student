package db;
import java.sql.Connection;
import java.sql.DriverManager;
public class db {
	//�õ����ݿ�����
	public static Connection createDBConn(){
		try{
			 Class.forName("com.mysql.jdbc.Driver");//ͨ����̬����ֱ�ӵ���forName�����������ݿ�����  
	            String url=new String("jdbc:mysql://localhost:3306/test3");//��Ҫ���ӵ����ݿ�˿�  
	            String userString=new String("root");//�����¼���ݿ���û���  
	            String psw=new String("");//�����¼���ݿ������  
	            Connection conn=DriverManager.getConnection(url, userString, psw);//�������ݿ�  
	            return conn;	
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	//�ر����ݿ�����
	public static void closeConn(Connection conn){
		try{
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}