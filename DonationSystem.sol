// SPDX-License-Identifier: MIT
pragma solidity ^0.5.1;

contract DonationSystem{
    event Donate(address donor, uint256 amount);
    event Transfer(address from, address to, uint256 value);
    event Withdraw(address manager, uint256 amount);

    mapping (address => uint256) public coinBalance;
    mapping (address => uint256) public donationBalance;

    uint256 public totalDonation;
    address public manager;

    constructor (uint256 _initialSupply) public{
        manager = msg.sender;
        coinBalance[msg.sender] = _initialSupply;
    }

    modifier onlyManager(){
        require(msg.sender == manager);
        _;
    }

    function donate(uint256 _amount) public {
        require(_amount > 0, "be short of money");
        require(coinBalance[msg.sender] >= _amount);

    coinBalance[msg.sender] -= _amount;
    totalDonation += _amount;
    donationBalance[msg.sender] += _amount;

    emit Donate(msg.sender, _amount);
    }

    function withdrawDonation(uint256 _amount) public onlyManager{
        require(totalDonation >= _amount);
        require(totalDonation + _amount >= _amount);
        require(_amount > 0);

        totalDonation -= _amount;
        emit Withdraw(manager, _amount);
    }

    function transfer(address _to, uint256 _amount) public {
        require(coinBalance[msg.sender] >= _amount);
        require(coinBalance[_to] + _amount > coinBalance[_to]);

        coinBalance[msg.sender] -= _amount;
        coinBalance[_to] += _amount;
    }
    
}