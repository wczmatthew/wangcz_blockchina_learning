pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照课程演示，熟悉solidity的错误处理机制
* 2 remix运行，注意发生异常后，状态变量的回退情况，以及以太币的返还
*/
contract ErrorHandle {
    address owner;

    function ErrorHandle() {
        owner = msg.sender;
    }
    
    function sendHalf(address addr) public payable returns (uint balance) {

    }
}