package com.hanhai.cloud.params;

import lombok.Data;

/**
 *  快传参数类
 */
@Data
public class FastUploadParam {
    /** 文件ID */
    private String fileId;
    /** 文件名 */
    private String name;
    /** 文件大小 */
    private String size;
    /** 获取用户文件表ID */
    private String userFileId;
    /** 获取用户ID */
    private String userId;
    /** 获取上传路径 */
    private String uploadPath;
    /** 获取输入名 */
    private String inputName;
}
