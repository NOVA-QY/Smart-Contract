## （一）步骤  
>* 修改`contracts`，加入`Ownable.sol`、`SafeMath.sol`、`Payroll.sol`
>* truffle compile编译
>* 修改`2_deploy_contracts.js`内含代码:
```solidity
var Ownable = artifacts.require("./Ownable.sol");
var SafeMath = artifacts.require("./SafeMath.sol");
var Payroll = artifacts.require("./Payroll.sol");

module.exports = function(deployer) {
  deployer.deploy(Ownable);
  deployer.deploy(SafeMath);


  deployer.link(Ownable,Payroll);
  deployer.link(SafeMath,Payroll);
  deployer.deploy(Payroll);
};
```  
>* 部署合约：新开终端输入`ganache-cli`，切换回原终端输入`truffle migrate`  
>* 控制台交互：`truffle console`
```
//实例化
truffle(development)> Payroll.deployed().then(instance=>{payroll=instance})
//获取账户
truffle(development)> web3.eth.accounts
//加入员工
truffle(development)> payroll.addEmployee('0xf6197e34b320d808df539fa3ee2a32d5e1137e9a',2)
//查看员工信息
truffle(development)> payroll.employees.call('0xf6197e34b320d808df539fa3ee2a32d5e1137e9a').then(result=>console.log(result))
```
