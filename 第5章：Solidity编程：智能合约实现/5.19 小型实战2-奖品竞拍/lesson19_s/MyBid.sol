pragma solidity ^0.4.18;
import "./Mycoin.sol";


contract MyBid is Mycoin {
    
    //数据结构
    string private ticket;//电商兑换码
    address owner;//合约创建者

    //时间是unix的绝对时间戳
    uint public auctionEnd;

    // 拍卖的当前状态
    address public highestBidder; //最高出价用户的地址
    uint public highestBid; //最高出价

    //出价列表
    mapping (address => uint) bids;

    // 拍卖结束后设为 true，将禁止所有的变更
    bool ended;

    //事件
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    //dev 创建一个简单的拍卖
    //_biddingTime,拍卖时间；_ticket，兑换码
    function MyBid(
        uint _biddingTime,
        string _ticket
    ) public {
        ticket = _ticket;
        auctionEnd = now + _biddingTime;
        owner = msg.sender;
    }

    // 竞价，value为加价，和之前的出价叠加
    function bid(uint value) public {
        // 如果拍卖已结束，撤销函数的调用。

        // 如果出价不够高，不继续执行


        //把积分发送到合约地址，已经检查额度

        //更新出价和最高出价

    }

    // 结束拍卖，并把最高的出价发送给受益人
    function auctionEnd() public returns (string) {

        // 1. 条件
        require(now >= auctionEnd); // 拍卖尚未结束
        require(!ended); // 该函数已被调用

        //必须是最高出价用户调用，或者管理员强制终止

        // 2. 生效


        // 3. 返回ticket，只能查看一次
        return ticket;
    }

    // `_;` 表示修饰符，可代表被修饰函数位置
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    //开始新的拍卖
    function newBid(uint _biddingTime, string _ticket) onlyOwner {
        // 1. 条件


        //重置数据

    }
}