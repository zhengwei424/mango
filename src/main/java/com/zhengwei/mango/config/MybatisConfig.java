package com.zhengwei.mango.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

public class MybatisConfig {
    private DataSource dataSource;

    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource);
        // 扫描model
        sqlSessionFactory.setTypeAliasesPackage("com.zhengwei.mango.**.model");

        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        // 扫描映射文件
        sqlSessionFactory.setMapperLocations(resolver.getResources("classpath*:**sqlmap/*.xml"));
        return sqlSessionFactory.getObject();
    }
}
