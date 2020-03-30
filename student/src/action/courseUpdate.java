package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import bean.courseBean;

public class courseUpdate extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String action;
	public ArrayList<courseBean> stuParamArray;
	public String courseID;
	public String courseNAME;
	public String grade;
	public String hour;
	public String credit;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----查询数据操作----
		String sqlwhere=new String("");
		String sql=new String("");
		if("select".equals(action)){//如果是查询操作
			if(courseID!=null&&courseID.trim().length()!=0)
				sqlwhere="where courseID like '%"+courseID.trim()+"%' ";
			sql="select * from course "+sqlwhere;
			Statement state=conn.createStatement();
			ResultSet rs=state.executeQuery(sql);
			ArrayList<courseBean> stuArray=new ArrayList<courseBean>();
			while(rs.next()){
				courseBean stu=new courseBean();
				stu.setCourseID(rs.getString("courseID"));
				stu.setCourseNAME(rs.getString("courseNAME"));
				stu.setGrade(rs.getString("grade"));
				stu.setHour(rs.getString("hour"));
				stu.setCredit(rs.getString("credit"));
				stuArray.add(stu);
			}
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("stuArray", stuArray);			
		}
		if(stuParamArray!=null&&"update".equals(action)){
			for(int i=0;i<stuParamArray.size();i++){
					String sqlstr="update course set courseNAME='"+stuParamArray.get(i).getCourseNAME()+"'"
							+", grade='"+stuParamArray.get(i).getGrade()+"'"
							+", hour='"+stuParamArray.get(i).getHour()+"'"
							+", credit='"+stuParamArray.get(i).getCredit()+"'"
						+" where courseID='"+stuParamArray.get(i).getCourseID()+"'";
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
	public ArrayList<courseBean> getStuParamArray() {
		return stuParamArray;
	}
	public void setStuParamArray(ArrayList<courseBean> stuParamArray) {
		this.stuParamArray = stuParamArray;
	}
}