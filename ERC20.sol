// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    string private _name;
    string private _symbol; 
    uint256 private _totalSupply;
    uint8 private _decimals;

    event transfeEV(address indexed to, uint amount);
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint)) private _allowances;

    function name() external view returns (string memory){
        return _name;
    }
    function symbol() external view returns (string memory){
        return _symbol;
    }

    function balanceOf(address _owner) public view virtual override returns (uint256) {
        return _balances[_owner];
    }

    function transfer(address to, uint value) public payable override returns (bool){
        require(_balances[to] >= value,"insuffisiont ammount");
        emit transfeEV(to,value);
        _balances[to] += value;

        return true;
    }

    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }

    function decimals() public view returns (uint8){
        return _decimals;
    }

    function tranferFrom(address from,address to, uint256 amount) external view returns(bool){

    }

}