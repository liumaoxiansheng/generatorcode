<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${daoUrl}.${entityName}Mapper">

    <resultMap id="BaseResultMap" type="${entityUrl}.${entityName}Model">
	<#list cis as ci>
        <#if ci.isPrimaryKey=='true'>
            <id column="${ci.column}" property="${ci.property}"/>
        <#else >
        <result column="${ci.column}" property="${ci.property}"/>
        </#if>
    </#list>
    </resultMap>
    <sql id="Base_Column_List">
    ${agile}
    </sql>
    <!-- 查询根据主键 -->
    <select id="selectById"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from `${table}`
        where `${idColumn}` = <#noparse>#{</#noparse>${idJavaType}}
    </select>


    <!-- 逻辑删除 -->
    <delete id="deleteById" >
        delete from  `${table}`
        where `${idColumn}` = <#noparse>#{</#noparse>${idJavaType}}
    </delete>


    <!-- 修改-->
    <update id="updateById" parameterType="${entityUrl}.${entityName}Model">
        update `${table}`
        <set>
			<#list cis as ci>
                <#if ci.isPrimaryKey == 'false'>
            <if test="${ci.property} != null <#if ci.javaType=='String'> and ${ci.property} != '' </#if>">
               `${ci.column}` = <#noparse>#{</#noparse>${ci.property}},
            </if>
                </#if>
            </#list>
        </set>
        where `${idColumn}` = <#noparse>#{</#noparse>${idJavaType}}
    </update>

    <!-- 插入-->
    <insert id="insert" parameterType="${entityUrl}.${entityName}Model" useGeneratedKeys="true" keyProperty="${idJavaType}">
        insert into `${table}`
        <trim prefix="(" suffix=")" suffixOverrides=",">
           <#list cis as ci>
               <if test="${ci.property} != null <#if ci.javaType=='String'> and ${ci.property} != '' </#if>">
                   `${ci.column}`,
               </if>
           </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list cis as ci>
                <if test="${ci.property} != null <#if ci.javaType=='String'> and ${ci.property} != '' </#if>">
				 <#noparse>#{</#noparse>${ci.property}},
                </if>
            </#list>
        </trim>
    </insert>

    <!-- 批量插入-->
    <insert id="insertBatch" parameterType="java.util.List">
        insert into `${table}`
        <trim prefix="(" suffix=")" suffixOverrides=",">
           <#list cis as ci>

                   `${ci.column}`,
           </#list>
        </trim>
        values
        <trim suffixOverrides=",">
        <foreach collection="list" item="item" index="index" separator=",">
            <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list cis as ci>
                <choose>
                    <when test="item.${ci.property} !=null">
                       <#noparse>#{</#noparse>item.${ci.property}},
                    </when>
                    <otherwise>
                        DEFAULT,
                    </otherwise>
                </choose>
            </#list>
            </trim>
        </foreach>
        </trim>
    </insert>

    <!-- 分页查询 -->
    <select id="listPage"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from `${table}`
        <where>
            <if test="keyword !=null">
                and `column_name` like concat('%',<#noparse>#{</#noparse>keyword},'%')
            </if>
        </where>
    </select>
    <!-- 实体条件查询返回最新的一条数据 -->
    <select id="selectOneByEntity" parameterType="${entityUrl}.${entityName}Model"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from `${table}`
        <where>
            <#list cis as ci>
                <if test="${ci.property} != null <#if ci.javaType=='String'> and ${ci.property} != '' </#if>">
                    and `${ci.column}` = <#noparse>#{</#noparse>${ci.property}}
                </if>
            </#list>
        </where>
        order by `${idColumn}` desc
        limit 1
    </select>

    <insert id="initTable">
    </insert>

</mapper>