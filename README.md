# document-builder

快速构建你的项目展示站点.

# 如何使用

先将项目clone下来（一般情况你需要fork一份）.

`Your_Posts_Archives`目录展示了如何存放你的文档.


```
# 建议先fork一份,毕竟你要修改不是么
git clone https://github.com/soulteary/document-builder.git && cd Your_Posts_Archives

# 初始化
npm run init
```

在`posts`目录随便写一些你的文档, 然后执行同步操作.

```
# 默认会将文档同步到 ../Website/source/
npm run sync

# 如果你想修改位置, 请使用参数

./node_modules/.bin/note -c=posts --dist=YOUR_DIST_DIR
```

在`Website`目录中, 同样需要先init

```
npm run init
```