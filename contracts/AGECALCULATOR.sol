//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract AgeCalculator {

    
    function ageAfterYears(uint256 currentAge, uint x) public pure returns (uint) {
        return currentAge + x;
    }

    
    function ageBeforeYears(uint256 currentAge, uint x) public pure returns (uint) {
        require(currentAge >= x, "Age cannot be negative");
        return currentAge - x;
    }
}