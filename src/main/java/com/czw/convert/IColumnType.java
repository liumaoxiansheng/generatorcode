package com.czw.convert;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 获取实体类字段属性类信息接口</P>
 * @version: v1.0
 * @author: th_legend
 *
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年12月27日      		codeGenerator   v1.0.          initialize
 */
public interface IColumnType {
	/**
     * <p>获取字段类型</p>
     *
     * @return 字段类型
     */
    String getType();

    /**
     * <p> 获取字段类型完整名</p>
     *
     * @return 字段类型完整名
     */
    String getPkg();
}
