// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint256 public totalSupply;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint)) private _allowances;


    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint value) public payable override returns (bool){
        require(_balances[to] >= value,"insuffisiont ammount");
        _balances[to] += value;
        totalSupply += value;

        return true;
    }
}