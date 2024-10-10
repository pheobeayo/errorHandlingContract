# FunctionsAndErrorsProject

This Solidity implements the require(), assert() and revert() statements..

## Description

This program is a simple contract written in Solidity. The contract has 3 function that returns that implements the require(), assert() and revert() statements.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Errorhandling.sol). Copy and paste the following code into the file:

```javascript
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

    // Fallback function to accept Ether
    receive() external payable {
        deposit();
    }
}


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Errorhandling.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Errorstatement" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the requireError function or assertError function or revertError function, passing in their respective arguements(_myAge). Click on the "revertError" contract in the left-hand sidebar, and then click on the "requireError" function, pass in the arguement. Finally, click on the "transact" button to execute the function and retrieve the response message.

## Authors
Ifeoluwa Sanni

## Loom(video) walkthrough
```bash
https://www.loom.com/share/6bd744da2c154a2fbefb394678fa2651?sid=9e336d8e-7467-4860-a16f-619908202fc0
```
## License

This project is licensed under the MIT License