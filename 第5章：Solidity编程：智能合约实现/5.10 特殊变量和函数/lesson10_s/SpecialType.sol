pragma solidity ^0.4.18;


/**
* 练习内容
* 1 完成演示代码，了解address等特殊类型
* 2 理解以太币的转移方法
*/
contract SpecialType {    
    //调用者向合约地址转入 msg.value 个以太币，单位是 wei
    function deposit() payable returns (address, uint) {
    }

    //调用者取回value(单位为wei)个以太币
    function draw(uint value) {
    }

    //获得合约的地址和以太币
    function getContractAddrees() constant returns (address, uint) {
    }
    
    //获得addr的以太币
    function getBalance(address addr) constant returns (uint) {
    }

    //返回当前的时间截
    function nowInSeconds() returns (uint256) {
        return now;
    }
    
    //时间单位的使用
    function f(uint start, uint daysAfter) returns(bool) {
        //时间单位的使用
        if (now >= start + daysAfter * 1 days) { 
            return true;
        }
    }

}


//transfer的例子
contract Transfer { 
    // 向account发送以太币
    // 可以理解为，先从调用方发送以太坊给合约地址，然后由合约地址发送给account
    function deposit(address account) payable {
    }
  
    // 读取 account 地址的余额
    function getAccountBalance(address account) constant returns (uint) {
    }  
    
    // 读取合约发起方的地址和余额
    function getOwnerBalance() constant returns (address, uint) {

    } 
}