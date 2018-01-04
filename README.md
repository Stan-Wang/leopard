# Leopard 基于Grape的后端API模板项目


## 技术栈
* [Postgresql](https://www.postgresql.org/download/)：数据库
* [Redis](https://redis.io/)：Redis,用于生成自增序列
* [rails](https://guides.ruby-china.org/)：web开发框架
* [Grape](http://www.ruby-grape.org)：API框架
* [Swagger](https://github.com/ruby-grape/grape-swagger-rails)：API文档

## 安装
1. 项目克隆:

    ```terminal
      $ git clone git@github.com:Stan-Wang/leopard.git
    ```
2. 安装gem包和前端库及依赖库

    ```terminal
      $ cd leopard // 切换至项目目录下
      $ bundle i // 安装gem包
    ```

3. 创建数据库

    ```terminal
      $ cp config/database.yml.default config/database.yml //配置初始化数据库链接
      $ rails db:create // 创建数据库
      $ rails db:migrate // 执行迁移文件 db/migrate/*
      $ rails db:seed // 初始化基础数据
      

    ```
4.  启动服务器

    ```
      $ rails s
    ```
4.  访问API文档

    http://localhost:3000/apidoc


