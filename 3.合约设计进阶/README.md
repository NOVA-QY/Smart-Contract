## （一）如何减少GAS消耗?  
>* 设置totalSalaty为**全局变量**，使得不必每次循环多进行一次计算  

## （二）mapping  
>* 类似于map(C++),dict(python)  
>* key允许的类型:bool,int,address,string  
>* value可为任何类型  
>* mapping(address=>Employee) employees  
>* 只能作为成员变量，不可作为局部变量  

**底层实现:**  
>* 不使用数组+链表，不需要扩容  
>* hash函数为keccak256hash，在storage上存储，理论无限大的hash表  
>* 无法遍历整个mapping  
>* 赋值:employees[key]=value  
>* 取值:value=employees[key]  
>* value是引用，在storage上存储，可以直接修改  
>* 当key不存在，value=type's default  

## （三）可视度  
>* public:谁都可见  
>* external:只有“外部调用”可见 **(特殊)**
>* internal:外部调用不可见，内部和子类可见  
>* private:只有当前合约可见  
>* 状态变量:public,internal,private  
>	* 默认internal  
>	* public:自动定义取值函数
>	* private:不代表别的肉眼无法看到，只代表别的区块链智能合约无法看到  
**合约的所有成员变量都是肉眼可见的**  
>* 函数public，external，internal，private  
>	* 默认public  

## （四）继承的基本语法
```
pragma solidity ^0.4.0;

contract owned{
    address owner;
    function owned(){
        owner = msg.sender;
    }
}

contract Parent is owned{
    uint x;
    
    function Parent(uint _x){
        x = _x;
    }
    
    function parentFunc1() internal{
        if(msg.sender == owner) selfdestruct(owner);
    }
    
    function parentFunc2() public {}
    
    function parentFunc3() external {}
    
    function parentFunc4() private {}
}

contract Child is Parent{
    uint y;
    //
    function Child(uint _y) Parent(_y*_y){
        y = _y;
    }
    
    function child(){
        parentFunc2();
        this.parentFunc3();
        parentFunc1();
        //
    }
}

//
contract Child2 is Parent(666){
    uint y;
    function Child(uint _y){
        y = _y;
    }
    
    function child(){
        parentFunc1();
        parentFunc2();
        this.parentFunc3();
        //
    }
}
```


