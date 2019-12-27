package com.czw.aid;

import lombok.Data;

import java.io.Serializable;
/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： app分页组件</P>
 * @version: v1.0
 * @author: th_legend
 *
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年12月27日      		codeGenerator   v1.0.          initialize
 */
@Data
public class PageParam<T>  implements Serializable{
	
	private static final long serialVersionUID = -7248374800878487522L;
	/**
     * <p>当前页</p>
     */
    private int pageNum=1;
    /**
     * <p>每页记录数</p>
     */
    private int pageSize=10;

    /**
     * <p>分页外的其它参数</p>
     */
    private T param;
    
}
