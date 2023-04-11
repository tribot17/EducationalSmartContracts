pragma solidity 0.8.19;
import "./IERC20.sol";

contract exercice3  {
    IERC20 token;
    
    struct userEntrie {
        string myString;
        uint myUint;
        address myAddress;
    }

    mapping(address => bool) userValided;
    mapping(address => userEntrie) userEntries;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function enterValues(userEntrie memory _entries) public {
        userEntries[msg.sender] = userEntrie(_entries.myString, _entries.myUint, _entries.myAddress);
    }

    function getUserValues(address user) public view returns (userEntrie memory) {
        return userEntries[user];
    } 

    function userHasValided(address user) public view returns (bool) {
        return userValided[user];
    }

    function claimToken() public {
        require(keccak256(bytes(userEntries[msg.sender].myString))  != keccak256(bytes("")), "Enter a string");
        require(userEntries[msg.sender].myUint != 0, "Enter a uint");
        require(userEntries[msg.sender].myAddress == msg.sender, "Enter you address");
        require(userValided[msg.sender] == false, "you have already claim");
        userValided[msg.sender] = true;
        token.transfer(msg.sender, 1 ether);
    }
}