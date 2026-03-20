// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";

contract CheckConnection is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        uint256 balance = deployerAddress.balance;

        console.log("=== Connection Check ===");
        console.log("My Wallet Address:", deployerAddress);
        console.log("My Balance (in Wei):", balance);
        console.log("========================");

        if (balance == 0) {
            console.log("WARNING: Balance is 0. You need test ETH!");
        } else {
            console.log("SUCCESS: Everything is perfect! Ready to deploy!");
        }
    }
}