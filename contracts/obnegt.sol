// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Storage {

   struct Person {
    string name;
    uint age;
}

   Person public personONE;

   function SetPerson(string memory _name, uint _age) public {
    personONE= Person(_name,_age);
   }

   function GetPerson() external view returns ( string memory ,uint) {
    return(personONE.name ,personONE.age );
   }  
}