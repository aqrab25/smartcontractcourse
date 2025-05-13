// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract  Array {

    uint[] public dynamicArray;

function addElement(uint _val) public {
    dynamicArray.push(_val);
}

function getElement(uint _index) public view returns (uint) {
    return dynamicArray[_index];
}
    
}



