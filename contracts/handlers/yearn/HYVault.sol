pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "../HandlerBase.sol";
import "./IYVault.sol";


contract HYVault is HandlerBase {
    using SafeERC20 for IERC20;

    function deposit(address vault, uint256 _amount) external payable {
        IYVault yVault = IYVault(vault);
        IERC20(yVault.token()).safeApprove(address(yVault), _amount);
        yVault.deposit(_amount);
        IERC20(yVault.token()).safeApprove(address(yVault), 0);

        _updateToken(address(yVault));
    }

    function withdraw(address vault, uint256 _shares) external payable {
        IYVault yVault = IYVault(vault);
        yVault.withdraw(_shares);

        _updateToken(yVault.token());
    }
}
