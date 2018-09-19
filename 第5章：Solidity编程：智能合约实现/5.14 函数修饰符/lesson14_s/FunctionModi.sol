pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照课程演示，熟悉函数修饰符
* 2 remix运行，注意抛出异常后的运行情况
*/
contract Owned {
    function Owned() public { owner = msg.sender; }
    address owner;

    // `_;` 表示修饰符，可代表被修饰函数位置
    // 意味着函数被调用，或者抛出异常
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // 函数修饰符使用

}


contract Mortal is Owned {
    // 函数修饰符使用

}


contract Modifysample {

    uint a = 10;
    
    modifier mf1 (uint b) {
        require(a < 1);
        _;
        a = 11;
    }
    
    modifier mf2 () {
        uint c = a;
        _;
        a = 12;
    }
    
    function test1() public mf1(a) mf2 returns (uint) {
        return a;
    }

    function test2() public  mf2 mf1(a) returns (uint) {
        return a;
    }
}