pragma solidity ^0.4.14;
contract Payroll{
    
    struct Employee{
        address id;
        uint salary;
        uint lastPayDay;
    }
    
    uint constant payDuration=10 seconds;
    
    //为减少GAS消耗，设为全局变量
    uint totalSalary=0;
    address owner;
    mapping(address => Employee) employees;
    
    function Payroll(){
        owner=msg.sender;
    }
    
    function _partialPaid(Employee employee) private{
        uint payment = employee.salary * (now - employee.lastPayDay) / payDuration;
        employee.id.transfer(payment);
    }
    
    function addEmployee(address employeeId,uint salary){
        require(msg.sender==owner);
        
        var employee = employees[employeeId];
        assert(employee.id==0x0);
        totalSalary+=salary * 1 ether;
        employees[employeeId]=Employee(employeeId,salary*1 ether,now);
    }
    
    function removeEmployee(address employeeId){
        require(msg.sender==owner);
        
        var employee = employees[employeeId];
        assert(employee.id!=0x0);
        
        _partialPaid(employee);
        
        delete employees[employeeId];
    }

    function updateEmployee(address employeeId,uint salary){
        require(msg.sender==owner);
        var employee = employees[employeeId];
        assert(employee.id!=0x0);
        
        _partialPaid(employee);
        totalSalary-=employees[employeeId].salary;
        
        employees[employeeId].salary = salary*=1 ether;
        totalSalary+=employees[employeeId].salary;
        
        employees[employeeId].lastPayDay = now;
        return;
    }
    
    function addFund() payable returns (uint){
        return this.balance;
    }
    
    function calculateRunway() returns (uint){
        
        return this.balance/totalSalary;
    }
    
    function checkEmployee(address employeeId) returns (uint salary,uint lastPayDay){
        var employee = employees[employeeId];
        return (employee.salary,employee.lastPayDay);
    }
    
    function hasEnoughFund() returns (bool){
        return calculateRunway()>0;
    }
    
    function getPaid(){
        var employee = employees[msg.sender];
        assert(employee.id!=0x0);
        
        uint nextPayDay=employee.lastPayDay+payDuration;
        assert(nextPayDay<now);
        
        employees[msg.sender].lastPayDay=nextPayDay;
        employee.id.transfer(employee.salary);
    }
}
