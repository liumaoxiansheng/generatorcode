/**
 * @filename:${entityName}Controller ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) ${createTime} ${author} Co. Ltd.
 * All right reserved. 
 */
package ${controllerUrl};
import lombok.extern.slf4j.Slf4j;
import ${entityUrl}.${entityName};
import ${serviceUrl}.${entityName}Service;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.dr.das.model.operator.SystemSelect;
import org.dr.utils.ResVal;
import org.dr.utils.ListUtil;
import java.util.List;
<#if isSwagger=="true" >
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
</#if>
/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}API接口控制层</P>
 * @version: ${version}
 * @author: ${author}
 * @time    ${createTime}
 *
 */
<#if isSwagger=="true" >
@Api(description = "${entityComment}",value="${entityComment}" )
</#if>
@RestController
@RequestMapping("/api/${entityName?uncap_first}")
@Slf4j
public class ${entityName}Controller extends BaseController{

	@Autowired
    private ${entityName}Service ${entityName?uncap_first}Service;
    @Autowired
    private ListUtil listUtil;
    //保存
    @PostMapping(value="/save")
<#if isSwagger=="true" >
    @ApiOperation("保存${entityComment}")
</#if>
    public ResVal save(HttpServletRequest request, @RequestBody ${entityName} ${entityName?uncap_first})  {
        //业务操作
        int rows=${entityName?uncap_first}Service.add(${entityName?uncap_first});
        if (rows <= 0) {
            return ResVal.error();
        }
        return ResVal.success();
    }

    //根据id更新
    @PostMapping(value = "/update")
<#if isSwagger=="true" >
    @ApiOperation("更新${entityComment}")
</#if>
    public ResVal update(HttpServletRequest request, @RequestBody ${entityName} ${entityName?uncap_first} ) {
        //业务操作
        int rows=${entityName?uncap_first}Service.update(${entityName?uncap_first});
        if (rows <= 0) {
            return ResVal.error();
        }
        return ResVal.success();
    }

    //根据id删除
    @PostMapping(value="/deleteById")
<#if isSwagger=="true" >
    @ApiOperation("删除${entityComment}")
</#if>
    public ResVal delete(HttpServletRequest request,@RequestBody SystemSelect systemSelect) {
        int rows=${entityName?uncap_first}Service.deleteById(systemSelect.getId());
        if (rows <= 0) {
            return ResVal.error();
        }
        return ResVal.success();
    }

    //根据id查询
    @PostMapping(value="/getById")
<#if isSwagger=="true" >
    @ApiOperation("查询${entityComment}")
</#if>
    public ResVal getById(HttpServletRequest request,@RequestBody SystemSelect systemSelect)  {
${entityName} ${entityName?uncap_first} = ${entityName?uncap_first}Service.findById(systemSelect.getId());
        ResVal resVal = new ResVal<>();
        resVal.setData(${entityName?uncap_first});
        return resVal;
    }

    //分页查询
    @GetMapping(value="/selectPage")
<#if isSwagger=="true" >
    @ApiOperation("查询${entityComment}分页列表")
</#if>
    public ResVal selectPage(HttpServletRequest request,@RequestBody SystemSelect systemSelect) {
        ResVal resVal = new ResVal<>();
        List<${entityName}> list = ${entityName?uncap_first}Service.selectPage(systemSelect);
        resVal.setArray(list);
        return listUtil.setDateAndArray(resVal);
    }
	
}