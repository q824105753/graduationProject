package com.qy.pojo;

import java.util.Date;

public class Order {
    private Integer oid;

    private Integer uid;

    private Integer cid;

    private Integer oflag;

    private String otime;

    private String begin;

    private String end;
    
    private String otime1;
    
    private String begin1;

    private String end1;

    private Double totalprice;

    private String note;
    
    private User user;
    
    private Car car;
    
    private Integer daycount;

    public Integer getDaycount() {
		return daycount;
	}

	public void setDaycount(Integer daycount) {
		this.daycount = daycount;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getOflag() {
        return oflag;
    }

    public void setOflag(Integer oflag) {
        this.oflag = oflag;
    }

   

    public String getOtime() {
		return otime;
	}

	public void setOtime(String otime) {
		this.otime = otime;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

	public String getOtime1() {
		return otime1;
	}

	public void setOtime1(String otime1) {
		this.otime1 = otime1;
	}

	public String getBegin1() {
		return begin1;
	}

	public void setBegin1(String begin1) {
		this.begin1 = begin1;
	}

	public String getEnd1() {
		return end1;
	}

	public void setEnd1(String end1) {
		this.end1 = end1;
	}
    
    
}