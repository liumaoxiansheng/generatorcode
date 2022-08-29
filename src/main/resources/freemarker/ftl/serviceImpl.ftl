package ${serviceImplUrl};

import ${entityUrl}.${entityName}Model;
import ${daoUrl}.${entityName}Mapper;
import ${serviceUrl}.${entityName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.jx.ops.tools.model.PagingModel;
import java.util.List;
/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}服务实现层</P>
 * @version: ${version}
 * @author: ${author}
 * 
 */
@Service
public class ${entityName}ServiceImpl  implements ${entityName}Service  {
    @Autowired
    private ${entityName}Mapper mapper;

    @Override
	public int add(${entityName}Model ${entityName?uncap_first}){
        return mapper.insert(${entityName?uncap_first});
    }

    @Override
    public int update(${entityName}Model ${entityName?uncap_first}){
        return mapper.updateById(${entityName?uncap_first});
    }

    @Override
    public ${entityName}Model findById(${idType} id){
        return mapper.selectById(id);
    }

    @Override
    public PagingModel<?> listPage(Long orgId, String keyword, Integer pageNum, Integer pageSize) {
    PageHelper.startPage(pageNum,pageSize);
    List<${entityName}Model> list= mapper.listPage(orgId,keyword);
    return new PagingModel<>(list);
    }
}