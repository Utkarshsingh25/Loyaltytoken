// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract productofdigits{
    function getresult(uint256 number) public pure returns(uint256 ){
        uint256 product = 1;
        while (number > 0){
            product= product * (number % 10);
            number = number /10;}
            
        return product;

    }
}