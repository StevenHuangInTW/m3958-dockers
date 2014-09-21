## Dockerfile for running vertx apps.

### 创建docker遵循的原则

我偏向于将所有的配置文件通过host的目录映射到container，通过修改配置文件影响container的行为。host的目录和容器的目录做好约定，只要备份host下的/opt/dockerdata，所有的环境和数据都不会丢失。复制dockerbuild-tpl目录，修改符合自己的需要即可。


#### 目录的约定

```
/opt
    dockerdata/
              vertx/
              mysql5/
              solr/


/opt/runningdir/
               supervisord.conf
               redis.conf
               dnsmasq.conf
               ...
```

### 附带的脚本

- runinhost_once.sh 在主机上执行一次
- rundock.sh 启动docker container
- debugrun.sh 进入容器的bash，看看哪里出了问题
- rundocker.sh 运行container
