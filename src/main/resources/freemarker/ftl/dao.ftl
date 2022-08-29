package ${daoUrl};

import ${entityUrl}.${entityName}Model;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}数据交互层</p>
 * @version: ${version}
 * @author: ${author}
 * 
 */
@Repository
public interface ${entityName}Mapper  {
     /**
     *列名选择性插入
     * @param ${entityName?uncap_first} 数据模型
     * @return 结果行数
     */
     int insert(${entityName}Model ${entityName?uncap_first});

     /**
     *列名选择性批量插入
     * @param ${entityName?uncap_first}List 插入的数据列表
     * @return 结果行数
     */
     int insertBatch(List<${entityName}Model> ${entityName?uncap_first}List);

     /**
     *列名选择性更新根据主键
     * @param ${entityName?uncap_first} 数据模型
     * @return 结果行数
     */
     int updateById(${entityName}Model ${entityName?uncap_first});

     /**
     *根据id逻辑删除
     * @param id 主键
     * @param orgId 项目id
     * @return 结果行数
     */
     int deleteById(@Param("id") ${idType} id);

     /**
     *根据id查询
     * @param id 主键
     * @return 返回实体数据
     */
     ${entityName}Model selectById(@Param("id") ${idType} id);

    /**
    *根据实体条件查询返回最新的一条数据
    * @param ${entityName?uncap_first} 数据参数
    * @return 返回实体数据
    */
    ${entityName}Model selectOneByEntity(${entityName}Model ${entityName?uncap_first});

    /**
    *动态建表语句
    * @param orgId 项目id
    */
    void initTable(@Param("orgId")Long orgId);

    /**
    *分页查询
    * @param keyword 搜索关键字
    * @param orgId 项目id
    * @return 返回实体列表数据
    */
     List<${entityName}Model> listPage(@Param("orgId") Long orgId,@Param("keyword") String keyword);


}
	