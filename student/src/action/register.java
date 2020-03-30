package action;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class register extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String username;   
	public String password;
	public String action;
	public String errormsg;
	public int role;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username=username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password=password;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}
	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----如果是要增加一个用户---
		if("register".equals(action)){
			String sql="select * from admin where username=?";
			PreparedStatement preSQLSelect=conn.prepareStatement(sql);
			preSQLSelect.setString(1,username);
			ResultSet rs=preSQLSelect.executeQuery();
			if(!rs.next()){//没有这个用户
				sql="insert into admin(username,password,role) values(?,?,?)";
				PreparedStatement preSQLInsert=conn.prepareStatement(sql);
				preSQLInsert.setString(1,username);
				preSQLInsert.setString(2,password);
				preSQLInsert.setInt(3,role);
				preSQLInsert.executeUpdate();
			}
			else {
				JOptionPane.showMessageDialog(null, "用户名已存在","格式错误",JOptionPane.ERROR_MESSAGE);
			}
		}
		return SUCCESS;
	}
}
