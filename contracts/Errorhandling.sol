// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    address public owner;
    uint256 public balance;
    bool public isOperational;

    constructor() {
        owner = msg.sender;
        balance = 0;
        isOperational = true;
    }

    // Modifier to check only owner access
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Function to deposit funds, requires the contract to be operational
    function deposit() external payable {
        require(isOperational, "Contract is not operational");
        balance += msg.value;
    }

    // Function to withdraw funds, only accessible by owner
    function withdraw(uint256 amount) external onlyOwner {
        require(amount <= balance, "Insufficient balance"); // Checks condition
        balance -= amount;

        // Transfer funds to the owner
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Transfer failed"); // Reverts if transfer fails
    }

    // Function to halt the contract operations, only owner can stop
    function haltOperations() external onlyOwner {
        isOperational = false;
    }

    // Function to resume contract operations, only owner can resume
    function resumeOperations() external onlyOwner {
        isOperational = true;
    }

    // Function demonstrating assert (should always hold true)
    function testAssert() external view {
        assert(balance >= 0); // The balance should never be negative
    }

    // Function to demonstrate revert usage
    function emergencyWithdraw() external onlyOwner {
        if (!isOperational) {
            revert("Contract is halted. Emergency withdrawal is not allowed.");
        }

        // Transfer the entire balance back to the owner
        (bool success, ) = owner.call{value: balance}("");
        require(success, "Emergency withdrawal failed");

        balance = 0;
    }

   
    
}
