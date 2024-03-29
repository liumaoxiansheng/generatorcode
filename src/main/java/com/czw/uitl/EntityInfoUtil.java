package com.czw.uitl;

import com.czw.entity.BasisInfo;
import com.czw.entity.PropertyInfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 链接数据库并获取表信息</P>
 * @version: v1.0
 * @author: th_legend
 *
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年12月27日      		codeGenerator   v1.0.          initialize
 */
public class EntityInfoUtil {
	public static BasisInfo getInfo(BasisInfo bi) throws SQLException {
		List<PropertyInfo> columns= new ArrayList<PropertyInfo>();
		// 创建连接
		Connection con = null;
		PreparedStatement columnPstemt = null;
		ResultSet columnRs = null;
		ResultSet tableRs = null;
		PreparedStatement tablePstat=null;
		//sql
		String columnInfoSql="select column_name,data_type,column_comment,column_key from information_schema.columns where" +
				" table_schema='"+bi.getDatabase()+"' and table_name='"+bi.getTable()+"'";
		String tableInfoSql="select table_name,table_comment from information_schema.tables where" +
				" table_schema='"+bi.getDatabase()+"' and table_name='"+bi.getTable()+"'";
		try {
			con = DriverManager.getConnection(bi.getDbUrl(), bi.getDbName(), bi.getDbPassword());
			//查询列信息
			columnPstemt = con.prepareStatement(columnInfoSql);
			columnRs = columnPstemt.executeQuery();
			while (columnRs.next()) {
				String column = columnRs.getString(1);
				String jdbcType = columnRs.getString(2);
				String comment = columnRs.getString(3);
				String columnKey = columnRs.getString(4);
				PropertyInfo ci=new PropertyInfo();
				ci.setColumn(column);
				if (jdbcType.equalsIgnoreCase("int")) {
					ci.setJdbcType("INTEGER");
				}else if (jdbcType.equalsIgnoreCase("datetime")) {
					ci.setJdbcType("TIMESTAMP");
				}else if (jdbcType.toLowerCase().contains("text")) {
					ci.setJdbcType("LONGVARCHAR");
				}else {
					ci.setJdbcType(jdbcType);
				}
				ci.setComment(comment);
				ci.setProperty(MySqlToJavaUtil.changeToJavaFiled(column));
				ci.setJavaType(MySqlToJavaUtil.jdbcTypeToJavaType(jdbcType));
				//设置注解类型
			//	if (column.equalsIgnoreCase("id")) {
				if (columnKey!=null&&columnKey.trim()!=""&&columnKey.equalsIgnoreCase("PRI")) { //主键
					if (bi.getIdType()==null) {
						bi.setIdType(ci.getJavaType());
					}
					if (bi.getIdJdbcType()==null) {
						bi.setIdJdbcType(ci.getJdbcType());
					}
					if (bi.getIdColumn()==null) {
						bi.setIdColumn(column);
					}
					if (bi.getIdJavaType()==null) {
						bi.setIdJavaType(ci.getProperty());
					}
					ci.setIsPrimaryKey("true");
				}
				columns.add(ci);
				//添加包路径
				Set<String> pkgs= bi.getPkgs();
				pkgs.add(MySqlToJavaUtil.jdbcTypeToJavaTypePck(jdbcType));
				bi.setPkgs(pkgs);
			}
			bi.setCis(columns);
			// 完成后关闭
			columnRs.close();
			columnPstemt.close();
			tablePstat = con.prepareStatement(tableInfoSql);
			tableRs=tablePstat.executeQuery();
			while (tableRs.next()) {
				String tableComment= tableRs.getString(2);
				bi.setEntityComment(tableComment);
			}
			tableRs.close();
			tablePstat.close();
			con.close();
			if (null==columns||columns.size()==0) {
				throw new RuntimeException("未能读取到表或表中的字段。请检查链接url，数据库账户，数据库密码，查询的数据名、是否正确。");
			}
			return bi;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("自动生成实体类错误："+e.getMessage());
		} finally {
            try{
                if(columnRs!=null) columnRs.close();
            }catch(SQLException se2){
            }
            try{
                if(tableRs!=null) tableRs.close();
            }catch(SQLException se2){
            }
			// 关闭资源
            try{
                if(columnPstemt!=null) columnPstemt.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(tablePstat!=null) tablePstat.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(con!=null) con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
		}
	}
}
