package com.panchaved.enitity;

public class Login {
	private long userID;
	private String password;
	private String securityQuestion;
	private String securityAnswer;
	private String handlerType;
	
	public Login() {
		// TODO Auto-generated constructor stub
	}
	
	public Login(long userID, String password, String securityQuestion, String securityAnswer, String handlerType) {
		super();
		this.userID = userID;
		this.password = password;
		this.securityQuestion = securityQuestion;
		this.securityAnswer = securityAnswer;
		this.handlerType = handlerType;
	}

	public long getUserID() {
		return userID;
	}

	public void setUserID(long userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getSecurityAnswer() {
		return securityAnswer;
	}

	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}

	public String getHandlerType() {
		return handlerType;
	}

	public void setHandlerType(String handlerType) {
		this.handlerType = handlerType;
	}
	
	
	
	
}
