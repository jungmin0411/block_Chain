pragma solidity ^0.5.1;

contract SimpleCoin{
    mapping (address => uint256) public coinBalance;

    event Transfer(address from, address to, uint256 value);

    constructor(uint256 _initialSupply) public{
        coinBalance[msg.sender] = _initialSupply;
    }

    function transfer(address _to, uint256 _amount) public payable{
        require(coinBalance[msg.sender] > _amount);
        require(coinBalance[_to] + _amount >= coinBalance[_to]);
        coinBalance[msg.sender] -= _amount;
        coinBalance[_to] += _amount;
        emit Transfer(msg.sender, _to , _amount);
    }
}