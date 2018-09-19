pragma solidity ^0.4.18;


/**
* 练习内容
* 1 按照演示，完成相关代码，熟悉数据的位置和引用
* 2 在remix中运行
*/
contract Location {
    struct User {
        string name;
        uint amount;
    }

    User u; 

    //状态变量storage赋值给storage
    function storageToStorage() returns(string) {

    }

    //memory赋值给状态变量storage
    function memoryToStateStorage() returns(string) {

    }

    //memory赋值给状局部storage变量
    function memoryToLocalStorage() {

    }

    //storage赋值给memory
    User u2 = User("abcd324", 15);
    function storageToMemory() returns(string) {

    }

    //memory赋值给memory
    function memoryToMemory() returns(string) {

    }
}


//官方的例子
contract D {
    uint[] x; //x的位置类型为storage

    //memoryArray的位置类型为memory
    function f(uint[] memoryArray) {
        x = memoryArray; //把数组完整复制到x中
        uint[] y = x; // y为x的引用， 其地址同样为storage
        y[7]; // 正确
        y.length = 2; // 通过y修改x，x也发生了改变 
        //y = memoryArray; //错误，因为y是个引用
        //uint[] z = new uint[](3); //错误，storage变量只能静态分配

        uint[] memory z = y; //正确，完全拷贝
        uint[] memory w = x;//正确，完全拷贝
        uint[] k = y;//正确，引用
        
        g(x); // 调用g， 构建一个x的引用
        h(x); // 调用h，创建一个x的独立拷贝
    }

    function g(uint[] storage storageArray) internal {}
    function h(uint[] memoryArray) {}
}