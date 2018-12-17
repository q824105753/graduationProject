package com.hc.pojo;

import java.util.Date;

public class Compact {
    private Long compactid;

    private String starttime;

    private String stoptime;

    private Double money;

    private Integer state;

    private String createtime;

    private Long tenderid;

    private String message;

    public Long getCompactid() {
        return compactid;
    }

    public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getStoptime() {
		return stoptime;
	}

	public void setStoptime(String stoptime) {
		this.stoptime = stoptime;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public void setCompactid(Long compactid) {
        this.compactid = compactid;
    }

   
    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
    public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

    public Long getTenderid() {
        return tenderid;
    }

    public void setTenderid(Long tenderid) {
        this.tenderid = tenderid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }
}