pragma solidity 0.8.19;
import "./IERC20.sol";

contract exercice2  {
    IERC20 token;

    uint secretValue;

    mapping(address => bool) userValided;
    mapping(address => uint) userValue;

    constructor(address _tokenAddress, uint _secretValue) {
        token = IERC20(_tokenAddress);
        secretValue = _secretValue;
    }

    function getSecretValue() view public returns (uint) {
        return secretValue;
    }

    function enterValue(uint _userValue) public {
        userValue[msg.sender] = _userValue; 
    }

    function getUserValue(address user) public view returns (uint){
        return userValue[user];
    }

    function userHasValided(address user) public view returns (bool) {
        return userValided[user];
    }


    function claimToken() public {
        require(userValue[msg.sender] == secretValue, "Wrong value");
        require(userValided[msg.sender] == false, "you have already claim");
        userValided[msg.sender] = true;
        token.transfer(msg.sender, 1 ether);
    }
}