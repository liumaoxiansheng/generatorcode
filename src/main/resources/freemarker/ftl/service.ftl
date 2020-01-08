/**
 * @filename:${entityName}Service ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) ${createTime} ${author} Co. Ltd.
 * All right reserved. 
 */
package ${serviceUrl};

import ${entityUrl}.${entityName};
import org.dr.das.model.operator.SystemSelect;
import java.util.List;

/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}服务层</P>
 * @version: ${version}
 * @author: ${author}
 * 
 */
public interface ${entityName}Service  {
	int add(${entityName} ${entityName?uncap_first});
    int update(${entityName} ${entityName?uncap_first});
    int deleteById(Long id);
    ${entityName} findById( Long id);
    List<${entityName}> selectPage(SystemSelect systemSelect);
}