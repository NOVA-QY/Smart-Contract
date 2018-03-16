# 设计多员工薪酬系统  

## （一）数组
>* 固定长度数组:(uint[5] a)　　　无法在运行时改变长度　　
>* 动态长度数组:(uint[] a)        在运行时长度可以改变　
>* 成员  
>	* length  
>	* push　　　　只有动态数组有  

**注：动态数组在创建时，里面没有元素，默认长度为0**  

## （二）结构体  
```solidity
struct Employee{
    address id;
    uint salary;
    uint lastPayDay;
}
```

## （三）设计  
>* 通过数组来存储多个员工的信息  
>   * Employee[] employees  
>   * function addEmployee  
>   * function removeEmployee  



