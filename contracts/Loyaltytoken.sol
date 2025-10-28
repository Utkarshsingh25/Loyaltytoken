// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract LoyaltyToken {
    string public name = "Loyalty Token";
    string public symbol = "LOYAL";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    address public owner;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event TokensAwarded(address indexed to, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Initialize with initial supply to owner
    constructor(uint256 _initialSupply) {
        owner = msg.sender;
        totalSupply = _initialSupply * 10 ** decimals;
        balanceOf[owner] = totalSupply;
        emit Transfer(address(0), owner, totalSupply);
    }

    // Owner can award tokens (users earn points)
    function award(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "zero address");
        require(balanceOf[owner] >= amount, "insufficient tokens to award");

        balanceOf[owner] -= amount;
        balanceOf[to] += amount;

        emit TokensAwarded(to, amount);
        emit Transfer(owner, to, amount);
    }

    // Users can transfer tokens
    function transfer(address to, uint256 amount) external returns (bool) {
        require(to != address(0), "zero address");
        require(balanceOf[msg.sender] >= amount, "insufficient balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }
}
