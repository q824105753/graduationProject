package com.qy.pojo;

public class Category2 {
    private Integer c2id;

    private String c2name;

    public Integer getC2id() {
        return c2id;
    }

    public void setC2id(Integer c2id) {
        this.c2id = c2id;
    }

    public String getC2name() {
        return c2name;
    }

    public void setC2name(String c2name) {
        this.c2name = c2name == null ? null : c2name.trim();
    }
}