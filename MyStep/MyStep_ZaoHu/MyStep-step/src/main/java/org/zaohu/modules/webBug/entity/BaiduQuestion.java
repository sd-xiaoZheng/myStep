package org.zaohu.modules.webBug.entity;

import lombok.*;

@Data
@ToString
@NoArgsConstructor
@EqualsAndHashCode
@AllArgsConstructor
public class BaiduQuestion {

//  @TableId(type = IdType.AUTO)
  private Long id;
  private String questionText;
}
