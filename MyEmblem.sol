 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Emblem is ERC20 {
    // State variable for the contract owner
    address private _owner;

    // Events for minting and burning
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    // Custom error for insufficient balance during transfer
    error InsufficientBalance(address sender, uint256 available, uint256 required);

    // Constructor to initialize the token and set the owner
    constructor() ERC20("Ferrari", "Steadfast") {
        _owner = msg.sender;
    }

    // Modifier to restrict functions to the owner
    modifier onlyOwner() {
        require(msg.sender == _owner, "Caller is not the owner");
        _;
    }

    // Function to mint new tokens, only accessible by the owner
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    // Function to burn tokens, callable by any holder
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    // Overriding the transfer function with a custom error
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        if (balanceOf(msg.sender) < amount) {
            revert InsufficientBalance(msg.sender, balanceOf(msg.sender), amount);
        }
        return super.transfer(recipient, amount);
    }

    // Function to view the owner address
    function owner() external view returns (address) {
        return _owner;
    }
}