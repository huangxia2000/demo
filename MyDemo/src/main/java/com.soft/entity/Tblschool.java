package com.soft.entity;

public class Tblschool {
    private String sid;
    private String spwd;
    private String sname;
    private String stime;
    private String sdelete;
    private String sstate;
    //查询时间所需的第二个区间
    //and stime between #{stime} and  #{stime2}
    private String stime2;
    //翻页所需的limit #{page},#{limit}
    private int page;
    private int limit;

    public Tblschool() {

    }

    public Tblschool(String sid, String spwd, String sname, String stime, String sdelete, String sstate, String stime2, int page, int limit) {
        this.sid = sid;
        this.spwd = spwd;
        this.sname = sname;
        this.stime = stime;
        this.sdelete = sdelete;
        this.sstate = sstate;
        this.stime2 = stime2;
        this.page = page;
        this.limit = limit;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSpwd() {
        return spwd;
    }

    public void setSpwd(String spwd) {
        this.spwd = spwd;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime;
    }

    public String getSdelete() {
        return sdelete;
    }

    public void setSdelete(String sdelete) {
        this.sdelete = sdelete;
    }

    public String getSstate() {
        return sstate;
    }

    public void setSstate(String sstate) {
        this.sstate = sstate;
    }

    public String getStime2() {
        return stime2;
    }

    public void setStime2(String stime2) {
        this.stime2 = stime2;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
