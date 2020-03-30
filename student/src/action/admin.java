package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class admin extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String username;
	public String password;
	public int role;
	public String action;
	public ArrayList<admin> stuParamArray;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----查询数据操作----
		String sqlwhere=new String("");
		String sql=new String("");
		if("select".equals(action)){//如果是查询操作
			if(username!=null&&username.trim().length()!=0)
				sqlwhere="where username like '%"+username.trim()+"%' ";
			sql="select * from admin "+sqlwhere;
			Statement state=conn.createStatement();
			ResultSet rs=state.executeQuery(sql);
			ArrayList<admin> stuArray=new ArrayList<admin>();
			while(rs.next()){
				admin stu=new admin();
				stu.setUsername(rs.getString("username"));
				stu.setPassword(rs.getString("password"));
				stu.setRole(rs.getInt("role"));
				stuArray.add(stu);
			}
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("stuArray", stuArray);			
		}
		if(stuParamArray!=null&&"update".equals(action)){
			for(int i=0;i<stuParamArray.size();i++){
					String sqlstr="update admin set role="+stuParamArray.get(i).getRole()+
						" where username='"+stuParamArray.get(i).getUsername()+"'";
					Statement state=conn.createStatement();
					state.executeUpdate(sqlstr);
			}
		}
		db.closeConn(conn);
		return SUCCESS;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public ArrayList<admin> getStuParamArray() {
		return stuParamArray;
	}
	public void setStuParamArray(ArrayList<admin> stuParamArray) {
		this.stuParamArray = stuParamArray;
	}
}
