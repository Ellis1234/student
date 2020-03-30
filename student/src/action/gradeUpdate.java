package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import bean.gradeBean;

public class gradeUpdate extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String action;
	public ArrayList<gradeBean> stuParamArray;
	public String studentID;
	public String courseID;
	public String semester;
	public String score;
	public String remark;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----查询数据操作----
		String sqlwhere=new String("");
		String sql=new String("");
		if("select".equals(action)){//如果是查询操作
			if(studentID!=null&&studentID.trim().length()!=0)
				sqlwhere="where studentID like '%"+studentID.trim()+"%' ";
			sql="select * from grade "+sqlwhere;
			Statement state=conn.createStatement();
			ResultSet rs=state.executeQuery(sql);
			ArrayList<gradeBean> stuArray=new ArrayList<gradeBean>();
			while(rs.next()){
				gradeBean stu=new gradeBean();
				stu.setStudentID(rs.getString("studentID"));
				stu.setCourseID(rs.getString("courseID"));
				stu.setSemester(rs.getString("semester"));
				stu.setScore(rs.getString("score"));
				stu.setRemark(rs.getString("remark"));
				stuArray.add(stu);
			}
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("stuArray", stuArray);			
		}
		if(stuParamArray!=null&&"update".equals(action)){
			for(int i=0;i<stuParamArray.size();i++){
					String sqlstr="update grade set semester='"+stuParamArray.get(i).getSemester()+"'"
							+", score='"+stuParamArray.get(i).getScore()+"'"
							+", remark='"+stuParamArray.get(i).getRemark()+"'"
						+" where studentID='"+stuParamArray.get(i).getStudentID()+"'";
					Statement state=conn.createStatement();
					state.executeUpdate(sqlstr);
			}
		}
		db.closeConn(conn);
		return SUCCESS;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public ArrayList<gradeBean> getStuParamArray() {
		return stuParamArray;
	}
	public void setStuParamArray(ArrayList<gradeBean> stuParamArray) {
		this.stuParamArray = stuParamArray;
	}
}