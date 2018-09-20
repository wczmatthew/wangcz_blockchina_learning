pragma solidity ^0.4.18;


contract Mycoin {
    //数据结构
    //1 用户
    address[] userList;
    mapping (address=>uint8) userDict;

    //2 用户的币
    mapping (address => uint) balances;

    //3 用户交易，第一个address为交易发起方，第二个为接收方，uint[]为交易量记录
    mapping (address => mapping(address=>uint[])) public trans;
    
    //用户初次可领取的数量
    uint iniCount = 100; 

    function Mycoin() public {
        //合约本身拥有的币
        balances[this] = 100000;
    }

    //领取货币，只能一次
    function getCoin() public returns (bool sufficientAndFirstGet) {
        //判断合约是否钱还足够
        if (balances[this] < iniCount) return false;
        //判断是否从合约领取过币
        if (trans[this][msg.sender].length != 0) return false;
        //领取币
        balances[this] -= iniCount;
        balances[msg.sender] += iniCount;

        //记录交易
        trans[this][msg.sender].push(iniCount);

        //加入用户列表
        if (0 == userDict[msg.sender]) {
            userList.push(msg.sender);
            userDict[msg.sender] = 1;
        }
        return true;
    }

    //发送货币
    function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
        //判断是否有足够的币
        if (balances[msg.sender] < amount) return false;
        //发生交易
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        //记录交易
        trans[msg.sender][receiver].push(amount);

        //加入用户列表
        if (0 == userDict[receiver]) {
            userList.push(receiver);
            userDict[receiver] = 1;
        }

        return true;
    }

    //获得某个用户的货币量
    function getBalance(address addr) public  returns(uint) {
        return balances[addr];
    }

    //获得领取的进度
    function getPercent() returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < userList.length; i++) {
            address userAddress = userList[i]; //用户的地址
            sum = sum + balances[userAddress];
        }
        return (100*sum)/100000;
    }

    //获得币最多的用户地址
    function getBest() returns (address) {
        address maxAdd = 0;
        uint maxCoin = 0;

        //获得币最多的用户地址
        for (uint i = 0; i < userList.length; i++) {
            address userAddr = userList[i];
            uint userCoin = balances[userAddr];
            if (userCoin > maxCoin) {
                maxCoin = userCoin;
                maxAdd = userAddr;
            }
        }
        return maxAdd;
    }
}