package com.hc.pojo;

import java.util.Date;

public class Tender {
    @Override
	public String toString() {
		return "Tender [tenderid=" + tenderid + ", companyid=" + companyid + ", tendername=" + tendername + ", userid="
				+ userid + ", finishtime=" + finishtime + ", finishtime1=" + finishtime1 + ", isdelete=" + isdelete
				+ ", checkid=" + checkid + ", bidid=" + bidid + ", state=" + state + ", detail=" + detail + ", company="
				+ company + ", company1=" + company1 + ", user=" + user + ", check=" + check + ", size=" + size
				+ ", currentPage=" + currentPage + "]";
	}

	private Long tenderid;

	private Long companyid;

    private String tendername;

    private Long userid;

    private String finishtime;
    
    private String finishtime1;

    private Integer isdelete;

    private Integer checkid;

    private Long bidid;

    private Integer state;

    private String detail;
    
    private Company company;
    
    private Notice notice;
    
    private Company company1;
    
    private User user;
    
    private Check check;
    
    //分页-----------------------
    
    private Integer size;    //每页显示的条数
    
    private Integer currentPage;     //从第几条数据开始
     
    public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

    //分页-----------------------

    public String getFinishtime1() {
		return finishtime1;
	}

	public void setFinishtime1(String finishtime1) {
		this.finishtime1 = finishtime1;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Long getTenderid() {
        return tenderid;
    }

    public void setTenderid(Long tenderid) {
        this.tenderid = tenderid;
    }

    public Long getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Long companyid) {
        this.companyid = companyid;
    }

    public Company getCompany1() {
		return company1;
	}

	public void setCompany1(Company company1) {
		this.company1 = company1;
	}

	public String getTendername() {
        return tendername;
    }

    public void setTendername(String tendername) {
        this.tendername = tendername == null ? null : tendername.trim();
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Integer getCheckid() {
        return checkid;
    }

    public void setCheckid(Integer checkid) {
        this.checkid = checkid;
    }

    public Long getBidid() {
        return bidid;
    }

    public void setBidid(Long bidid) {
        this.bidid = bidid;
    }

	public String getFinishtime() {
		return finishtime;
	}

	public void setFinishtime(String finishtime) {
		this.finishtime = finishtime;
	}

	public Integer getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Check getCheck() {
		return check;
	}

	public void setCheck(Check check) {
		this.check = check;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	
}