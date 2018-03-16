# SmartContract
用Solidity编写智能合约，实现员工薪酬系统  

## （一）Solidity智能合约示例
**声明程序版本**
```solidity
pragma solidity ^0.4.0
```
**合约声明**
```solidity
contract SimpleStorage{
}
```

**状态变量**
```solidity
contract SimpleStorage{
    uint storedData;
}
```

**合约方法**
```solidity
contract SimpleStorage{
    uint storedData;
    
    function set(uint x){
        storedData=x;
    }
    
    function get() constant returns (uint){
        return stroedData;
    }
}
```
注：constant在此无效

## （二）在线IDE  
> [Remix](http://remix.ethereum.org)  
> ![Image text](https://github.com/NOVA-QY/SmartContract/blob/master/img-folder/1.png)  
> **1.点击create部署合约**  
> **2.测试set/get方法**  
![image text](https://github.com/NOVA-QY/SmartContract/blob/master/img-folder/2.png)  
> **3.合约生效**  
![image text](https://github.com/NOVA-QY/SmartContract/blob/master/img-folder/3.png)
> 
> **gas与gas price区别：**  
任何特定的合约所需的运行合约的Gas数量是固定的，由合约的复杂度决定，而Gas价格由想运行合约的人规定，在他们提交运行合约请求的时候（有点类似于比特币的交易费）。  
每个矿工会根据Gas的价格的高低来决定他们是否想作为区块的一部分去运行此合约。如果你希望矿工运行你的合约，你最好提供高一点的Gas价格。  
在某种程度是这是一场基于合约运行有多愿意付费驱动下的竞价。  
> 
> **关于transaction cost和execution cost的区别是什么？**  
Execution cost包括存储全局变量以及方法调用相关的运行环境的开销。同一个函数，每次调用时的execution cost有可能是不同的。（比如全局变量发生了变化导致）  
而transaction cost和编译后的合约代码长度相关，也和execution cost相关。同一个合约，每次执行时transaction cost - execution cost的值应该是不变的。  
## （三）Solidity中的地址Address(钱包account可以是地址、智能合约contract也可以是地址)  
>* address.balance 地址里存放的钱数  
>* address.transfer(value) 可以将调用后的异常返回到调用者手中  
>* address.send(value) 只能返回 调用成功或失败的布尔类型 
>* address.call,address.callcode and address.delegatecall  

## （四）单位系统  
**ETHER单位**
>* wei(相当于1)  
>* szabo  = 10^12 wei  
>* finney = 10^15 wei  
>* ether  = 10^18 wei  

**时间单位**
>* seconds  
>* minutes  
>* hours  
>* days  
>* weeks  
>* years  

## （五）块  
>* block.blockhash(uint blockNumber) returns (bytes32)  返回块的哈希值  
>* block.coinbase(address)  谁挖到了矿  
>* block.difficulty(uint)   
>* block.gaslimit(uint)     gas上限  
>* block.number(uint)       块的序号  
>* block.timestamp(uint)    块的创建时间  
>* now                      

## （六）消息  
>* msg.data  
>* msg.gas(uint)  
>* msg.sender(address)  
>* msg.sig  
>* msg.value(uint)  
