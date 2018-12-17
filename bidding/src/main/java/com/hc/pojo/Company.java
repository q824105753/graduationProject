package com.hc.pojo;

public class Company {
    private Long companyid;

    private String companyname;

    private Long addressid;

    private String tel;

    private Long userid;
    
    private Address address;
    
    private User user;
    
    //分页-----------------------
    
    private int size=8;    //每页显示的条数
    
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
	


	public Long getCompanyid() {
		return companyid;
	}

	public void setCompanyid(Long companyid) {
		this.companyid = companyid;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public Long getAddressid() {
		return addressid;
	}

	public void setAddressid(Long addressid) {
		this.addressid = addressid;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
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

	public void setSize(int size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "Company [companyid=" + companyid + ", companyname=" + companyname + ", addressid=" + addressid
				+ ", tel=" + tel + ", userid=" + userid + ", address=" + address + ", user=" + user + ", size=" + size
				+ ", currentPage=" + currentPage + "]";
	}

    
}