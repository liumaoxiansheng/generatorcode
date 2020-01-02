package com.czw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 自动生成需要的基本信息</P>
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
public class BasisInfo implements Serializable{
	private static final long serialVersionUID = 123123L;

	private String project;//项目名称
	
	private String author;//作者
	
	private String version;//版本号
	
	private String dbUrl;//数据库
	
	private String dbName;//用户名
	
	private String dbPassword;//密码
	
	private String database;//数据库名
	
	private String table;//表明
	
	private String entityName;//实体模型名称
	
	private String objectName;//
	
	private String entityComment;//实体模型备注
	
	private String createTime;//创建时间
	
	private String agile;
	
	private String entityUrl;
	
	private String daoUrl;
	
	private String mapperUrl;
	
	private String serviceUrl;
	
	private String serviceImplUrl;
	
	private String abstractControllerUrl;
	
	private String controllerUrl;
	
	private String swaggerConfigUrl;
	private String idColumn;//主键列
	private String idJavaType;//主键的javatype

	private String idType;//
	
	private String idJdbcType;
	
	private List<PropertyInfo> cis;
	
	private String isSwagger="true";
	
	private Set<String> pkgs = new HashSet<String>();
	
	public BasisInfo(String project, String author, String version, String dbUrl, String dbName, String dbPassword,
			String database, String createTime, String agile, String entityUrl, String daoUrl, String mapperUrl,
			String serviceUrl, String serviceImplUrl, String controllerUrl,String isSwagger) {
		super();
		this.project = project;
		this.author = author;
		this.version = version;
		this.dbUrl = dbUrl;
		this.dbName = dbName;
		this.dbPassword = dbPassword;
		this.database = database;
		this.createTime = createTime;
		this.agile = agile;
		this.entityUrl = entityUrl;
		this.daoUrl = daoUrl;
		this.mapperUrl = mapperUrl;
		this.serviceUrl = serviceUrl;
		this.serviceImplUrl = serviceImplUrl;
		this.controllerUrl = controllerUrl;
		this.abstractControllerUrl = controllerUrl.substring(0, controllerUrl.lastIndexOf("."))+".aid";
		this.swaggerConfigUrl=controllerUrl.substring(0, controllerUrl.lastIndexOf("."))+".config";
		this.isSwagger=isSwagger;
	}
}
