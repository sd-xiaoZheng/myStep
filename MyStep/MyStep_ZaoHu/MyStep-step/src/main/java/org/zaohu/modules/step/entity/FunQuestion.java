package org.zaohu.modules.step.entity;

import lombok.*;

@Data
@ToString
@NoArgsConstructor
@EqualsAndHashCode
@AllArgsConstructor
public class FunQuestion {
  private Long id;
  private String classify;
  private String content;
}
