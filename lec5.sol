// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Permit {
    constructor(address recipient)
        ERC20("MyToken", "MTK")
        ERC20Permit("MyToken")
    {
        _mint(recipient, 50000 * 10 ** decimals());
    }
}


contract staking {

    mapping (address=> uint) public stakedAmount;
    MyToken public token;

    function stake(uint256 _amount) public 
    {
        stakedAmount[msg.sender] += _amount;
        token.transfer(address(this),_amount);
    }


    
    function withdraw(uint256 _amount) public {
        require(stakedAmount[msg.sender] >= _amount, "Insufficient staked amount");
        stakedAmount[msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);
    }
}
