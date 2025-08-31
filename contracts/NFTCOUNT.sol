//SPDX-License-Identifier: MIT
pragma solidity^0.8.30;

contract NIFTCOUNT{
    uint public numberofNFT;

    function checkTotalNFT() public view returns (uint256){
        return numberofNFT;
    }

    function addNFT()public{
        numberofNFT +=1;
    }

    function subNFT()public{
        numberofNFT -=1;
    }

}