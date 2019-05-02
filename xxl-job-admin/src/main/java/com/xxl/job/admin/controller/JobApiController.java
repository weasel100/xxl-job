package com.xxl.job.admin.controller;

import com.alibaba.fastjson.JSON;
import com.xxl.job.admin.controller.annotation.PermessionLimit;
import com.xxl.job.admin.core.schedule.XxlJobDynamicScheduler;
import com.xxl.job.core.biz.AdminBiz;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by xuxueli on 17/5/10.
 */
@Controller
public class JobApiController implements InitializingBean {
    private static final Logger logger = LoggerFactory.getLogger(JobApiController.class);

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    @RequestMapping(AdminBiz.MAPPING)
    @PermessionLimit(limit=false)
    public void api(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        logger.debug("===============api request:{}",JSON.toJSONString(request.getParameterMap()));
        XxlJobDynamicScheduler.invokeAdminService(request, response);
    }
}
