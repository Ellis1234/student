package action;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import javax.swing.JOptionPane;

import bean.courseBean;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class course extends ActionSupport {

	private static final long serialVersionUID = 1L;
	public String action;
	public String courseID;
	public String courseNAME;
	public String grade;
	public String hour;
	public String credit;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----如果是要增加一个用户---
		if("add".equals(action)){
			String sql="select * from course where courseID=?";
			PreparedStatement preSQLSelect=conn.prepareStatement(sql);
			preSQLSelect.setString(1,courseID);
			ResultSet rs=preSQLSelect.executeQuery();
			if(!rs.next()){//没有这个用户
				sql="insert into course(courseID,courseNAME,grade,hour,credit) values(?,?,?,?,?)";
				PreparedStatement preSQLInsert=conn.prepareStatement(sql);
				preSQLInsert.setString(1,courseID);
				preSQLInsert.setString(2,courseNAME);
				preSQLInsert.setString(3,grade);
				preSQLInsert.setString(4,hour);
				preSQLInsert.setString(5,credit);
				preSQLInsert.executeUpdate();
			}
			else {
				JOptionPane.showMessageDialog(null, "课程号已存在","格式错误",JOptionPane.ERROR_MESSAGE);
			}
		}
		//----如果是删除一个用户----
		if("del".equals(action)){
			String sql="delete from course where courseID=?";
			PreparedStatement preSQLDel=conn.prepareStatement(sql);
			preSQLDel.setString(1,courseID);
			preSQLDel.executeUpdate();
		}
		//----查询出已有的班级数据----
		String sql="select * from course";
		Statement state=conn.createStatement();
		ResultSet rs=state.executeQuery(sql);
		ArrayList<course> userArray=new ArrayList<course>();
		while(rs.next()){
			course user=new course();
			user.setCourseID(rs.getString("courseID"));
			user.setCourseNAME(rs.getString("courseNAME"));
			user.setGrade(rs.getString("grade"));
			user.setHour(rs.getString("hour"));
			user.setCredit(rs.getString("credit"));
			userArray.add(user);
		}
		Map<String,ArrayList<course>> request = (Map<String,ArrayList<course>>)ActionContext.getContext().get("request");
		request.put("userArray", userArray);
		db.closeConn(conn);
		return SUCCESS;
	}
	public String getCourseID() {
		return courseID;
	}
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public String getCourseNAME() {
		return courseNAME;
	}
	public void setCourseNAME(String courseNAME) {
		this.courseNAME = courseNAME;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
}
