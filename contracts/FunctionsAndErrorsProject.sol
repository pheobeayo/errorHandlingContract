// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract FunctionsAndErrorsProject {
    uint256 public age = 26;
    uint256 public ageLimit = 18;

    function requireError(uint256 _myAge) public view {
        require(
            ageLimit <= _myAge,
            "You are still a minor, age limit not reach"
        );
    }

    function assertError(uint256 _myAge) public view {
        assert(_myAge == age);
    }

    function revertError(uint256 _myAge) public view {
        if (_myAge != age) {
            revert("_myAge must be 26");
        }
    }
}
