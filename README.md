# Emblem Token Contract

## Overview

The `Emblem` contract is a custom implementation of an ERC20 token. It extends the OpenZeppelin ERC20 standard and introduces additional features for ownership, minting, and burning. The contract is designed for transparency and ease of integration with decentralized applications.

## Features

- ERC20-compliant token functionality.
- Ownership model for restricted access to minting operations.
- Event-based notifications for minting and burning.
- Custom error handling for improved gas efficiency.

## Functions

### `constructor(string memory name, string memory symbol)`
Initializes the token contract with a name and symbol, and sets the deployer as the owner.

### `mint(address to, uint256 amount)`
Allows the owner to mint new tokens to a specified address.
- Emits a `Mint` event.
- Restricted to the contract owner.

### `burn(address from, uint256 amount)`
Allows the owner to burn tokens from a specified address.
- Emits a `Burn` event.
- Restricted to the contract owner.

### `transfer(address to, uint256 amount)`
Overridden from the ERC20 standard to enforce balance checks and implement custom error handling for insufficient balance.

### `balanceOf(address account) public view returns (uint256)`
Returns the token balance of a specified address. This is inherited from the ERC20 standard.

## Events

- `Mint(address indexed to, uint256 amount)`
  - Emitted when tokens are minted.
- `Burn(address indexed from, uint256 amount)`
  - Emitted when tokens are burned.

## Custom Errors

- `InsufficientBalance(address sender, uint256 available, uint256 required)`
  - Used in the overridden `transfer` function to optimize gas usage by reducing revert message size.

## Deployment Instructions

1. Install dependencies using [OpenZeppelin Contracts](https://openzeppelin.com/contracts/).
2. Deploy the contract by providing the token name and symbol in the constructor.
