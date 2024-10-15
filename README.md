# FunctionsAndErrorsProject

This Solidity implements the require(), assert() and revert() statements.

## Description

This program is a simple contract written in Solidity. The contract has 2 functions that implement the require(), assert() and revert() statements.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Errorhandling.sol). Copy and paste the following code into the file:

```javascript
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Errorhandling.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorHandling" contract from the dropdown menu, then click the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the deposit and withdraw functions that has the assertFunction or rewuireError function or revertError function, passing in their respective arguements(deposit and withraw). Click on the "revertError" contract in the left-hand sidebar, and then click on the "requireError" function, and pass in the arguement. Finally, click on the "transact" button to execute the function and retrieve the response message.

## Authors
Ifeoluwa Sanni

## Loom(video) walkthrough
```bash
https://www.loom.com/share/1d8c5f4d9ea248218d9fb4b90b46f4ac?sid=22dd0bfb-a8c9-450d-b987-defffb06b7d0
```
## License

This project is licensed under the MIT License
