<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${daoUrl}.${entityName}Dao">

    <resultMap id="BaseResultMap" type="${entityUrl}.${entityName}">
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
    <select id="selectById" parameterType="java.lang.Long"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from `${table}`
        where `${idColumn}` = <#noparse>#{</#noparse>${idJavaType},jdbcType=${idJdbcType?upper_case}}
    </select>
    <!-- 实体条件查询返回最新的一条数据 -->
    <select id="selectOneByEntity" parameterType="${entityUrl}.${entityName}"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from `${table}`
        <where>
            deleted=0
			 <#list cis as ci>
			 <if test="${ci.property} != null">
                 and `${ci.column}` = <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType?upper_case}}
             </if>
             </#list>
        </where>
        order by `${idColumn}` desc
        limit 1
    </select>

    <!-- 逻辑删除 -->
    <update id="deleteById" parameterType="java.lang.Long">
        update `${table}` set deleted = 1
        where `${idColumn}` = <#noparse>#{</#noparse>${idJavaType},jdbcType=${idJdbcType?upper_case}}
    </update>


    <!--批量逻辑删除 -->
    <update id="deleteByIdList" parameterType="${entityUrl}.${entityName}">
        update `${table}` set deleted = 1
        where
        `${idColumn}` in
        <foreach collection="list" item="item" index="index" open="(" separator="," close=")">
		<#noparse>#{</#noparse>item}
        </foreach>
    </update>
    <!-- 修改-->
    <update id="updateById" parameterType="${entityUrl}.${entityName}">
        update `${table}`
        <set>
			<#list cis as ci>
                <if test="${ci.property} != null">
                    `${ci.column}` = <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType?upper_case}},
                </if>
            </#list>
        </set>
        where `${idColumn}` = <#noparse>#{</#noparse>${idJavaType},jdbcType=${idJdbcType?upper_case}}
    </update>
    <!-- 批量修改-->
    <update id="updateBatch" parameterType="${entityUrl}.${entityName}">
        update `${table}`
        <trim prefix="set" suffixOverrides=",">
            <#list cis as ci>
            <trim prefix="`${ci.column}` = case  ${idColumn} " suffix="end,">
                <foreach collection="list" item="item" index="index">
                    <if test="item.${ci.property} !=null">
                        WHEN <#noparse>#{</#noparse>item.${idJavaType}} THEN <#noparse>#{</#noparse>item.${ci.property}}
                    </if>
                    <if test="item.${ci.property} == null">
                        WHEN <#noparse>#{</#noparse>item.${idJavaType}} THEN `${table}`.`${ci.column}` <!--原数据-->
                    </if>
                </foreach>
            </trim>
            </#list>
        </trim>
        where `${idColumn}` in
        <foreach collection="list" item="item" index="index" open="(" separator="," close=")">
		<#noparse>#{</#noparse>item.${idJavaType}}
        </foreach>
    </update>
    <!-- 插入-->
    <insert id="insert" parameterType="${entityUrl}.${entityName}" useGeneratedKeys="true" keyProperty="id">
        insert into `${table}`
        <trim prefix="(" suffix=")" suffixOverrides=",">
           <#list cis as ci>
               <if test="${ci.property} != null">
                   `${ci.column}`,
               </if>
           </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list cis as ci>
                <if test="${ci.property} != null">
				 <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType?upper_case}},
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
                    <when test="<#noparse>#{</#noparse>item.${ci.property} !=null">
                       <#noparse>#{</#noparse>item.${ci.property},jdbcType=${ci.jdbcType?upper_case}},
                    </when>
                    <otherwise>
                        null,
                    </otherwise>
                </choose>
            </#list>
            </trim>
        </foreach>
        </trim>
    </insert>

    <!-- 分页查询 -->
    <select id="selectPage" parameterType="org.dr.das.model.operator.SystemSelect"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from `${table}`
        where deleted=0
    </select>
    <!-- 实体类条件查询 -->
    <select id="selectPageByEntity" parameterType="${entityUrl}.${entityName}"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from `${table}`
        <where>
            deleted=0
			 <#list cis as ci>
			 <if test="${ci.property} != null">
                 and `${ci.column}` = <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType?upper_case}}
             </if>
             </#list>
        </where>
    </select>

</mapper>