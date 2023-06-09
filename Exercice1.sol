pragma solidity 0.8.19;
import "./IERC20.sol";

contract exercice1  {
    IERC20 token;

    mapping(address => bool) userValided;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function userHasValided(address user) public view returns (bool) {
        return userValided[user];
    }

    function claimToken() public {
        require(userValided[msg.sender] == false, "you have already claim");
        userValided[msg.sender] = true;
        token.transfer(msg.sender, 1 ether);
    }
}