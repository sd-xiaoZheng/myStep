package org.zaohu.modules.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class StorageDTO {

	private String commodityCode;

	private String name;

	private Integer price;

	private Integer quantity;

}
