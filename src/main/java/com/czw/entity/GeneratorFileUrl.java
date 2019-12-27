package com.czw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 自动生成文件路径</P>
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
public class GeneratorFileUrl implements Serializable{
	private static final long serialVersionUID = 123125L;

	private String entityUrl;
	 
	private String daoUrl;
	 
	private String mapperUrl;
	 
	private String serviceUrl;
	 
	private String serviceImplUrl;
	 
	private String controllerUrl;
}
