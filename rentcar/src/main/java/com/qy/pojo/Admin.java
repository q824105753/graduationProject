package com.qy.pojo;

public class Admin {
    private Integer aid;

    private String aname;

    private String apwd;

    private String arealname;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname == null ? null : aname.trim();
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd == null ? null : apwd.trim();
    }

    public String getArealname() {
        return arealname;
    }

    public void setArealname(String arealname) {
        this.arealname = arealname == null ? null : arealname.trim();
    }
}