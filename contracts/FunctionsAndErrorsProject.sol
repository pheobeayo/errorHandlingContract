// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract FunctionsAndErrorsProject {

    uint256 public amount = 2000;
    uint256 public amountLimit = 100;


    function requireError(uint256 _myAmount) public view {
        require(
            amountLimit <= _myAmount,
            "You are below the amount limit! add up!"
        );
    }

    function assertError(uint256 _myAmount) public view {
        assert(_myAmount == amount);
    }

    function revertError(uint256 _myAge) public view {
        if (_myAmount != amount) {
            revert("_myAmount must not exceed 2000");
        }
    }
}