package code;

import com.czw.entity.BasisInfo;
import com.czw.uitl.EntityInfoUtil;
import com.czw.uitl.Generator;
import com.czw.uitl.MySqlToJavaUtil;

import java.sql.SQLException;
import java.util.Date;

/**
 * @author: th_legend
 * @ClassName:MyGenerator
 * @Description:generatorcode,代码生成器启动类
 * @date 2019/12/27 - 16:20
 */
public class MyGenerator {
    // 基础信息：项目名、作者、版本
    public static final String PROJECT = "Smart";
    public static final String AUTHOR = "未来的希望";
    public static final String VERSION = "V1.0";
    // 数据库连接信息：连接URL、用户名、秘密、数据库名
    public static final String URL = "jdbc:mysql://localhost:3306/huafa_smart?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&useSSL=true&serverTimezone=UTC";
    public static final String NAME = "root";
    public static final String PASS = "123456";
    public static final String DATABASE = "huafa_smart";
//    public static final String URL = "jdbc:mysql://smart-public.rwlb.rds.aliyuncs.com:3306/third_kedaxunfei?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&useSSL=true&serverTimezone=UTC";
//    public static final String NAME = "third";
//    public static final String PASS = "third@2018";
//    public static final String DATABASE = "third_kedaxunfei";
    // 类信息：类名、对象名（一般是【类名】的首字母小些）、类说明、时间
    public static final String TABLE = "supplier_info";//表名,可多个用","分割
    public static final String TABLE_PRE = "org_"; //表名前缀
    public static final String TIME = "2022/07/13";
    public static final String AGILE = new Date().getTime() + "";
    public static final String ORG_NAME="";
    public static final String MODULE_NAME="base";
    public static final String PROJECT_PRE="com.jx.smart.base.";
    // 路径信息，分开路径方便聚合工程项目，微服务项目
    public static final String ENTITY_URL = PROJECT_PRE+ORG_NAME+MODULE_NAME+".model";
    public static final String DAO_URL = PROJECT_PRE+ORG_NAME+MODULE_NAME+".mapper";
    public static final String XML_URL = PROJECT_PRE+ORG_NAME+MODULE_NAME+".mapper.impl";
    public static final String SERVICE_URL = PROJECT_PRE+ORG_NAME+MODULE_NAME+".service";
    public static final String SERVICE_IMPL_URL = PROJECT_PRE+ORG_NAME+MODULE_NAME+".service.impl";
    public static final String CONTROLLER_URL = PROJECT_PRE+ORG_NAME+MODULE_NAME+".controller";
    //是否是Swagger配置
    public static final String IS_SWAGGER = "true";
    // 生成文件存放位置
    public static final String FILE_URL = "D:/workNote/code/generate/code/";

    public static void main(String[] args) {

        String[] tables = TABLE.split(",");
        for (String table : tables) {
            BasisInfo bi = new BasisInfo(PROJECT, AUTHOR, VERSION, URL, NAME, PASS, DATABASE, TIME, AGILE, ENTITY_URL,
                    DAO_URL, XML_URL, SERVICE_URL, SERVICE_IMPL_URL, CONTROLLER_URL, IS_SWAGGER);
            bi.setTable(table);
            if (TABLE_PRE != null && TABLE_PRE.trim().length() > 0) {
                String removePreTable = table.substring(table.indexOf(TABLE_PRE) + TABLE_PRE.length());
                bi.setEntityName(MySqlToJavaUtil.getClassName(removePreTable));
                bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(removePreTable));
            }else {
                bi.setEntityName(MySqlToJavaUtil.getClassName(table));
                bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(table));
            }

            try {
                bi = EntityInfoUtil.getInfo(bi);
                //开始生成文件
                String entityFileName = Generator.createEntity(FILE_URL, bi).toString();
                String daoFileName = Generator.createDao(FILE_URL, bi).toString();
                String mapperXmlFileName = Generator.createDaoImpl(FILE_URL, bi).toString();
                String serviceFileName = Generator.createService(FILE_URL, bi).toString();
                String serviceImplFileName = Generator.createServiceImpl(FILE_URL, bi).toString();
                String controllerFileName = Generator.createController(FILE_URL, bi).toString();
                // 是否创建swagger配置文件
                // String swaggerFileName = Generator.createSwaggerConfig(FILE_URL, bi).toString();

                System.out.println(entityFileName);
                System.out.println(daoFileName);
                System.out.println(mapperXmlFileName);
                System.out.println(serviceFileName);
                System.out.println(serviceImplFileName);
                System.out.println(controllerFileName);
                // System.out.println(swaggerFileName);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
