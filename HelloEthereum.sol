pragma solidity ^0.5;

contract HelloEthreum{
    string[] public masseges;
    address public owner;
    uint8 public count = 0;

    event CountLimit(uint count);

    constructor () public {
        owner = msg.sender;
    }

    function writeMessage(string memory _msg) public {
        masseges.push(_msg);
        count++;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function changeOwner(address newOner) public onlyOwner{
        owner = newOner;
    }
    
    function setCounter() public{
        count += 3;
    }
    function increaseCounter(uint8 num) public {
        require(count + num > count);
        require(num > 0 && num < 10);
        count += num;

        if(count > 20){
            emit CountLimit(count);
        }
    }
}