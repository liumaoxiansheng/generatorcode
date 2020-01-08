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
    public static final String PROJECT = "eachDoctor";
    public static final String AUTHOR = "未来的希望";
    public static final String VERSION = "V1.0";
    // 数据库连接信息：连接URL、用户名、秘密、数据库名
    public static final String URL = "jdbc:mysql://127.0.0.1:33306/doctor?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&useSSL=true&serverTimezone=UTC";
    public static final String NAME = "root";
    public static final String PASS = "123456";
    public static final String DATABASE = "doctor";
    // 类信息：类名、对象名（一般是【类名】的首字母小些）、类说明、时间
    public static final String TABLE = "t_health_file,t_product_cart";//表名,可多个用","分割
    public static final String TABLE_PRE= "t_"; //表名前缀
    public static final String TIME = "2019年12月27日";
    public static final String AGILE = new Date().getTime() + "";
    // 路径信息，分开路径方便聚合工程项目，微服务项目
    public static final String ENTITY_URL = "com.doctor.entity";
    public static final String DAO_URL = "com.doctor.dao";
    public static final String XML_URL = "com.doctor.dao.impl";
    public static final String SERVICE_URL = "com.doctor.service";
    public static final String SERVICE_IMPL_URL = "com.doctor.service.impl";
    public static final String CONTROLLER_URL = "com.doctor.controller";
    //是否是Swagger配置
    public static final String IS_SWAGGER = "true";
    // 生成文件存放位置
    public static final String FILE_URL = "E:/generator/code/";

    public static void main(String[] args) {

         String[] tables = TABLE.split(",");
        for (String table : tables) {
            BasisInfo bi = new BasisInfo(PROJECT, AUTHOR, VERSION, URL, NAME, PASS, DATABASE, TIME, AGILE, ENTITY_URL,
                    DAO_URL, XML_URL, SERVICE_URL, SERVICE_IMPL_URL, CONTROLLER_URL,IS_SWAGGER);
            bi.setTable(table);
            String removePreTable = table.substring(table.indexOf(TABLE_PRE)+TABLE_PRE.length());
            bi.setEntityName(MySqlToJavaUtil.getClassName(removePreTable));
            bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(removePreTable));
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
