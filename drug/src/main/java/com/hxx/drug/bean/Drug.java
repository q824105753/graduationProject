package com.hxx.drug.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.persistence.criteria.CriteriaBuilder;
@Entity
public class Drug {
    @Id
    @GeneratedValue
    private Integer did;

    private String dname;

    private Integer isDel;

    private Double dprice;

    private String produceDate;

    private Integer useTime;

    private Integer cid;

    private Integer bid;

    private String dsize;

    private String remark;

    private String component;
    @Transient
    private Category category;
    @Transient
    private Business business;

    //分页  ----------------------

    private Integer size;   //每页显示的条数

    private Integer currentPage;   //从第几条数据开始的

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

    //分页  ----------------------

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Double getDprice() {
        return dprice;
    }

    public void setDprice(Double dprice) {
        this.dprice = dprice;
    }

    public String getProduceDate() {
        return produceDate;
    }

    public void setProduceDate(String produceString) {
        this.produceDate = produceString;
    }

    public Integer getUseTime() {
        return useTime;
    }

    public void setUseTime(Integer useTime) {
        this.useTime = useTime;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getDsize() {
        return dsize;
    }

    public void setDsize(String dsize) {
        this.dsize = dsize == null ? null : dsize.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component == null ? null : component.trim();
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }
}