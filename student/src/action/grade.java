package action;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import javax.swing.JOptionPane;

import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class grade extends ActionSupport {

	private static final long serialVersionUID = 1L;
	public String action;
	public String studentID;
	public String courseID;
	public String semester;
	public String score;
	public String remark;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----如果是要增加一个用户---
		if("add".equals(action)){
				String sql="insert into grade(studentID,courseID,semester,score,remark) values(?,?,?,?,?)";
				PreparedStatement preSQLInsert=conn.prepareStatement(sql);
				preSQLInsert.setString(1,studentID);
				preSQLInsert.setString(2,courseID);
				preSQLInsert.setString(3,semester);
				preSQLInsert.setString(4,score);
				preSQLInsert.setString(5,remark);
				preSQLInsert.executeUpdate();
		}
		//----如果是删除一个用户----
		if("del".equals(action)){
			String sql="delete from grade where studentID=?";
			PreparedStatement preSQLDel=conn.prepareStatement(sql);
			preSQLDel.setString(1,studentID);
			preSQLDel.executeUpdate();
		}
		//----查询出已有的成绩数据----
		String sql="select * from grade";
		Statement state=conn.createStatement();
		ResultSet rs=state.executeQuery(sql);
		ArrayList<grade> userArray=new ArrayList<grade>();
		while(rs.next()){
			grade user=new grade();
			user.setStudentID(rs.getString("studentID"));
			user.setCourseID(rs.getString("courseID"));
			user.setSemester(rs.getString("semester"));
			user.setScore(rs.getString("score"));
			user.setRemark(rs.getString("remark"));
			userArray.add(user);
		}
		Map<String,ArrayList<grade>> request = (Map<String,ArrayList<grade>>)ActionContext.getContext().get("request");
		request.put("userArray", userArray);
		db.closeConn(conn);
		return SUCCESS;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getCourseID() {
		return courseID;
	}
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
