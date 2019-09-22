package com.soft.web;

import com.soft.biz.KindergartenBizImpI;
import com.soft.entity.Tblqualify;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/kindergarten")
public class kindergartenHandler {
    @Resource
    private KindergartenBizImpI kindergartenBiz;
    private Map<String, Object> map = new HashMap<String, Object>();
    private Tblqualify qualify = new Tblqualify();

    //查询表格
    @RequestMapping(value = "/find.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public @ResponseBody
    Map find(String qapplytime, String qapplytime2, String qstate, String qname, int page, int limit) {
        qualify.setQapplytime(qapplytime);
        qualify.setQapplytime2(qapplytime2);
        if ((null != qstate) && (!"".equals(qstate))) {
            int state = Integer.parseInt(qstate);
            qualify.setQstate(state);
        }
        qualify.setQname(qname);
        qualify.setPage((page - 1) * 10);
        qualify.setLimit(limit);
        List list = kindergartenBiz.findall(qualify);
        List count = kindergartenBiz.count(qualify);
        map.put("code", 0);
        map.put("count", count.size());
        map.put("data", list);
        return map;
    }

    //显示园所审批弹窗
    @RequestMapping(value = "/qon.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    public @ResponseBody Tblqualify findByqno(int qno) {
        System.out.println(qno);
        Tblqualify tbq = kindergartenBiz.findByqno(qno);
        return tbq;
    }
//    修改审批状态以及审批时间
    @RequestMapping(value = "/state.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    public @ResponseBody String updBystate(int qno,int qstate) {
        String msg = "0";
        Calendar cal = Calendar.getInstance(); // 当前时间
        int y = cal.get(Calendar.YEAR);
        int m = cal.get(Calendar.MONTH) + 1;
        int d = cal.get(Calendar.DATE);
        String qapprovetime = null;
        if (m < 10 && d < 10)
        {
            qapprovetime = y + "-0" + m + "-0" + d;
        } else if (m < 10 && d > 9)
        {
            qapprovetime = y + "-0" + m + "-" + d;
        } else if (m < 10 && d > 9)
        {
            qapprovetime = y + "-" + m + "-0" + d;
        }
        System.out.println(qapprovetime);
        boolean flag = kindergartenBiz.updBystate(qno,qstate,qapprovetime);
        System.out.println(flag);
        return msg;
    }
}