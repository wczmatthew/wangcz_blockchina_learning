pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照课程演示，熟悉函数的访问类型
* 2 remix运行，注意public状态变量的getter函数使用
*/
contract C {
    uint private data;

    //默认函数为public
    function setData(uint a) { data = a; }
    //public函数
    function getData() public returns(uint) { return data; }
    //iternal内部函数
    function compute(uint a, uint b) internal returns (uint) { return a+b; }
    //private私有函数
    function f(uint a) private returns(uint b) { return a + 1; }

}


contract D {
    function readData() {

    }
}


contract E is C {
    function g() {

    }
}


contract C1 {
    uint public data = 42;
    uint[4] public dataList = [1, 2, 3, 4]; 
    mapping (uint=>mapping(uint=>uint)) public dataMap;
    
    function C1() {
        dataMap[1][1] = 11;
    }
}


contract Caller {
    C1 c = new C1();

    function f() public returns (uint, uint, uint) {

    }
}