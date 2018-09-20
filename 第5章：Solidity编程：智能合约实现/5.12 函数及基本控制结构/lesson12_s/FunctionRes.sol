pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照课程演示，熟悉solidity函数的基本使用
* 2 remix运行，注意一个合约调用另外一个合约，gas的来源问题
*/
contract FunctionRes {
    //varName 是一个函数类型，默认为internal类型
    function(uint) returns (uint) varName;

    //simpleFunction是正常的合约函数，可见性默认为public
    function simpleFunction(uint parameter) returns (uint) {
        return parameter;
    }

    //test是正常的合约函数，varName可以被赋值
    function test() returns (uint) {
        varName = simpleFunction;
        return varName(1111);
    }
}


contract InfoFeed {
    //内部调用，可以递归调用
    function g(uint a) returns (uint ret) { return f(); }
    function f() returns (uint ret) { return g(7) + f(); }

    function info() payable returns (uint ret) { 
        return msg.value;
    }
}


contract Consumer {
    InfoFeed feed;

    //给合约一些以太币
    function deposite() payable returns(uint) {
        return msg.value;
    }

    //合约的余额
    function left() returns(uint) {
        return this.balance;
    }

    //设置合约地址
    function setFeed(address addr) {
        feed = InfoFeed(addr);
    }

    //外部调用
    function callfeed() returns(uint) {
        return feed.info.value(10).gas(100)();
    }
}