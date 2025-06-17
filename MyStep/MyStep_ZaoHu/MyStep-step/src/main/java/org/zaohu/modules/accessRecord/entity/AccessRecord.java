package org.zaohu.modules.accessRecord.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccessRecord {
  private Long id;
  private String host;
  private long port;
  private String url;
  private String urlParam;
  private long time;
  private String path;
  private String ipAddr;
  private String cyberCarrier;
  private String accessDate;
}
