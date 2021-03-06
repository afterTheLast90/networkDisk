package com.hanhai.cloud.params;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@Accessors(chain = true)
public class ReNameParams {
    @NotBlank(message = "ID不能为空")
    @NotNull(message = "ID不能为空")
    private String fileId;
    private String fileName;
}
