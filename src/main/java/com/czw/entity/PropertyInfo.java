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
	
	private String column;//列名

	private String jdbcType;//mybatis对应的jabcType
	 
	private String comment;//列的备注
	 
	private String property;//实体类对应的属性名
	 
	private String javaType;//对应的java类型

	private String isPrimaryKey="false";//是否主键
}
