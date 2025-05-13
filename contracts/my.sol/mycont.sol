// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Storage {

    uint256 number;
    uint256 a;
    uint256 b;
    uint256 sum;

    function add(uint numone,uint numtwo) public {
            sum= numone + numtwo;
    }

     
   function returnSum() public view returns (uint256){
    return sum;
   }

   function store(uint256 num) public {
    number=num;
   }

   
   function retrieve() public view returns (uint256){
    return number;
   }
}