pragma solidity ^0.4.2;
contract InfoCard {
    string public name;
    string public studentId;
    string public team2;
    address public owner;

    function InfoCard(string _name, string _studentId) public {
        name = _name;
        studentId = _studentId;
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    function setTeam2(string _newTeam) public onlyOwner{
        team2 = _newTeam;
    }
}