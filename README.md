# generatorcode
自定义代码生成器，模板针对mabatis
zb一下实现思路：
  核心思想：元数据+freemarker生成
  借助Freemarker机制可以方便的根据模板生成文件，同时也是组成代码生成器的核心部分。对于Freemarker而
 言，其强调 数据模型 + 模板 = 文件 的思想，所以代码生成器最重要的一个部分之一就是数据模型。在这里数据
 模型共有两种形式组成
 数据库中表、字段等信息
针对这部分内容，可以使用元数据读取并封装到java实体类中
用户自定义的数据
为了代码生成器匹配多样的使用环境，可以让用户自定义的数据，并且以key-value的形式配置到properties
文件中
说明：自动生成controller、service、service实现层、dao、mapper，
controller、service、service实现层生成增删改查和分页查询，
dao、mapper层再额外生成批量更新、批量添加、分页条件查询、单个条件查询
使用：
1、下载本项目
代码生成启动类：test目录下/code/MyGenerator.class
启动类说明：
启动类包含数据库连接信息、代码生成路径、需要生成的表信息、已经作者信息，均可修改。
另外resources目录下有多个模板，模板可根据用户自定义更改
