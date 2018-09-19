pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照课程演示，熟悉函数属性的使用
* 2 remix运行，注意不同熟悉的函数调用，消耗的gas情况
*/
contract FunctionChara {
    string name;
    uint public age;
    uint constant X = 32**22 + 8;
    string constant TEXT = "abc";
    bytes32 constant MY_HASH = keccak256("abc");
    
    function setData() public {
        name = "liushiming";
        age = 29;
    }
    
    function getAge() public returns(uint) {
        return age; 
    }

    function getAgeByView() public view returns(uint) {

    }
    
    function getAgeByPure() public pure returns(uint) {

    }
}