package ${controllerUrl};
import ${entityUrl}.${entityName}Model;
import ${serviceUrl}.${entityName}Service;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.jx.ops.tools.model.ResultModel;
import com.jx.ops.tools.util.ResultUtil;
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
@RequestMapping("/${entityName?uncap_first}")
public class ${entityName}Controller{

	@Autowired
    private ${entityName}Service ${entityName?uncap_first}Service;


    @PostMapping("/saveOrEdit")
<#if isSwagger=="true" >
    @ApiOperation("保存或更新${entityComment}")
</#if>
    public ResultModel<?> saveOrEdit(@RequestBody ${entityName}Model ${entityName?uncap_first}) {
    return ${entityName?uncap_first}Service.saveOrEdit(${entityName?uncap_first});
    }

    @GetMapping(value="/delete/{id}")
<#if isSwagger=="true" >
    @ApiOperation("删除${entityComment}")
</#if>
    public ResultModel<?> delete(@PathVariable Long id) {

        return null;
    }

    @GetMapping("/get/{id}")
<#if isSwagger=="true" >
    @ApiOperation("查询${entityComment}")
</#if>
    public ResultModel<?> getById(@PathVariable Long id) {
    return ResultUtil.success("成功",${entityName?uncap_first}Service.findById(id));
    }

    @GetMapping("/listPage/{orgId}")
<#if isSwagger=="true" >
    @ApiOperation("查询${entityComment}分页列表")
</#if>
    public ResultModel<?> listPage(@PathVariable Long orgId,@RequestParam(value = "keyword", required = false) String keyword,
    @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
    @RequestParam(value = "pageSize", required = false, defaultValue = "30") Integer pageSize) {
    return ${entityName?uncap_first}Service.listPage(orgId,keyword, pageNum, pageSize);
    }
	
}