package com.shs.dto;

import java.util.Date;

public class MemberDTO {
	private int Sid;
	private String sname;
	private int sage;
	private String smajor;
	private	String sphone;
	private Date regdate;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	
	public MemberDTO(String sname, int sage, String smajor, String sphone) {
		super();
		this.sname = sname;
		this.sage = sage;
		this.smajor = smajor;
		this.sphone = sphone;
	}


	public MemberDTO(int Sid, String sname, int sage, String smajor, String sphone, Date regdate) {
		super();
		this.Sid = Sid;
		this.sname = sname;
		this.sage = sage;
		this.smajor = smajor;
		this.sphone = sphone;
		this.regdate = regdate;
	}

	public int getSid() {
		return Sid;
	}

	public void setSid(int Sid) {
		this.Sid = Sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getSage() {
		return sage;
	}

	public void setSage(int sage) {
		this.sage = sage;
	}

	public String getSmajor() {
		return smajor;
	}

	public void setSmajor(String smajor) {
		this.smajor = smajor;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [Sid=" + Sid + ", sname=" + sname + ", sage=" + sage + ", smajor=" + smajor + ", sphone="
				+ sphone + ", regdate=" + regdate + "]";
	}
	
}
