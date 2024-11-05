// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/Bank.sol";
import "@openzeppelin/contracts/utils/Create2.sol";

contract DeployScript is Script {
    bytes32 constant SALT = bytes32(uint256(0x0000000000000000000000000000000000000000d3bf2663da51c10215000003));

    function run() public {
        // TODO: encrypt your private key
        uint256 deployerPrivateKey = vm.envUint("SEPOLIA_WALLET_PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        Bank newBank = new Bank{ salt: SALT }();
        /**
         * == Logs ==
         *     Bank deployed to: 0x543FF5baFD7fcD727711900A48F040B4405D4618
         *     Deployed by: 0x059dC4EEe9328A9f163a7e813B2f5B4A52ADD4dF
         */
        // https://sepolia.arbiscan.io/address/0x543FF5baFD7fcD727711900A48F040B4405D4618
        console2.log("Bank deployed to:", address(newBank));
        console2.log("Deployed by:", deployerAddress);

        vm.stopBroadcast();
    }

    // The contract can receive ether to enable `payable` constructor calls if needed.
    receive() external payable { }
}
