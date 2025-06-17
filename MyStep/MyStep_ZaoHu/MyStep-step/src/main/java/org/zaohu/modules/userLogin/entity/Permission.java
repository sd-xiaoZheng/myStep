package org.zaohu.modules.userLogin.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Permission {

  private Long permissionId;
  private String permissionName;
}
