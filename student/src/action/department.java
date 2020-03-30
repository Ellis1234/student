package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import javax.swing.JOptionPane;

import bean.departmentBean;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class department extends ActionSupport {

	private static final long serialVersionUID = 1L;
	public String action;
	public String departmentID;
	public String departmentNAME;
	public String departmentHEAD;
	public String address;
	public String number;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----如果是要增加一个用户---
		if("add".equals(action)){
			String sql="select * from department where departmentID=?";
			PreparedStatement preSQLSelect=conn.prepareStatement(sql);
			preSQLSelect.setString(1,departmentID);
			ResultSet rs=preSQLSelect.executeQuery();
			if(!rs.next()){//没有这个用户
				sql="insert into department(departmentID,departmentNAME,departmentHEAD,address,number) values(?,?,?,?,?)";
				PreparedStatement preSQLInsert=conn.prepareStatement(sql);
				preSQLInsert.setString(1,departmentID);
				preSQLInsert.setString(2,departmentNAME);
				preSQLInsert.setString(3,departmentHEAD);
				preSQLInsert.setString(4,address);
				preSQLInsert.setString(5,number);
				preSQLInsert.executeUpdate();
			}
			else {
				JOptionPane.showMessageDialog(null, "院系编号已存在","格式错误",JOptionPane.ERROR_MESSAGE);
			}
		}
		//----如果是删除一个用户----
		if("del".equals(action)){
			String sql="delete from department where departmentID=?";
			PreparedStatement preSQLDel=conn.prepareStatement(sql);
			preSQLDel.setString(1,departmentID);
			preSQLDel.executeUpdate();
		}
		String sql="select * from department";
		Statement state=conn.createStatement();
		ResultSet rs=state.executeQuery(sql);
		ArrayList<department> userArray=new ArrayList<department>();
		while(rs.next()){
			department user=new department();
			user.setDepartmentID(rs.getString("departmentID"));
			user.setDepartmentNAME(rs.getString("departmentNAME"));
			user.setDepartmentHEAD(rs.getString("departmentHEAD"));
			user.setAddress(rs.getString("address"));
			user.setNumber(rs.getString("number"));
			userArray.add(user);
		}
		Map<String,ArrayList<department>> request = (Map<String,ArrayList<department>>)ActionContext.getContext().get("request");
		request.put("userArray", userArray);
		db.closeConn(conn);
		return SUCCESS;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	public String getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}
	public String getDepartmentNAME() {
		return departmentNAME;
	}
	public void setDepartmentNAME(String departmentNAME) {
		this.departmentNAME = departmentNAME;
	}
	public String getDepartmentHEAD() {
		return departmentHEAD;
	}
	public void setDepartmentHEAD(String departmentHEAD) {
		this.departmentHEAD = departmentHEAD;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	

}
