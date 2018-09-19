pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照课程演示，熟悉event的使用
* 2 remix运行，注意日志变化
*/
contract FunctionEvent {
    event Deposit(
        address indexed _from,
        bytes32 indexed _id,
        uint _value
    );

    function deposit(bytes32 _id) {
        // 调用事件，生成日志
    }

    //不调用event
    function get(bytes32 _id) {
    }

}