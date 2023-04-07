pragma solidity 0.8.19;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NoLimitsSolToken is ERC20, Ownable {
    address private owner; 
    constructor(uint256 initalSupply, address[] memory contractsAddress) ERC20("No Limits Token Reward", "NLM") {
        for(uint256 i=0;i < contractsAddress.length;i++){
            _mint(contractsAddress[i], 10000000000000000000000);
        }
    }

    function sendToken(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }
}