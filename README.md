# **fas-rs插件模板**

- [English](README_EN.md)

## **介绍**

- 本仓库是项目[`fas-rs`](https://github.com/shadow3aaa/fas-rs)的插件系统的模板仓库
- 本仓库同时也是一个`magisk/ksu`模块的模板仓库，这是因为`fas-rs`插件推荐以独立模块的形式存在

## **API**

- 插件脚本是自文档化的，查看对应版本的`main.lua`以获取API说明
- `fas-rs` 致力于保持向后兼容性。也就是说，即使更新的`fas-rs`发生了插件API更新，老的插件也依然能正常工作

| 插件api | 最小fas-rs版本 |
| --- | --- |
| v0(不声明api版本时的默认) | v2.3.0 |

## **使用**

- `magisk/ksu`模块的标准可参考[magisk官方说明](https://magisk.readthedocs.io/en/latest/developers/guides.html)，本仓库的模块模板开箱即用，如无特殊需求修改模块名和[main.lua](main.lua)即可
- 插件实际被fas-rs调用的代码应全部在[main.lua](main.lua)中编写
- [main.lua](main.lua)是自文档化的，包含了如何编写插件脚本的说明
- 记得修改module/module.prop来更改模块名 & 模块id
- 执行```bash ./package.sh```即可打包模块，打包完成后模块位于`output`文件夹
- ps: 可以检查```getprop fas-rs-installed```的输出来确认用户是否安装了`fas-rs`

## **FAQ**

- 为什么推荐以`magisk/ksu`模块的形式开发插件？
  - 有以下原因:
  - 模块的id是唯一的，因此避免了插件重名导致的相互冲突
  - 方便用户管理插件
  - 方便进行依赖检查，比如此模板在未安装`fas-rs`时会拒绝安装

- 可以通过别的方式制作插件吗/插件最基础的注册方式是什么？
  - 复制后缀为`.lua`的lua脚本到`/dev/fas_rs/extensions`文件夹(待它出现后)即可，要求和文档和[main.lua](main.lua)相同
  - 当对`/dev/fas_rs/extensions`下的脚本进行`删除/创建/修改`等操作时，`fas-rs`会重新读取所有插件脚本，也就是说插件是可以即时更新的
