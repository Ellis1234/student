package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import db.db;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class departmentUpdate extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String departmentID;
	public String departmentNAME;
	public String departmentHEAD;
	public String address;
	public String number;
	public String action;
	public ArrayList<departmentUpdate> stuParamArray;
	@Override
	public String execute() throws Exception {
		Connection conn=db.createDBConn();
		//----查询数据操作----
		String sqlwhere=new String("");
		String sql=new String("");
		if("select".equals(action)){//如果是查询操作
			if(departmentID!=null&&departmentID.trim().length()!=0)
				sqlwhere="where departmentID like '%"+departmentID.trim()+"%' ";
			sql="select * from department "+sqlwhere;
			Statement state=conn.createStatement();
			ResultSet rs=state.executeQuery(sql);
			ArrayList<departmentUpdate> stuArray=new ArrayList<departmentUpdate>();
			while(rs.next()){
				departmentUpdate stu=new departmentUpdate();
				stu.setDepartmentID(rs.getString("departmentID"));
				stu.setDepartmentNAME(rs.getString("departmentNAME"));
				stu.setDepartmentHEAD(rs.getString("departmentHEAD"));
				stu.setAddress(rs.getString("address"));
				stu.setNumber(rs.getString("number"));
				stuArray.add(stu);
			}
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("stuArray", stuArray);			
		}	
		if(stuParamArray!=null&&"update".equals(action)){
			for(int i=0;i<stuParamArray.size();i++){
					String sqlstr="update department set departmentNAME='"+stuParamArray.get(i).getDepartmentNAME()+"'"
							+", departmentHEAD='"+stuParamArray.get(i).getDepartmentHEAD()+"'"
							+", address='"+stuParamArray.get(i).getAddress()+"'"
							+", number='"+stuParamArray.get(i).getNumber()+"'"
						+" where departmentID='"+stuParamArray.get(i).getDepartmentID()+"'";
					Statement state=conn.createStatement();
					state.executeUpdate(sqlstr);
			}
		}
		db.closeConn(conn);
		return SUCCESS;
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
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public ArrayList<departmentUpdate> getStuParamArray() {
		return stuParamArray;
	}
	public void setStuParamArray(ArrayList<departmentUpdate> stuParamArray) {
		this.stuParamArray = stuParamArray;
	}
}
