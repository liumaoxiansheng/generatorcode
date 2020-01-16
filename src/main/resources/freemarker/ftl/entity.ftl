/**
 * @filename:${entityName} ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) ${createTime} ${author} Co. Ltd.
 * All right reserved. 
 */
package ${entityUrl};
import com.fasterxml.jackson.annotation.JsonFormat;
<#if isSwagger=="true" >
import io.swagger.annotations.ApiModelProperty;
</#if>
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
<#list pkgs as ps>
	<#if ps??>
import ${ps};
	</#if>
</#list>

/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}实体模型</P>
 * @version: ${version}
 * @author: ${author}
 * 
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ${entityName} implements Serializable {

	private static final long serialVersionUID = ${agile}L;
	
<#list cis as ci>
 <#if ci.javaType=="Date">
  <#if ci.jdbcType=="date">
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
  <#elseif ci.jdbcType=="time">
    @DateTimeFormat(pattern = "HH:mm:ss")
	@JsonFormat(pattern="HH:mm:ss",timezone = "GMT+8")
  <#else>
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  </#if>
 </#if>
 <#if isSwagger=="true" >
	@ApiModelProperty(name = "${ci.property}" , value = "${ci.comment}")
 </#if>
	private ${ci.javaType} ${ci.property};
    
</#list>

}
	