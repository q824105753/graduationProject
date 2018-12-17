package com.qy.pojo;

public class Car {
    private Integer cid;

    private String cname;

    private Integer c1id;

    private Integer c2id;

    private String platenumber;

    private String buytime;

    private Integer cflag;

    private Double price;

    private String carimg;
    
    private Integer isdel;

    private Integer uid;
    
    private Category1 c1;  //一级分类的对象
    
    private Category2 c2;  //二级分类的对象
    
    
    //分页  ----------------------
    
    private Integer size;   //每页显示的条数
    
    private Integer currentPage;   //从第几条数据开始的

    public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	//分页  ----------------------
	
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Category1 getC1() {
		return c1;
	}

	public void setC1(Category1 c1) {
		this.c1 = c1;
	}

	public Category2 getC2() {
		return c2;
	}

	public void setC2(Category2 c2) {
		this.c2 = c2;
	}

	public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getC1id() {
        return c1id;
    }

    public void setC1id(Integer c1id) {
        this.c1id = c1id;
    }

    public Integer getC2id() {
        return c2id;
    }

    public void setC2id(Integer c2id) {
        this.c2id = c2id;
    }

    public String getPlatenumber() {
        return platenumber;
    }

    public void setPlatenumber(String platenumber) {
        this.platenumber = platenumber == null ? null : platenumber.trim();
    }

    public String getBuytime() {
        return buytime;
    }

    public void setBuytime(String buytime) {
        this.buytime = buytime == null ? null : buytime.trim();
    }

    public Integer getCflag() {
        return cflag;
    }

    public void setCflag(Integer cflag) {
        this.cflag = cflag;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public String getCarimg() {
        return carimg;
    }

    public void setCarimg(String carimg) {
        this.carimg = carimg == null ? null : carimg.trim();
    }

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Car [cid=" + cid + ", cname=" + cname + ", c1id=" + c1id + ", c2id=" + c2id + ", platenumber="
				+ platenumber + ", buytime=" + buytime + ", cflag=" + cflag + ", price=" + price + ", carimg=" + carimg
				+ ", isdel=" + isdel + ", c1=" + c1 + ", c2=" + c2 + ", size=" + size + ", currentPage=" + currentPage
				+ "]";
	}
    
}