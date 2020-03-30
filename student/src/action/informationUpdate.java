package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import bean.informationBean;

public class informationUpdate extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String action;
	public ArrayList<informationBean> stuParamArray;
	public String departmentID;
	public String studentID;
	public String name;
	public String address;
	public String payment;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----查询数据操作----
		String sqlwhere=new String("");
		String sql=new String("");
		if("select".equals(action)){//如果是查询操作
			if(studentID!=null&&studentID.trim().length()!=0)
				sqlwhere="where studentID like '%"+studentID.trim()+"%' ";
			sql="select * from information "+sqlwhere;
			Statement state=conn.createStatement();
			ResultSet rs=state.executeQuery(sql);
			ArrayList<informationBean> stuArray=new ArrayList<informationBean>();
			while(rs.next()){
				informationBean stu=new informationBean();
				stu.setDepartmentID(rs.getString("departmentID"));
				stu.setStudentID(rs.getString("studentID"));
				stu.setName(rs.getString("name"));
				stu.setAddress(rs.getString("address"));
				stu.setPayment(rs.getString("payment"));
				stuArray.add(stu);
			}
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("stuArray", stuArray);			
		}
		if(stuParamArray!=null&&"update".equals(action)){
			for(int i=0;i<stuParamArray.size();i++){
					String sqlstr="update information set name='"+stuParamArray.get(i).getName()+"'"
							+", address='"+stuParamArray.get(i).getAddress()+"'"
							+", payment='"+stuParamArray.get(i).getPayment()+"'"
						+" where studentID='"+stuParamArray.get(i).getStudentID()+"'";
					Statement state=conn.createStatement();
					state.executeUpdate(sqlstr);
			}
		}
		db.closeConn(conn);
		return SUCCESS;
	}
	public ArrayList<informationBean> getStuParamArray() {
		return stuParamArray;
	}
	public void setStuParamArray(ArrayList<informationBean> stuParamArray) {
		this.stuParamArray = stuParamArray;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
}