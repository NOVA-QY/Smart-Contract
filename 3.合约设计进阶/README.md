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
```solidity
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
    //父类的构造参数可以是子类参数的任意运算
    function Child(uint _y) Parent(_y*_y){
        y = _y;
    }
    
    function child(){
        parentFunc2();
        this.parentFunc3();
        parentFunc1();
        //错误:private对继承类不可见:ParentFunc4();
    }
}

//不同的父类构造方法
contract Child2 is Parent(666){
    uint y;
    function Child(uint _y){
        y = _y;
    }
    
    function child(){
        parentFunc1();
        parentFunc2();
        this.parentFunc3();
        //错误:private对继承类不可见:ParentFunc4();
    }
}
```  
**继承：抽象合约**  
```solidity
pragma solidity ^0.4.0;
contract Parent{
    function someFunc() returns (uint);
}

contract Child is Parent{
    function someFunc() returns (uint){
        return 1;    
    
}
```
**继承--INTERFACE**  
```solidity
pragma solidity ^0.4.0;
interface Parent{
    //不可继承其他合约或interface  
    //没有构造函数
    //没有状态变量
    //没有struct
    //没有enum
    //简单来说，只有function定义，啥也没有！
    function someFunc() returns (uint);
}

contract Child is Parent{
    function someFunc() returns (uint){
        return 1;
    }
}
```  
**继承--多继承**
* 最平凡的多继承
```solidity
contract Base1{
    function func1(){}
}

contract Base2{
    function func2(){}
}

contract Final is Base1,Base2{
    
}
```  
* 重名函数的override次序  
```solidity
pragma solidity ^0.4.0;
contract Base1{
    function func1(){}
}

contract Base2{
    function func1(){}
}

contract Final is Base1,Base2{
    
}

contract test{
    Final f = new Final();
    f.func1();   
}

```  
**继承--多继承**  
* super:动态绑定上级函数  
```solidity
contract foundation{
    function func1(){
        //do stuff
    }
}

contract Base1 is foundation{
    function func1(){super.func1();}
}

contract Base2 is foundation{
    function func1(){super.func1();}
}

contract Final is Base1,Base2{
    
}

contract test{
    Final f = new Final();
    f.func1();
}
//
```  
## （五）MODIFIER  







