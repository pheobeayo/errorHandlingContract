// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorhandlingContract {

    uint public balance;
    address public owner;

    // Custom errors for better gas efficiency
    error InsufficientDeposit(uint requested, string message);
    error InsufficientBalance(uint requested, uint available);
    error EmergencyWithdrawalNotAllowed(string message);
    error NotOwner(string message);

    // Events to track actions on the contract
    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);
    event EmergencyWithdrawn(address indexed user, uint balanceReset);

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict certain functions to the owner only
    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert NotOwner("Only the contract owner can perform this action");
        }
        _;
    }

    // Function using 'require' to check conditions before executing the logic
    function deposit(uint amount) public {
        if (amount <= 0) {
            revert InsufficientDeposit(amount, "Deposit amount must be greater than zero");
        }
        balance += amount;
        emit Deposited(msg.sender, amount); // Log the deposit event
    }

    // Function using 'assert' to check for invariants or internal errors
    function withdraw(uint amount) public {
        if (amount > balance) {
            revert InsufficientBalance(amount, balance);
        }
        balance -= amount;
        assert(balance >= 0); // Ensure balance doesn't go below zero
        emit Withdrawn(msg.sender, amount); // Log the withdrawal event
    }

    // Function using 'revert' to handle emergency withdrawals (only owner)
    function emergencyWithdraw() public onlyOwner {
        // Custom logic to determine if an emergency withdrawal is allowed
        bool emergency = checkEmergency();
        if (!emergency) {
            revert EmergencyWithdrawalNotAllowed("Emergency withdrawal is not allowed");
        }

        uint oldBalance = balance;
        balance = 0; // Reset the balance in case of emergency
        emit EmergencyWithdrawn(msg.sender, oldBalance); // Log the emergency withdrawal event
    }

    // A simple check to simulate an emergency condition
    function checkEmergency() private view returns (bool) {
        //  return true if balance is greater than 1000 (simulating emergency)
        return balance > 1000;
    }
}