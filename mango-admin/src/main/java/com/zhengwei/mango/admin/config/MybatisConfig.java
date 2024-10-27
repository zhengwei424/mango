package com.zhengwei.mango.admin.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
@MapperScan("com.zhengwei.mango.admin.dao")
public class MybatisConfig {
    @Autowired
    private DataSource dataSource;

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource);
        // 扫描model
        sqlSessionFactory.setTypeAliasesPackage("com.zhengwei.mango.admin.model");

        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        // 扫描映射文件
        sqlSessionFactory.setMapperLocations(resolver.getResources("classpath*:**/sqlmap/*.xml"));
        return sqlSessionFactory.getObject();
    }
}
