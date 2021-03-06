package com.hanhai.cloud.vo;

import lombok.Data;
import lombok.experimental.Accessors;
import java.time.LocalDateTime;

@Data
@Accessors(chain = true)
public class ReceivingRecordListVO {
    /** 收件ID */
    private Long receivingId ;
    /** 输入名 */
    private String inputName ;
    /** 用户id */
    private Long userId ;
    /** 提交原文件名 */
    private String commitFileName ;
    /** 提交时间 */
    private LocalDateTime createdTime ;
    /** 用户姓名 */
    private String userName;
    /** 是否覆盖 */
    private String over;
}
