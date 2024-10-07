// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorFunctionsContract {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;  // Set the deployer as the owner
    }

    // Function to deposit ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than zero"); // Using require to check input
        balance += msg.value;
    }

    // Function to withdraw ether, only owner can withdraw
    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Only the owner can withdraw"); // Using require to ensure only owner can withdraw
        if (_amount > balance) {
            revert("Insufficient contract balance"); // Using revert to handle insufficient balance
        }

        payable(owner).transfer(_amount);
        balance -= _amount;

        // Using assert to check that the balance never goes negative
        assert(balance >= 0);
    }

    // Function to change the owner of the contract
    function changeOwner(address _newOwner) public {
        require(msg.sender == owner, "Only the owner can change the ownership"); // Using require to validate ownership
        owner = _newOwner;
    }

    // Get function for the contract's balance
    function getBalance() public view returns (uint) {
        return balance;
    }
}
