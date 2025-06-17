package org.zaohu.modules.userLogin.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("\"user\"")
public class User {

  private Long userId;
  private String phone;
  private String password;
  private String username;
  private String email;

  @TableField(exist = false)
  private String code;
}
