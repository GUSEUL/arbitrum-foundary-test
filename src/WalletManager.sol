pragma solidity ^0.8.19;

interface IERC20{
    // using balanceof to get the balance of the account
    function balanceOf(address account) external view returns (uint256);
    //permission to transfer the token
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract WalletManager{
    address public constant USDC_ADDRESS = 0x75faf114eafb1BDbe2F0316DF893fd58CE46AA4d;

    function getUSDCBalance(address user) public view returns (uint256) {
        return IERC20(USDC_ADDRESS).balanceOf(user);
    }
    //Transfer USDC from the user to the contract
    function transferUSDC(address to, uint256 amount) public {
        require(IERC20(USDC_ADDRESS).transferFrom(msg.sender, to, amount), "Transfer failed");

    }
    function batchTransferUsdc(address[] calldata recipients, uint256[] calldata amounts) external {
        require(recipients.length == amounts.length, "Arrays length mismatch");
        
        for (uint256 i = 0; i < recipients.length; i++) {
            require(
                IERC20(USDC_ADDRESS).transferFrom(msg.sender, recipients[i], amounts[i]),
                "Batch transfer failed"
            );
        }
    }
    function getUSDCBalance(address account) public view returns (uint256) {
        return IERC20(USDC_ADDRESS).balanceOf(account);
    }
}