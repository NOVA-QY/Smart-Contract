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
>* TestRPC(现用ganache-cli)  
>	* 基于javascript的区块链“模拟器”  
>	* 不需要等待“挖矿”，所有区块链操作瞬间完成  
>	* 主要用于部署前测试

*  Web3j:区块链和javascript交互的桥梁

```
新建一个terminal
>>>  ganache-cli
切换回之前窗口
>>>  truffle migration  
部署成功
>>>  trufflre console     //利用控制台交互

truffle(development)>  web3.eth.accounts    //列出网络中所有的账户
truffle(development)>  web3.currentProvider //列出当前连接网络的信息
truffle(development)>  web3.personal.newAccount()    //创建一个新的账户

由于MetaCoin已经部署，可通过此关键字进行交互
truffle(development)>  MetaCoin.deployed().then(contract => { metacoin = contract })
truffle(development)>  metacoin  //通过实例与合约交互
```

**可通过Web3调用合约方程**
>* 方程名.call()     //只可用于只读方程
>* 方程名.send()/方程名()  

```
查看账户余额
truffle(development)>  metacoin.getBalance.call('0x418729f901149a6af3c6248e463b8632c1d29ebc').then((result) => {console.log(result)})  
```
返回结果:`{ [String: '10000'] s: 1, e: 4, c: [ 10000 ] }`
```
给第二个账户打钱
truffle(development)>  metacoin.sendCoin('0xf0f9a288074e24c6081a9a7fa1c49b8d18e45567',2).then((result) => {console.log(result)})
```
返回`账户信息`说明转账成功  
**注**:调用的函数不可有call，否则会导致操作只会在本地的node上执行，不会同步到etherium网络  

## （六）前端开发  
>* truffle box:脚手架，包含后端contract和前端代码  
>* Web3  
```
rm -rf *    //首先删除当前目录下的所有内容
truffle unbox react  //下载react
```




