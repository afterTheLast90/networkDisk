package com.hanhai.cloud.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hanhai.cloud.base.BaseEntity;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author wmgx
 * @create 2021-04-25-9:33
 **/
@Data
@Accessors(chain = true)
@TableName("user")
public class User extends BaseEntity  implements Serializable,Cloneable{
    /** 用户ID */
    @TableId
    private Long userId ;
    /** 用户名 */
    private String userName ;
    /** 密码 */
    private String userPassword ;
    /** 头像 */
    private String userAvatar ;
    /** 性别;0男1女 */
    private Integer userGender ;
    /** 电子邮箱 */
    private String userEmail ;
    /** 手机号 */
    private String userPhone ;
    /** 电子邮箱是否验证通过 */
    private Boolean emailChecked ;
    /** 手机号是否验证通过 */
    private Boolean phoneChecked ;
    /** 空间大小（字节为单位） */
    private Long spaceSize ;
    /** 已使用空间大小 */
    private Long usedSize ;
    /** 是否具有管理权限 */
    private Boolean admin ;
}
