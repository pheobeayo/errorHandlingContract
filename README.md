# FunctionsAndErrorsProject

This Solidity implements the require(), assert() and revert() statements..

## Description

This program is a simple contract written in Solidity. The contract has 3 function that returns that implements the require(), assert() and revert() statements.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., FunctionsAndErrorsProject.sol). Copy and paste the following code into the file:

```javascript
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.17" (or another compatible version), and then click on the "Compile FunctionsAndErrorsProject.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "FunctionsAndErrorsProject" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the requireError function or assertError function or revertError function, passing in their respective arguements(_myAge). Click on the "revertError" contract in the left-hand sidebar, and then click on the "requireError" function, pass in the arguement. Finally, click on the "transact" button to execute the function and retrieve the response message.

## Authors
Ifeoluwa Sanni

## Loom(video) walkthrough
```bash
https://www.loom.com/share/52f16ec14cac407c850ab25940c56523?sid=b90a958e-1c56-4072-8291-c15d825472c6
```
## License

This project is licensed under the MIT License