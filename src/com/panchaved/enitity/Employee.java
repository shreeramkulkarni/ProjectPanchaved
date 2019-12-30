package com.panchaved.enitity;

public class Employee {
 private int employeeId;
 private long employeePhone;
 
 public Employee() {
	 
 }
 
public Employee(int employeeId, long employeePhone) {
	super();
	this.employeeId = employeeId;
	this.employeePhone = employeePhone;
}

public int getEmployeeId() {
	return employeeId;
}
public void setEmployeeId(int employeeId) {
	this.employeeId = employeeId;
}
public long getEmployeePhone() {
	return employeePhone;
}
public void setEmployeePhone(long employeePhone) {
	this.employeePhone = employeePhone;
}

@Override
public String toString() {
	return "Employee [employeeId=" + employeeId + ", employeePhone=" + employeePhone + "]";
}
 
}
