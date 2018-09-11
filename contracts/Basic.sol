pragma solidity ^0.4.24;

// 1. 基本資料型態操作
// 2. view function
// 3. transact function
// 4. event log
// 5. function call function
// 6. two contract in one solidity
// 7. contract call contract 禁止迴圈呼叫
// 8. 成本比較
// 9. 開發陷阱

contract test1 {
    uint256 i = 0;
    mapping(address => bool) addresscount;
    mapping(address => string) addressbook;
    event eTest(address, string);
    function register(
        address myaddr,
        string myurl
    )
        public
    {
        addressbook[myaddr] = myurl;
        counter(myaddr);
        emit eTest(myaddr, myurl);
    }

    function counter(
        address myaddr
    )
        public
    {
        if(addresscount[myaddr]) {
            // 已存在
        } else {
            addresscount[myaddr] = true;
            i += 1;
        }
    }

    function find(
        address myaddr
    )
        public
        view
    returns(string) {
        return addressbook[myaddr];
    }
    
    function getSize(
    )
        public
        view
    returns(uint256) {
        return i;
    }
}

contract test2 {
    function remoteCall(
        address test1addr
    )
        public
        view
    returns(uint256) {
        test1(0x000c2e77121daf0270d26bf0a7e9ab0faa8bf739ef).getSize();
        return test1(test1addr).getSize();
    }
}

contract test3 {
    uint256 xuint256;
    bytes32 xbytes32;
    address xaddress;
    uint256[] xuint256arr;
    mapping(uint256 => uint256) xuint256mapping;

    function writeUint(
    )
        public
    {
        xuint256 = 1;
    }
    
    function writeBytes32(
    )
        public
    {
        xbytes32 = 0x1;
    }
    
    function writeAddress(
    )
        public
    {
        xaddress = 0x000c2e77121daf0270d26bf0a7e9ab0faa8bf739ef;
    }
    
    function writeArray(
    )
        public
    {
        xuint256arr.push(100);
    }
    
    function writeMapping(
    )
        public
    {
        xuint256mapping[1] = 20;
    }
}

contract test4 {
    function overflow1(
    )
        public
        pure
    returns(uint256) {
        uint256 x = 1;
        return x - 2;
    }
    
    function overflow2(
    )
        public
        pure
    returns(uint256) {
        uint256 x = 2 ** 255;
        return x*2 + 1;
    }
}