// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    string private _name;
    string private _symbol; 
    uint256 private _totalSupply;
    uint8 private _decimals;

    event transferEV(address indexed from, address indexed to, uint256 value);


    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint)) private _allowances;

    function name() external view returns (string memory){
        return _name;
    }
    function symbol() external view returns (string memory){
        return _symbol;
    }

    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }

    function decimals() public view returns (uint8){
        return _decimals;
    }

    function balanceOf(address _owner) public view virtual override returns (uint256) {
        return _balances[_owner];
    }

    function transferTo(address to, uint value) public override returns (bool){
        require(_balances[msg.sender] >= value,"insuffisiont ammount");
        _balances[msg.sender] -= value;
        _balances[to] += value;
        emit transferEV(msg.sender,to,value);

        return true;
    }

    function tranferFrom(address from, address to,uint  amount) public returns (bool){
       require(_allowances[from][msg.sender] >= amount, "Insufficient amount");
       transferTo(to,amount);
       emit transferEV(msg.sender,to, amount);
       return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool){
        _allowances[msg.sender][_spender] += _value;
    }

}