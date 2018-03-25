# Truffle全栈开发  
## （一）Truffle  
>* 编译  
>* 部署  
>* 测试  
>* 包管理  
>* 前端  

## （二）开发环境  
>* Virtualbox  
>* juicebox  
>* NVM node  
>* 安装truffle  

## （三）环境搭建  
```
npm -g install truffle  //下载框架
mkdir payroll           //创建目录
cd payroll              
truffle unbox metacoin  //产生实例
```

`truffle init`改为`truffle unbox metacoin`可以产生几个文件: 
>* contracts  存放智能合约
>* migrations  存放帮助我们将智能合约部署到网络上的程序
>* test  存放用于测试智能合约的脚本  
>* truffle.js  存放一些配置信息  

## （四）主要命令  
>* truffle compile  
>* truffle migrate  
>* truffle console  
>* truffle test  
>* truffle unbox  

## （五）部署  
>* 客户端  
>* TestRPC  
>	* 基于javascript的区块链“模拟器”  
