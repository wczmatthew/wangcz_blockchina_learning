pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照课程演示，熟悉合约级的相关操作
* 2 remix运行，注意从一个合约调用另外一个合约的方法
*/
/** 合约之间操作 *************/
contract Account {
    uint accId;
    
    function Account(uint accountId) payable {
        accId = accountId;
    }

    function getData() returns (uint) {
        return accId;
    }

    function setData(uint num) returns (uint) {
        accId = num;
    }
}


//合约创建合约
contract Initialize {
    Account account = new Account(10);
    
    function newAccount(uint accountId) returns (address) {

    }
    
    function newAccountWithEther(uint accountId, uint amount) {
    }
}


//合约调用合约
contract ContractGet {
    Account account;

    function setAddress(address contractAdd) {
    }

    function getData() returns (uint) {
    }
}


//合约继承
contract SubAccount is Account(11) {
    //直接使用父合约的状态变量
    function get() returns (uint) {
    }

    //函数重写，函数名字一致，输入参数和类型一致。
}


/********抽象合约*******/
contract Feline {
    //函数没有函数实现，为抽象函数，对应的合约为抽象合约
    function utterance() returns (bytes32);
    
    function getContractName() returns (string) {
        return "Feline";
    }
}


contract Cat is Feline {
    //继承抽象合约，实现函数功能
    function utterance() returns (bytes32) { return "miaow"; }
}


/********接口*******/
//接口
interface Token {
    function transfer(address recipient, uint amount);
}


//接口可以继承
contract MyToken is Token {
    function transfer(address recipient, uint amount) {
        //函数实现
    }
}


/********库*******/
//library例子
library Set {
    struct Data { mapping(uint => bool) flags; }

    // 第一个参数的类型为"storage reference"，仅存储地址，而不是内容
    // 这个是库的特别特征. 
    // 按照一般语言的惯例，`self`代表第一个参数
    function insert(Data storage self, uint value)
        public
        returns (bool)
    {
        if (self.flags[value])
            return false; // already there
        self.flags[value] = true;
        return true;
    }

    function remove(Data storage self, uint value)
        public
        returns (bool)
    {
        if (!self.flags[value])
            return false; // not there
        self.flags[value] = false;
        return true;
    }

    function contains(Data storage self, uint value)
        public
        view
        returns (bool)
    {
        return self.flags[value];
    }
}


contract C {
    Set.Data knownValues;

    //加入一个数值
    function register(uint value) public {
        // 库可以直接调用，而无需使用this
       
    }

    //判断一个数值是否存在
    function isContain(uint value) public  returns(bool) {
        // 库可以直接调用，而无需使用this
        
    }
}
