/**
 * @filename:${entityName}ServiceImpl ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2018 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${serviceImplUrl};

import ${entityUrl}.${entityName};
import ${daoUrl}.${entityName}Dao;
import ${serviceUrl}.${entityName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.dr.das.model.operator.SystemSelect;
import java.util.List;
import com.github.pagehelper.PageHelper;
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
    private ${entityName}Dao ${entityName?lower_case}Dao;
    @Override
	public int add(${entityName} ${entityName?lower_case}){
return ${entityName?lower_case}Dao.insert(${entityName?lower_case});
    }
    @Override
    public int update(${entityName} ${entityName?lower_case}){
return ${entityName?lower_case}Dao.updateById(${entityName?lower_case});
}
    @Override
    public int deleteById(Long id){
return ${entityName?lower_case}Dao.deleteById(id);
}
    @Override
   public ${entityName} findById(Long id){
return ${entityName?lower_case}Dao.findById(id);
}
    @Override
   public  List<${entityName}> selectPage(SystemSelect systemSelect){
PageHelper.startPage(systemSelect.getPageNum(), systemSelect.getPageSize());
return ${entityName?lower_case}Dao.selectPage(systemSelect);
}
}