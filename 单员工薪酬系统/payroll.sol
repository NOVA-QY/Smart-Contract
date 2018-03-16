//声明程序版本
pragma solidity ^0.4.14;

//声明合约
contract Payroll {
    //为了测试方便，将发钱周期改为10秒
    uint constant payDuration = 10 seconds;

    //雇主
    address owner;
    //薪水数
    uint salary;
    //雇员
    address employee;
    //上次发工资时间
    uint lastPayday;

    //雇主是智能合约的部署者
    function Payroll() {
        owner = msg.sender;
    }

    //更新员工地址和新的薪水数
    function updateEmployee(address e, uint s) {
	//只有雇主才有权修改领工资的员工信息
        //保证现在执行智能合约的是雇主
        require(msg.sender == owner);
        
        //清算上一个员工的工资，并发工资
        if (employee != 0x0) {
            uint payment = salary * (now - lastPayday) / payDuration;
            employee.transfer(payment);
        }

        //更新员工地址与薪水，并更新上一次发工资时间
        employee = e;
        salary = s * 1 ether;
        lastPayday = now;
    }
    
    //向智能合约里打钱
    function addFund() payable returns (uint) {
        return this.balance;
    }
    
    //检查智能合约内的余额还可以发放多少个周期
    function calculateRunway() returns (uint) {
        return this.balance / salary;
    }
    
    //检查合约里的钱是否足够
    function hasEnoughFund() returns (bool) {
        return calculateRunway() > 0;
    }
    
    //领钱操作
    function getPaid() {
        require(msg.sender == employee);
        
        //更新下次发钱时间
        uint nextPayday = lastPayday + payDuration;
        assert(nextPayday < now);

        lastPayday = nextPayday;
        employee.transfer(salary);
    }
}
