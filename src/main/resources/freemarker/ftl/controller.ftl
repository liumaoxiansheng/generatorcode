/**
 * @filename:${entityName}Controller ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2020 ${author} Co. Ltd. 
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
</#if>
/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}API接口空置层</P>
 * @version: ${version}
 * @author: ${author}
 * @time    ${createTime}
 *
 */
 <#if isSwagger=="true" >
@Api(description = "${entityComment}",value="${entityComment}" )
</#if>
@RestController
@RequestMapping("/api/${objectName}")
@Slf4j
public class ${entityName}Controller extends BaseController{

	@Autowired
    private ${entityName}Service ${entityName?lower_case}Service;
 @Autowired
    private ListUtil listUtil;
   //保存
    @PostMapping(value="/save")
    public ResVal save(HttpServletRequest request, @RequestBody ${entityName} ${entityName?lower_case})  {
        //业务操作
    int rows=${entityName?lower_case}Service.add(${entityName?lower_case});
    if (rows <= 0) {
            return ResVal.error();
        }
        return ResVal.success();
    }

    //根据id更新
    @PostMapping(value = "/update")
    public ResVal update(HttpServletRequest request, @RequestBody ${entityName} ${entityName?lower_case} ) {
        //业务操作
int rows=${entityName?lower_case}Service.update(${entityName?lower_case});
        if (rows <= 0) {
            return ResVal.error();
        }
        return ResVal.success();
    }

    //根据id删除
    @GetMapping(value="/deleteById")
    public ResVal delete(HttpServletRequest request,@RequestBody SystemSelect systemSelect) {
int rows=${entityName?lower_case}Service.deleteById(systemSelect.getId());
        if (rows <= 0) {
            return ResVal.error();
        }
        return ResVal.success();
    }

    //根据id查询
    @GetMapping(value="/getById")
    public ResVal getById(HttpServletRequest request,@RequestBody SystemSelect systemSelect)  {
${entityName} ${entityName?lower_case} = ${entityName?lower_case}Service.findById(systemSelect.getId());
ResVal resVal = new ResVal<>();
resVal.setData(${entityName?lower_case});
        return resVal;
    }

    //分页查询
    @GetMapping(value="/selectPage")
    public ResVal selectPage(HttpServletRequest request,@RequestBody SystemSelect systemSelect) {
        ResVal resVal = new ResVal<>();
        List<${entityName}> list = ${entityName?lower_case}Service.selectPage(systemSelect);
        resVal.setArray(list);
        return listUtil.setDateAndArray(resVal);
    }
	
}