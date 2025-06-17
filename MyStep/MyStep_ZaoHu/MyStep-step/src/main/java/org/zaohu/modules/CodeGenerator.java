package org.zaohu.modules;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.fill.Column;
import lombok.extern.slf4j.Slf4j;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

/**
 * @author Step
 */
@Slf4j
public class CodeGenerator {
    public static void main(String[] args) {
        System.out.println("=====================数据库配置(不知道填什么看代码注释)=======================");
//        System.out.println("请输入 URL:jdbc:mysql://localhost:3306/mystep_step");
//        String url = scan.next();
        String url = "jdbc:postgresql://localhost:5432/mystep?currentSchema=public";
//        System.out.println("请输入 username:root");
//        String username = scan.next();
        String username = "postgres";
//        System.out.println("请输入 password:123456");
//        String password = scan.next();
        String password = "zaohu279982";

        FastAutoGenerator.create(url, username, password)
                // 全局配置
                .globalConfig((scanner, builder) -> builder.author(scanner.apply("=====================全局配置=======================\n请输入作者名称？"))
                        .outputDir(System.getProperty("user.dir") + "/MyStep/MyStep_ZaoHu/MyStep-step/src/main/java")
                        .commentDate("yyyy-MM-dd HH:mm:ss")
                        .dateType(DateType.TIME_PACK)
                        .enableSwagger()
                        .enableSwagger()
                        .disableOpenDir()
                )
                // 包配置
                //比如我想生成到modules中的xx文件夹中：就这么写：org.zaohu.modules
                .packageConfig((scanner, builder) -> builder.parent(scanner.apply("=====================包配置=======================\n请输入包名？"))
                //xx写在这里
                        .moduleName(scanner.apply("请输入父包模块名？"))
                        .mapper("mapper")
                        .entity("entity")
                        .service("service")
                        .serviceImpl("service.Impl")
//                        .xml("resources/mapper")
                        .pathInfo(Collections.singletonMap(OutputFile.xml, System.getProperty("user.dir")+"/MyStep/MyStep_ZaoHu/MyStep-step/src/main/resources/mapper"))
                )
                // 策略配置
                .strategyConfig((scanner, builder) -> {
                    builder.addInclude(getTables(scanner.apply("=====================策略配置=======================\n请输入表名，多个英文逗号分隔？所有输入 all")))
                            .serviceBuilder()
                            .formatServiceFileName("%sService")
                            .formatServiceImplFileName("%sServiceImpl")
                            .entityBuilder()        //实体类策略配置
                            .enableLombok()         //开启 Lombok
                            .disableSerialVersionUID()
                            .logicDeleteColumnName("deleted")        //逻辑删除字段
                            .naming(NamingStrategy.underline_to_camel)
                            .columnNaming(NamingStrategy.underline_to_camel)
                            .addTableFills(new Column("create_time", FieldFill.INSERT), new Column("modify_time", FieldFill.INSERT_UPDATE))
                            .enableTableFieldAnnotation()       // 开启生成实体时生成字段注解
                            .controllerBuilder()
                            .formatFileName("%sController")
                            .enableRestStyle()
                            .mapperBuilder()
                            .superClass(BaseMapper.class)
                            .formatMapperFileName("%sMapper")
                            .enableMapperAnnotation()       //@mapper
                            .formatXmlFileName("%sMapper")
                            .enableFileOverride();
                })
                /*
                模板引擎配置，默认 Velocity 可选模板引擎 Beetl 或 Freemarker
                .templateEngine(new BeetlTemplateEngine())
                .templateEngine(new FreemarkerTemplateEngine())
                             */
                .execute();
    }
    // 处理 all 情况
    protected static List<String> getTables(String tables) {
        return "all".equals(tables) ? Collections.emptyList() : Arrays.asList(tables.split(","));
    }
}
