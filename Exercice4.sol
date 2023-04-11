pragma solidity 0.8.19;
import "./IERC20.sol";

contract exercice4 {
    IERC20 token;

    mapping(address => bool) userValided;
    mapping(address => uint) userValue;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function increaseUserValue() public {
        userValue[msg.sender] = userValue[msg.sender] + 2;
    }

    function decreaseUserValue() public {
        userValue[msg.sender] = userValue[msg.sender] - 1;
    }

    function getUserValue(address user) public view returns (uint){
        return userValue[user];
    }

    function userHasValided(address user) public view returns (bool) {
        return userValided[user];
    }

    function claimToken() public {
        require(userValided[msg.sender] == false, "you have already claim");
        require(userValue[msg.sender] == 7, "Wrong value");
        userValided[msg.sender] = true;
        token.transfer(msg.sender, 1 ether);
    }
}