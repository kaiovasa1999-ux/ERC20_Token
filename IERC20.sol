// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

interface IERC20{
    event transfer(address indexed from, address indexed to, uint256 value);
    
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function totalSupply() external view returns (uint256);
    function decimals() external view returns (uint8);
    function balanceOf(address account) external view returns (uint256);
    function transferTo(address to,uint value) external  returns (bool);
    function tranferFrom(address from,address to, uint256 amount) external returns(bool);
    function approve(address _spender, uint256 _value) external returns (bool);
}