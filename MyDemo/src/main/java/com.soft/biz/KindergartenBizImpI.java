package com.soft.biz;

import com.soft.entity.Tblqualify;
import com.soft.mapper.KindergartenMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("kindergartenBiz")
public class KindergartenBizImpI implements KindergartenBiz {
    @Resource
    private KindergartenMapper kindergartenMapper;
    //查询与分页方法
    @Override
    public List findall(Tblqualify qualify) {

        return kindergartenMapper.findall(qualify);
    }

    //查询数据库总条数
    @Override
    public List count(Tblqualify qualify) {
        return kindergartenMapper.count(qualify);
    }

    //通过流水号，查询园所审批信息
    @Override
    public Tblqualify findByqno(int qno) {
        return kindergartenMapper.findByqno(qno);
    }

    //修改审批状态
    @Override
    public boolean updBystate(int qno, int qstate,String qapprovetime) {
        System.out.println("----------------------");
        return kindergartenMapper.updBystate(qno,qstate,qapprovetime);
    }
}
