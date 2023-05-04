// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

interface IERC20{
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function totalSupply() external view returns (uint256);
}