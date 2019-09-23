package com.soft.mapper;

import com.soft.entity.Tblqualify;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KindergartenMapper {
    public List findall(Tblqualify qualify);
    public List count(Tblqualify qualify);
    public Tblqualify findByqno(@Param("qno") int qno);
    public boolean updBystate(@Param("qno")int qno,@Param("qstate")int qstate,@Param("qapprovetime")String qapprovetime);
}
