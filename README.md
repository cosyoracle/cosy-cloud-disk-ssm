# cosy-cloud-disk-ssm
基于hadoop的个人云盘

## 背景
该项目基于hadoop，通过hdfs实现个人云盘的功能，包括文件的上传下载修改删除等

## 主要功能
- 提供了用户的注册和登入
- 注册时需要有key进行效验
- 完成了文件的上传下载修改等功能
- 提供了回收站和收藏功能
- 首页进行了文件的一些统计
- 各个用户只能看到各自的文件
- 提供了文件夹的创建和删除

## 使用说明
1. hadoop 2.9.2
2. 需提前搭建好hadoop环境，以及提前安装好mysql
3. 需在src\main\resources路径下的jdbc.properties文件里配置数据库连接信息
4. 需在src\main\java\com\cosyblogs\cloud\disk\service\impl的HDFSServiceImpl.java里配置HDFS的基本信息
5. 数据库的sql语句在sql.txt下
6. 如需了解更多请[点击这里](https://www.cosyblogs.com/blogs/big-data/398.html)

## 注意
- 目前来说还没有对代码做优化，执行效率方面可能不是特别好，仅供个人学习使用
- 安全性方面也没有太多考虑
- 可能会有些bug



