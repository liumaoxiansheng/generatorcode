<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${daoUrl}.${entityName}Dao">

	<resultMap id="BaseResultMap" type="${entityUrl}.${entityName}">
	<#list cis as ci>
		<id column="${ci.column}" property="${ci.property}" />
	</#list>
	</resultMap>
	<sql id="Base_Column_List">
		${agile}
	</sql>
    <!-- 查询根据主键 -->
    <select id="findById" parameterType="java.lang.Long"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${table}
        where id = <#noparse>#{id,jdbcType=BIGINT}</#noparse>
    </select>
    <!-- 实体条件查询返回最新的一条数据 -->
    <select id="findByEntity"parameterType="${entityUrl}.${entityName}"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${table}
        <where>
            deleted=0
			 <#list cis as ci>
			 <if test="${ci.property} != null">
                 and ${ci.column} = <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType}}
             </if>
			 </#list>
        </where>
		order by id desc
		limit 1
    </select>

    <!-- 逻辑删除 -->
    <update id="deleteById" parameterType="java.lang.Long">
        update ${table} set deleted = 1
		where id = <#noparse>#{id,jdbcType=BIGINT}</#noparse>
    </update>
    <!-- 修改-->
    <update id="updateById" parameterType="${entityUrl}.${entityName}">
        update ${table}
        <set>
			<#list cis as ci>
			 <if test="${ci.property} != null">
				 ${ci.column} = <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType}},
             </if>
			</#list>
        </set>
		where id = <#noparse>#{id,jdbcType=BIGINT}</#noparse>
    </update>
    <!-- 批量修改-->
    <update id="updateBatch" parameterType="${entityUrl}.${entityName}">
        update ${table}
        <set>
			<#list cis as ci>
			 <if test="${ci.property} != null">
				 ${ci.column} = case id
				 <foreach collection="list" item="item" index="index" separator=",">
                     WHEN <#noparse>#{</#noparse>item.id} THEN <#noparse>#{</#noparse>item.${ci.property}}
				 </foreach>
				 end,
             </if>
			</#list>
        </set>
		where id in
        <foreach collection="list" item="item" index="index" open="(" separator="," close=")">
		<#noparse>#{</#noparse>item.id}
        </foreach>
    </update>
    <!-- 插入-->
    <insert id="insert" parameterType="${entityUrl}.${entityName}" useGeneratedKeys="true" keyProperty="id">
        insert into ${table}
        <trim prefix="(" suffix=")" suffixOverrides=",">
           <#list cis as ci>
			 <if test="${ci.property} != null">
				 ${ci.column},
             </if>
		   </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list cis as ci>
			 <if test="${ci.property} != null">
				 <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType}},
             </if>
			</#list>
        </trim>
    </insert>
    <!-- 批量插入-->
    <insert id="insertBatch" parameterType="java.util.List">
        insert into ${table}
        <trim prefix="(" suffix=")" suffixOverrides=",">
           <#list cis as ci>
			 <if test="${ci.property} != null">
				 ${ci.column},
             </if>
		   </#list>
        </trim>
        <foreach collection="list" item="item" index="index" separator=",">
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list cis as ci>
			 <if test="${ci.property} != null">
				 <#noparse>#{</#noparse>item.${ci.property},jdbcType=${ci.jdbcType}},
             </if>
			</#list>
        </trim>
        </foreach>
    </insert>

    <!-- 分页查询 -->
    <select id="selectPage" parameterType="org.dr.das.model.operator.SystemSelect"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${table}
        where deleted=0
    </select>
    <!-- 实体类条件查询 -->
    <select id="selectPageByEntity" parameterType="${entityUrl}.${entityName}"
            resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${table}
		<where>
            deleted=0
			 <#list cis as ci>
			 <if test="${ci.property} != null">
				and ${ci.column} = <#noparse>#{</#noparse>${ci.property},jdbcType=${ci.jdbcType}}
             </if>
			 </#list>
		</where>


    </select>

</mapper>