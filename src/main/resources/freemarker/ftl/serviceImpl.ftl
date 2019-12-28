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
	public int add(${entityName} ${entityName?lower_case}){
return ${entityName?lower_case}Dao.insert(${entityName?lower_case});
    }
    public int update(${entityName} ${entityName?lower_case}){
return ${entityName?lower_case}Dao.updateById(${entityName?lower_case});
}
    public int deleteById(Long id){
return ${entityName?lower_case}Dao.deleteById(id);
}
   public ${entityName} findById(Long id){
return ${entityName?lower_case}Dao.findById(id);
}
   public  List<${entityName}> selectPage(SystemSelect systemSelect){
PageHelper.startPage(systemSelect.getPageNum(), systemSelect.getPageSize());
return ${entityName?lower_case}Dao.selectPage(systemSelect);
}
}