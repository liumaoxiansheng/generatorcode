package ${serviceUrl};

import ${entityUrl}.${entityName}Model;
import com.jx.smart.tools.model.PagingModel;

/**   
 * <p>自动生成工具：他强由他强，明月照大江</p>
 * 
 * <p>说明： ${entityComment}服务层</P>
 * @version: ${version}
 * @author: ${author}
 * 
 */
public interface ${entityName}Service  {
    /**
    *列名选择性插入
    * @param ${entityName?uncap_first} 数据模型
    * @return 结果行数
    */
	int add(${entityName}Model ${entityName?uncap_first});

    /**
    *列名选择性更新根据主键
    * @param ${entityName?uncap_first} 数据模型
    * @return 结果行数
    */
    int update(${entityName}Model ${entityName?uncap_first});

    /**
    *根据id查询
    * @param id 主键
    * @param orgId 项目id
    * @return 返回实体数据
    */
    ${entityName}Model findById( ${idType} id);

    /**
    *分页查询
    * @param keyword 搜索关键字
    * @param orgId 项目id
    * @param pageNum 页码
    * @param pageSize 每页大小
    * @return 返回实体列表数据
    */
    PagingModel<?> listPage(Long orgId, String keyword, Integer pageNum, Integer pageSize);
}