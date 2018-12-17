package com.hc.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long userid;

    private String name;

    private String uname;

    private String pwd; 

    private Integer sex;

    private String tel;

    private String email;

    private Integer isdelete;

    private String createtime;
    
    private String createtime1;
    
    private Integer flag;
    
    
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

    public String getCreatetime1() {
		return createtime1;
	}

	public void setCreatetime1(String createtime1) {
		this.createtime1 = createtime1;
	}

	public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    

    public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", name=" + name + ", uname=" + uname + ", pwd=" + pwd + ", sex=" + sex
				+ ", tel=" + tel + ", email=" + email + ", isdelete=" + isdelete + ", createtime=" + createtime
				+ ", flag=" + flag + "]";
	}


	
	
	

    
}