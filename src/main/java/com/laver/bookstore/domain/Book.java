package com.laver.bookstore.domain;

import java.util.Date;


public class Book {
    private Integer bid;

    private String bname;

    private String detail;

    private String pirce;

    private String writer;

    private String printer;

    private Date date;

    private String type;

    private String image;

    private Integer store;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getPirce() {
        return pirce;
    }

    public void setPirce(String pirce) {
        this.pirce = pirce == null ? null : pirce.trim();
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer == null ? null : writer.trim();
    }

    public String getPrinter() {
        return printer;
    }

    public void setPrinter(String printer) {
        this.printer = printer == null ? null : printer.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getStore() {
        return store;
    }

    public void setStore(Integer store) {
        this.store = store;
    }

	@Override
	public int hashCode() {
		return this.getBid()+this.getBname().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if(this==obj)
		{
			return true;
		}
		if(obj instanceof Book)
		{
			Book i = (Book)obj;
			if(this.getBid()==i.getBid()&&this.getBname().equals(i.getBname()))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + "]";
	}
    
}