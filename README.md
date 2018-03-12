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
[Remix](http://remix.ethereum.org)  
![Image text](https://github.com/NOVA-QY/SmartContract/blob/master/img-folder/1.png)  
>* **1.点击‘create’部署合约**  
>* **2.测试set/get方法**  
![image text](https://github.com/NOVA-QY/SmartContract/blob/master/img-folder/2.png)
