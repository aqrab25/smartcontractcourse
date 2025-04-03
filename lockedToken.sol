// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract LockedToken is ERC20, ERC20Permit {
    uint256 public unlockTime;

    constructor(address recipient)
        ERC20("lockedToken", "MTK")
        ERC20Permit("lockedToken")
    {
        _mint(recipient, 10000 * 10 ** decimals());
        unlockTime = block.timestamp + 3 days; // Set the unlock time to 3 days from contract creation
    }

    // Override the transfer function to prevent transfers before unlockTime
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _checkUnlock();
        return super.transfer(recipient, amount);
    }

    // Override the transferFrom function to prevent transfers before unlockTime
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _checkUnlock();
        return super.transferFrom(sender, recipient, amount);
    }

    // Override the approve function to prevent approvals before unlockTime
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _checkUnlock();
        return super.approve(spender, amount);
    }

    // Helper function to check the unlock time
    function _checkUnlock() internal view {
        require(block.timestamp >= unlockTime, "Tokens are locked for 3 days");
    }
}
