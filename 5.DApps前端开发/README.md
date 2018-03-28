## （一）步骤  
>* 修改`contracts`,加入`Ownable.sol`、`SafeMath.sol`、`Payroll.sol`
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
>* 
>* 
>* 
>* 
