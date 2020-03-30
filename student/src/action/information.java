package action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import javax.swing.JOptionPane;

import bean.informationBean;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class information extends ActionSupport {

	private static final long serialVersionUID = 1L;
	public String departmentID;
	public String studentID;
	public String name;
	public String sex;
	public String type;
	public String date;
	public String native1;
	public String ID;
	public String address;
	public String birthday;
	public String major;
	public String nation;
	public String phone;
	public String payment;
	public String credit;
	public String remark;
	public String action;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----如果是要增加一个用户---
		if("add".equals(action)){
			String sql="select * from information where studentID=?";
			PreparedStatement preSQLSelect=conn.prepareStatement(sql);
			preSQLSelect.setString(1,studentID);
			ResultSet rs=preSQLSelect.executeQuery();
			if(!rs.next()){//没有这个用户
				sql="insert into information(departmentID,studentID,name,sex,type,date,native,ID,address,birthday,major,nation,phone,payment,credit,remark) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement preSQLInsert=conn.prepareStatement(sql);
				preSQLInsert.setString(1,departmentID);
				preSQLInsert.setString(2,studentID);
				preSQLInsert.setString(3,name);
				preSQLInsert.setString(4,sex);
				preSQLInsert.setString(5,type);
				preSQLInsert.setString(6,date);
				preSQLInsert.setString(7,native1);
				preSQLInsert.setString(8,ID);
				preSQLInsert.setString(9,address);
				preSQLInsert.setString(10,birthday);
				preSQLInsert.setString(11,major);
				preSQLInsert.setString(12,nation);
				preSQLInsert.setString(13,phone);
				preSQLInsert.setString(14,payment);
				preSQLInsert.setString(15,credit);
				preSQLInsert.setString(16,remark);
				preSQLInsert.executeUpdate();
			}
			else {
				JOptionPane.showMessageDialog(null, "该学生已存在","格式错误",JOptionPane.ERROR_MESSAGE);
			}
		}
		//----如果是删除一个用户----
		if("del".equals(action)){
			String sql="delete from information where studentID=?";
			PreparedStatement preSQLDel=conn.prepareStatement(sql);
			preSQLDel.setString(1,studentID);
			preSQLDel.executeUpdate();
		}
		String sql="select * from information";
		Statement state=conn.createStatement();
		ResultSet rs=state.executeQuery(sql);
		ArrayList<information> userArray=new ArrayList<information>();
		while(rs.next()){
			information user=new information();
			user.setDepartmentID(rs.getString("departmentID"));
			user.setStudentID(rs.getString("studentID"));
			user.setName(rs.getString("name"));
			user.setSex(rs.getString("sex"));
			user.setType(rs.getString("type"));
			user.setDate(rs.getString("date"));
			user.setNative(rs.getString("native"));
			user.setID(rs.getString("ID"));
			user.setAddress(rs.getString("address"));
			user.setBirthday(rs.getString("birthday"));
			user.setMajor(rs.getString("major"));
			user.setNation(rs.getString("nation"));
			user.setPhone(rs.getString("phone"));
			user.setPayment(rs.getString("payment"));
			user.setCredit(rs.getString("credit"));
			user.setRemark(rs.getString("remark"));
			userArray.add(user);
		}
		Map<String,ArrayList<information>> request = (Map<String,ArrayList<information>>)ActionContext.getContext().get("request");
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
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID=studentID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex=sex;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type=type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date=date;
	}
	public String getNative() {
		return native1;
	}
	public void setNative(String native1) {
		this.native1=native1;
	}
	public String getID() {
		return ID;
	}
	public void setID(String ID) {
		this.ID=ID;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday=birthday;
	}
	public String getNative1() {
		return native1;
	}
	public void setNative1(String native1) {
		this.native1 = native1;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
