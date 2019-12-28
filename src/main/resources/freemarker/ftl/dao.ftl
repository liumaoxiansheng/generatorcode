/**
 * @filename:${entityName}Dao ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2020 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${daoUrl};

import ${entityUrl}.${entityName};
import org.dr.das.model.operator.SystemSelect;
import java.util.List;
import org.apache.ibatis.annotations.Param;
/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}数据交互层</p>
 * @version: ${version}
 * @author: ${author}
 * 
 */
public interface ${entityName}Dao  {
/**
*列名选择性插入
*/
int insert(${entityName} ${entityName?lower_case});
/**
*列名选择性批量插入
*/
int insertBatch(List<${entityName}> ${entityName?lower_case}List);
/**
*列名选择性批量修改根据id
*/
int updateBatch(List<${entityName}> ${entityName?lower_case}List);
/**
*列名选择性更新根据主键
*/
int updateById(${entityName} ${entityName?lower_case});
/**
*根据id逻辑删除
*/
int deleteById(@Param("id") Long id);
/**
*根据id查询
*/
${entityName} findById(@Param("id") Long id);
/**
*根据实体条件查询返回最新的一条数据
*/
${entityName} findByEntity(${entityName} ${entityName?lower_case});
/**
*分页查询，分页需要pageHelper
*/
List<${entityName}> selectPage(SystemSelect systemSelect);
/**
*分页根据实体类查询查询,分页需要pageHelper
*/
List<${entityName}> selectPageByEntity(${entityName} ${entityName?lower_case});
}
	