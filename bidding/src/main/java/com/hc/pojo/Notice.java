package com.hc.pojo;

import java.util.Date;

public class Notice {
    private Long noticeid;

    private Long companyid;

    private String noticebegintime;

    private String noticestoptime;

    private Long addressid;

    private String itemname;

    private Long userid;

    private Integer isissue;

    private String createtime;

    private Integer isdelete;
    
    private String detail;
    
    private Company company;
    
    private User user;
    
    private Address address;
    
    private String noticebegintime1;

    private String noticestoptime1;
    
    private String createtime1;
    
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

    public String getNoticebegintime1() {
		return noticebegintime1;
	}

	public void setNoticebegintime1(String noticebegintime1) {
		this.noticebegintime1 = noticebegintime1;
	}

	public String getNoticestoptime1() {
		return noticestoptime1;
	}

	public void setNoticestoptime1(String noticestoptime1) {
		this.noticestoptime1 = noticestoptime1;
	}

	public String getCreatetime1() {
		return createtime1;
	}

	public void setCreatetime1(String createtime1) {
		this.createtime1 = createtime1;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Long getNoticeid() {
        return noticeid;
    }

    public void setNoticeid(Long noticeid) {
        this.noticeid = noticeid;
    }

    public Long getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Long companyid) {
        this.companyid = companyid;
    }

   

    public Long getAddressid() {
        return addressid;
    }

    public void setAddressid(Long addressid) {
        this.addressid = addressid;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname == null ? null : itemname.trim();
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }
    
    public Integer getIsissue() {
		return isissue;
	}

	public void setIsissue(Integer isissue) {
		this.isissue = isissue;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	public String getNoticebegintime() {
		return noticebegintime;
	}

	public void setNoticebegintime(String noticebegintime) {
		this.noticebegintime = noticebegintime;
	}

	public String getNoticestoptime() {
		return noticestoptime;
	}

	public void setNoticestoptime(String noticestoptime) {
		this.noticestoptime = noticestoptime;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Integer getIsdelete() {
		return isdelete;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}