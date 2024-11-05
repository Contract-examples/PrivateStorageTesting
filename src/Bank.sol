// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/console2.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract Bank {
    struct LockInfo {
        address user;
        uint64 startTime;
        uint256 amount;
    }

    LockInfo[] private _locks;

    constructor() {
        for (uint256 i = 0; i < 11; i++) {
            uint64 startTime = uint64(block.timestamp * 2 - i);
            console2.log("startTime: ", startTime);
            _locks.push(LockInfo(address(uint160(i + 1)), uint64(block.timestamp * 2 - i), 1e18 * (i + 1)));
        }
    }
}
