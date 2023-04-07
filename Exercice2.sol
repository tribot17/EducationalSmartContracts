pragma solidity 0.8.19;
import "./IERC20.sol";

contract exercice2  {
    IERC20 token;
    
    struct userEntrie {
        string myString;
        uint myUint;
        address myAddress;
    }

    bool valided = false;

    mapping(address => userEntrie) userEntries;

    constructor(address _tokenAddress) {
    token = IERC20(_tokenAddress);
    }

    function enterString(string memory _myString) public {
        userEntries[msg.sender].myString = _myString; 
    }

    function enterUint(uint _myUint) public{
        userEntries[msg.sender].myUint = _myUint;
    }

    function enterAddress(address _myAddress) public{
        require(_myAddress == msg.sender, "it's not your address");
        userEntries[msg.sender].myAddress = _myAddress;
    }


    function claimToken() public {
        require(keccak256(bytes(userEntries[msg.sender].myString))  != keccak256(bytes("")), "Enter a string");
        require(userEntries[msg.sender].myUint != 0, "Enter a uint");
        require(userEntries[msg.sender].myAddress == msg.sender, "Enter you address");
        require(valided == false, "you have already claim");
        valided = true;
        token.transfer(msg.sender, 1 ether);
    }
}