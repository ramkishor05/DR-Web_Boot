package com.work.drdo.domain.questionnaire;
import java.util.Objects;
public class DepartmentZoneKey {

	private String deptName;
	private String zoneName;
	
	  public String getDeptName() {
	        return deptName;
	    }
	 
	    public void setDeptName(String deptName) {
	        this.deptName = deptName;
	    }
	 
	    public String getZoneName() {
	        return zoneName;
	    }
	 
	    public void setZoneName(String zoneName) {
	        this.zoneName = zoneName;
	    }
	 
	    @Override
	    public int hashCode() {
	        
	        return deptName.length();
	    }
	 
	    @Override
	    public boolean equals(Object obj) {
	        if (obj == null) {
	            return false;
	        }
	        if (getClass() != obj.getClass()) {
	            return false;
	        }
	        final DepartmentZoneKey other = (DepartmentZoneKey) obj;
	        if (!Objects.equals(this.deptName, other.deptName)) {
	            return false;
	        }
	        if (!Objects.equals(this.zoneName, other.zoneName)) {
	            return false;
	        }
	        return true;
	    }
	    
	    @Override

	    public String toString() {

	        return "{" + "deptName=" + deptName + ", zoneName=" + zoneName + '}';

	    }
}
