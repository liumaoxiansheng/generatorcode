/**   
 * Copyright © 2019 dream horse Info. Tech Ltd. All rights reserved.
 * @Package: com.github.mybatis.fl.convert
 * @author: flying-cattle  
 * @date: 2019年4月9日 下午8:15:25 
 */
package com.czw.uitl;

import com.czw.entity.BasisInfo;
import com.czw.entity.PropertyInfo;
import com.czw.entity.ResultJson;
import java.util.List;

/**   
 * Copyright: Copyright (c) 2019 
 * 
 * <p>说明：  获取文件路径调用创建文件</P>
 * @version: v1.0
 * @author: th_legend
 * 
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年12月27日      		codeGenerator   v1.0           initialize
 */
public class Generator {
	//路径信息
	public static final String ENTITY="entity";
	public static final String DAO="dao";
	public static final String DAO_IMPL="daoImpl";
	public static final String SERVICE="service";
	public static final String SERVICE_IMPL="serviceImpl";
	public static final String CONTROLLER="controller";
	public static final String SWAGGER_CONFIG="swaggerConfig";
	
	//①创建实体类
	public static ResultJson createEntity(String url, BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url, bi.getEntityUrl(), bi.getEntityName(), ENTITY);
		return FreemarkerUtil.createFile(bi, "entity.ftl", fileUrl);
	}
	
	//②创建DAO
	public static ResultJson createDao(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url, bi.getDaoUrl(), bi.getEntityName(), DAO);
		return FreemarkerUtil.createFile(bi, "dao.ftl", fileUrl);
	}
	
	//③创建mapper配置文件
	public static ResultJson createDaoImpl(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url, bi.getMapperUrl(), bi.getEntityName(), DAO_IMPL);
		List<PropertyInfo> list=bi.getCis();
		String agile="";
		for (PropertyInfo propertyInfo : list) {

			agile=agile+"`"+propertyInfo.getColumn()+"`"+", ";
		}
		agile=agile.substring(0, agile.length()-2);
		bi.setAgile(agile);
		return FreemarkerUtil.createFile(bi, "mapper.ftl", fileUrl);
	}
	
	//④创建SERVICE
	public static ResultJson createService(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url, bi.getServiceUrl(), bi.getEntityName(), SERVICE);
		return FreemarkerUtil.createFile(bi, "service.ftl", fileUrl);
	}
	
	//⑤创建SERVICE_IMPL
	public static ResultJson createServiceImpl(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url, bi.getServiceImplUrl(), bi.getEntityName(), SERVICE_IMPL);
		return FreemarkerUtil.createFile(bi, "serviceImpl.ftl", fileUrl);
	}
	
	//⑥创建CONTROLLER
	public static ResultJson createController(String url,BasisInfo bi) {
	//	createAbstractController( url, bi); //保证父类一直存在
		String fileUrl= getGeneratorFileUrl(url, bi.getControllerUrl(), bi.getEntityName(), CONTROLLER);
		return FreemarkerUtil.createFile(bi, "controller.ftl", fileUrl);
	}
	
	//⑦创建抽象的CONTROLLER
	public static ResultJson createAbstractController(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url, bi.getAbstractControllerUrl(),"Abstract", CONTROLLER);
		return FreemarkerUtil.createFile(bi, "AbstractController.ftl", fileUrl);
	}
	
	//⑧创建CONTROLLER
	public static ResultJson createSwaggerConfig(String url,BasisInfo bi) {
		String fileUrl= getGeneratorFileUrl(url,bi.getSwaggerConfigUrl(), "Swagger", SWAGGER_CONFIG);
		return FreemarkerUtil.createFile(bi, "SwaggerConfig.ftl", fileUrl);
	}
	//生成文件路径和名字
	public static String getGeneratorFileUrl(String url,String packageUrl,String entityName, String type){
		if (type.equals("entity")) {
			return url+pageToUrl(packageUrl)+entityName+"Model.java";
		}else if(type.equals("dao")) {
			return url+pageToUrl(packageUrl)+entityName+"Mapper.java";
		}else if(type.equals("daoImpl")) {
			return url+pageToUrl(packageUrl)+entityName+"Mapper.xml";
		}else if(type.equals("service")) {
			return url+pageToUrl(packageUrl)+entityName+"Service.java";
		}else if(type.equals("serviceImpl")) {
			return url+pageToUrl(packageUrl)+entityName+"ServiceImpl.java";
		}else if(type.equals("controller")) {
			return url+pageToUrl(packageUrl)+entityName+"Controller.java";
		}else if(type.equals("swaggerConfig")){
			return url+pageToUrl(packageUrl)+entityName+"Config.java";
		}
		return null;
	}
	
	public static String pageToUrl(String url) {
		return url.replace(".", "/")+"/";
	}
}
