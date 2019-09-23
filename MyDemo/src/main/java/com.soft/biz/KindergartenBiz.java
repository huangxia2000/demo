package com.soft.biz;

import com.soft.entity.Tblqualify;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KindergartenBiz {
    public List findall(Tblqualify qua);
    public List count(Tblqualify qualify);
    public Tblqualify findByqno(int qno);
    public boolean updBystate(int qno,int qstate,String qapprovetime);
}
