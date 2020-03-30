package action;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class login extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public int id;
	public String username;   
	public String password;
	public String action;
	public String errormsg;  
    
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
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String execute() {
		if("login".equals(action)){
			try{
				Connection conn=db.createDBConn();
				String sql="select * from admin where username=? and password=?";
				PreparedStatement state=conn.prepareStatement(sql);
				
				state.setString(1,username);
				state.setString(2,password);
				ResultSet rs=state.executeQuery();
				if(rs.next()){
					ActionContext.getContext().getSession().put("username",username);
					ActionContext.getContext().getSession().put("password",password);
					ActionContext.getContext().getSession().put("role",rs.getString("role"));
					db.closeConn(conn);//关闭数据库连接
					return SUCCESS;
				}else{
					JOptionPane.showMessageDialog(null, "账号密码错误","格式错误",JOptionPane.ERROR_MESSAGE);				
				}	
				db.closeConn(conn);
			}catch(Exception e){
				errormsg=new String("数据库连接有误");
			}	
		}
		return INPUT;  
	}

}