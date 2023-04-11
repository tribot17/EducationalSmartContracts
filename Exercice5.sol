pragma solidity 0.8.19;
import "./IERC20.sol";

contract exercice4 {
    IERC20 token;

    mapping(address => bool) userValided;
    mapping(address => uint) userValue;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function userHasValided(address user) public view returns (bool) {
        return userValided[user];
    }

    function claimToken(uint valueA, uint valueB) public {
        require(valueB != 0, "Not zero");
        require(valueA != valueB, "Not equal");
        require(valueA >= 10, "Less than fivten");
        require(valueA <= 35, "Less than fivten");
        require(valueB < valueA - 10, "10 minus than value A");
        require(userValided[msg.sender] == false, "you have already claim");
        userValided[msg.sender] = true;
        token.transfer(msg.sender, 1 ether);
    }
}