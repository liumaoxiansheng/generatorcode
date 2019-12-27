package com.czw.convert;
/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 该类的功能描述</P>
 * @version: v1.0
 * @author: th_legend
 *
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年12月27日      		codeGenerator   v1.0.          initialize
 */
public interface ITypeConvert {
	/**
     * <p>说明:执行类型转换</p>
     * @param dateType 	时间类型
     * @param fieldType 字段类型
     * @return ignore
     */
    IColumnType processTypeConvert(DateType dateType, String fieldType);
}
