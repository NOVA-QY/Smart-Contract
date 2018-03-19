pragma solidity ^0.4.14;
contract Payroll{
    //定义雇员结构体
    struct Employee{
        address id;
        uint salary;
        uint lastPayDay;
    }
    
    uint constant payDuration=10 seconds;
    
    address owner;
    Employee[] employees;
    
    function Payroll(){
        owner=msg.sender;
    }
    
    //结构体默认私有，但是solidity中默认可视度为public，应强调私有
    function _partialPaid(Employee employee) private{
        uint payment = employee.salary * (now - employee.lastPayDay) / payDuration;
        employee.id.transfer(payment);
    }
    
    function _findEmployee(address employeeId) private returns (Employee,uint){
        for(uint i=0;i<employees.length;i++){
            if(employees[i].id==employeeId){
                return (employees[i],i);
            }
        }
    }
    
    function addEmployee(address employeeId,uint salary){
        require(msg.sender==owner);
        
	//var可以是任何类型数据的类型修饰符
        var (employee,index) = _findEmployee(employeeId);
        assert(employee.id==0x0);
        
        employees.push(Employee(employeeId,salary*1 ether,now));
    }
    
    function removeEmployee(address employeeId){
        require(msg.sender==owner);
        
        var (employee,index) = _findEmployee(employeeId);
        assert(employee.id!=0x0);
        
        _partialPaid(employee);
        delete employees[index];
	//避免数组空间浪费
        employees[index]=employees[employees.length-1];
        employees.length-=1;
    }

    function updateEmployee(address employeeId,uint salary){
        require(msg.sender==owner);
        var (employee,index) = _findEmployee(employeeId);
        assert(employee.id!=0x0);
        
	//更新之前先结算
        _partialPaid(employee);
        employees[index].salary = salary*=1 ether;
        employees[index].lastPayDay = now;
        return;
    }
    
    function addFund() payable returns (uint){
        return this.balance;
    }
    
    function calculateRunway() returns (uint){
        uint totalSalary=0;
        for(uint i=0;i<employees.length;i++){
            totalSalary+=employees[i].salary;
        }
        return this.balance/totalSalary;
    }
    
    function hasEnoughFund() returns (bool){
        return calculateRunway()>0;
    }
    
    function getPaid(){
        var (employee,index) = _findEmployee(msg.sender);
        assert(employee.id!=0x0);
        
        uint nextPayDay=employee.lastPayDay+payDuration;
        assert(nextPayDay<now);
        
        employees[index].lastPayDay=nextPayDay;
        employee.id.transfer(employee.salary);
    }
}
