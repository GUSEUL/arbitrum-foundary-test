// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract MyExchange {

    adress public constant USDC_ADDRESS = 0x75faf114eafb1BDbe2F0316DF893fd58CE46AA4d;

    function getMYUSDCBalance(address account) public view returns (uint256) {
        return IERC20(USDC_ADDRESS).balanceOf(account);
    }
}