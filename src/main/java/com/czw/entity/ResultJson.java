package com.czw.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 返回结果json对象</P>
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
public class ResultJson implements Serializable{
	
	private static final long serialVersionUID = 123126L;
	
	private Integer code;
	
	private String message;
	
	private Object data;
}
