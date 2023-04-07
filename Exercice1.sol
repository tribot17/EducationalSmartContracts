pragma solidity 0.8.19;
import "./IERC20.sol";

contract exercice1  {
    IERC20 token;

    bool valided = false;

    mapping(address => string) userString;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function enterString(string memory _myString) public {
        userString[msg.sender] = _myString; 
    }


    function claimToken() public {
        require(keccak256(bytes(userString[msg.sender]))  != keccak256((bytes(""))), "Enter a string");
        require(valided == false, "you have already claim");
        valided = true;
        token.transfer(msg.sender, 1 ether);
    }
}