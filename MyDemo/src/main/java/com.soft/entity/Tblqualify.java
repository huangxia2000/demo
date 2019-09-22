package com.soft.entity;

public class Tblqualify {
    private int qno;
    private String qname;
    private String qpeople;
    private String qidcard;
    private String qadress;
    private String qphone;
    private String qschool;
    private String qheath;
    private String qfire;
    private String qorganize;
    private String qtax;
    private String qapplytime;
    private String qapprovetime;
    private int qstate;
    private int qisused;
    //查询时间所需的第二个区间
    //and qapplytime between #{qapplytime} and  #{qapplytime2}
    private String qapplytime2;
    //翻页所需的limit #{page},#{limit}
    private int page;
    private int limit;
    public Tblqualify() {
    }

    public Tblqualify(int qno, String qname, String qpeople, String qidcard, String qadress, String qphone, String qschool, String qheath, String qfire, String qorganize, String qtax, String qapplytime, String qapprovetime, int qstate, int qisused) {
        this.qno = qno;
        this.qname = qname;
        this.qpeople = qpeople;
        this.qidcard = qidcard;
        this.qadress = qadress;
        this.qphone = qphone;
        this.qschool = qschool;
        this.qheath = qheath;
        this.qfire = qfire;
        this.qorganize = qorganize;
        this.qtax = qtax;
        this.qapplytime = qapplytime;
        this.qapprovetime = qapprovetime;
        this.qstate = qstate;
        this.qisused = qisused;
    }

    public Tblqualify(int qno, String qname, String qpeople, String qidcard, String qadress, String qphone, String qschool, String qheath, String qfire, String qorganize, String qtax, String qapplytime, String qapprovetime, int qstate, int qisused, String qapplytime2, int page, int limit) {
        this.qno = qno;
        this.qname = qname;
        this.qpeople = qpeople;
        this.qidcard = qidcard;
        this.qadress = qadress;
        this.qphone = qphone;
        this.qschool = qschool;
        this.qheath = qheath;
        this.qfire = qfire;
        this.qorganize = qorganize;
        this.qtax = qtax;
        this.qapplytime = qapplytime;
        this.qapprovetime = qapprovetime;
        this.qstate = qstate;
        this.qisused = qisused;
        this.qapplytime2 = qapplytime2;
        this.page = page;
        this.limit = limit;
    }

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
    }

    public String getQname() {
        return qname;
    }

    public void setQname(String qname) {
        this.qname = qname;
    }

    public String getQpeople() {
        return qpeople;
    }

    public void setQpeople(String qpeople) {
        this.qpeople = qpeople;
    }

    public String getQidcard() {
        return qidcard;
    }

    public void setQidcard(String qidcard) {
        this.qidcard = qidcard;
    }

    public String getQadress() {
        return qadress;
    }

    public void setQadress(String qadress) {
        this.qadress = qadress;
    }

    public String getQphone() {
        return qphone;
    }

    public void setQphone(String qphone) {
        this.qphone = qphone;
    }

    public String getQschool() {
        return qschool;
    }

    public void setQschool(String qschool) {
        this.qschool = qschool;
    }

    public String getQheath() {
        return qheath;
    }

    public void setQheath(String qheath) {
        this.qheath = qheath;
    }

    public String getQfire() {
        return qfire;
    }

    public void setQfire(String qfire) {
        this.qfire = qfire;
    }

    public String getQorganize() {
        return qorganize;
    }

    public void setQorganize(String qorganize) {
        this.qorganize = qorganize;
    }

    public String getQtax() {
        return qtax;
    }

    public void setQtax(String qtax) {
        this.qtax = qtax;
    }

    public String getQapplytime() {
        return qapplytime;
    }

    public void setQapplytime(String qapplytime) {
        this.qapplytime = qapplytime;
    }

    public String getQapprovetime() {
        return qapprovetime;
    }

    public void setQapprovetime(String qapprovetime) {
        this.qapprovetime = qapprovetime;
    }

    public int getQstate() {
        return qstate;
    }

    public void setQstate(int qstate) {
        this.qstate = qstate;
    }

    public int getQisused() {
        return qisused;
    }

    public void setQisused(int qisused) {
        this.qisused = qisused;
    }

    public String getQapplytime2() {
        return qapplytime2;
    }

    public void setQapplytime2(String qapplytime2) {
        this.qapplytime2 = qapplytime2;
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
