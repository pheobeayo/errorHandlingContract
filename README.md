# FunctionsAndErrorsProject

This Solidity implements the require(), assert() and revert() statements..

## Description

This program is a simple contract written in Solidity. The contract has 3 function that returns that implements the require(), assert() and revert() statements.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., FunctionsAndErrorsProject.sol). Copy and paste the following code into the file:

```javascript
pragma solidity ^0.8.17;

contract FunctionsAndErrorsProject {

    uint256 public age = 45;
    uint256 public ageLimit = 20;


    function requireError(uint256 _myAge) public view {
        require(
            ageLimit <= _myAge,
            "You are below the age limit! You must be 20!"
        );
    }

    function assertError(uint256 _myAge) public view {
        assert(_myAge == age);
    }

    function revertError(uint256 _myAge) public view {
        if (_myAge != age) {
            revert("_myAge must be 45");
        }
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
https://www.loom.com/share/2f2e3a9728174afcb05f5ae785a85cf4?sid=815bd605-9b4e-49b4-bfdf-d0354fd72579
```
## License

This project is licensed under the MIT License