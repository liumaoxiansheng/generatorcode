package com.czw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 获取到数据库的信息</P>
 * @version: v1.0
 * @author: th_legend
 *
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年12月27日      		codeGenerator   v1.0.          initialize
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PropertyInfo implements Serializable{
	
	private static final long serialVersionUID = 123124L;
	
	private String column;

	private String jdbcType;
	 
	private String comment;
	 
	private String property;
	 
	private String javaType;
}
