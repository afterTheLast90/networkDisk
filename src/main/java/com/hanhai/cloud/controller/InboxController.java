package com.hanhai.cloud.controller;

import com.hanhai.cloud.base.PageParam;
import com.hanhai.cloud.base.PageResult;
import com.hanhai.cloud.base.R;
import com.hanhai.cloud.configuration.SystemInfo;
import com.hanhai.cloud.constant.ResultCode;
import com.hanhai.cloud.params.FileInboxEndCommitParams;
import com.hanhai.cloud.params.FileInboxNewParams;
import com.hanhai.cloud.params.FileInboxUpdateInitParams;
import com.hanhai.cloud.params.FileInboxUpdateParams;
import com.hanhai.cloud.service.InboxService;
import com.hanhai.cloud.service.ReceivingRecordService;
import com.hanhai.cloud.utils.BeanUtils;
import com.hanhai.cloud.vo.FileInboxListVO;
import com.hanhai.cloud.vo.ReceivingRecordListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.stream.Collectors;

@Controller
public class InboxController {
    @Autowired
    private InboxService inboxService;
    @Autowired
    private ReceivingRecordService recordService;

    @Autowired
    private SystemInfo systemInfo;
    @GetMapping("/fileInbox")
    public String fileInbox(Model model) {
        model.addAttribute("siteUrl",systemInfo.getSiteUrl());
        return "inbox";
    }

    //获取收件箱 表格初始化
    @GetMapping("/inboxList")
    @ResponseBody
    public R<PageResult> getInboxList(@Validated PageParam param) {
        PageResult pageResult = new PageResult(inboxService.getInboxListForCurrentUser(param));
        pageResult.setList(pageResult.getList()
                .stream()
                .map(o -> BeanUtils.convertTo(o, FileInboxListVO.class))
                .collect(Collectors.toList()));
        return R.getSuccess().setData(pageResult);
    }

    //获取收件详情
    @GetMapping("/receiveRecordList")
    @ResponseBody
    public R<PageResult> getReceiveRecordList(@Validated PageParam param, HttpServletRequest request) {
        Long recordId=Long.parseLong(request.getParameter("recordId"));
        PageResult pageResult = new PageResult(recordService.findByInboxId(param,recordId));

        pageResult.setList(pageResult.getList()
                .stream()
                .map(o -> BeanUtils.convertTo(o, ReceivingRecordListVO.class))
                .map(i -> i.getUserId()==-1 ? i.setUserName("匿名用户") : i.setUserName(recordService.getUserName(i.getUserId())))
                .collect(Collectors.toList()));
        return R.getSuccess().setData(pageResult);
    }

    //新建收件任务
    @PostMapping("/newInboxTask")
    @ResponseBody
    public R newInboxTask(@RequestBody @Validated FileInboxNewParams params){
        Long fileInboxId=null;
        fileInboxId=inboxService.newInboxTask(params);
//        return new R(ResultCode.SUCCESS_NO_SHOW);
        return R.getSuccess().setMsg("新建收件任务成功").setData(fileInboxId);
    }

    //发送截止提交请求
    @PostMapping("/endCommit")
    @ResponseBody
    public R endCommit(@RequestBody @Validated FileInboxEndCommitParams params){
        inboxService.endCommit(params);
        return R.getSuccess().setMsg("修改截止提交成功！");
    }

    //修改收件任务提交
    @PostMapping("/updateInboxTask")
    @ResponseBody
    public R updateInboxTask(@RequestBody @Validated FileInboxUpdateParams params){
        inboxService.updateInboxTask(params);
        return R.getSuccess().setMsg("修改收件任务成功！");
    }

    //修改收件初始化,通过inboxId获取其他信息
    @PostMapping("/updateInboxInit")
    @ResponseBody
    public R updateInboxInit(@RequestBody FileInboxUpdateInitParams params){
        return new R(ResultCode.SUCCESS_NO_SHOW).setData(inboxService.updateInboxInit(params));
    }
}
