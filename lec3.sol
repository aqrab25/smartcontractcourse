// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

contract dummyToken {
 
     mapping (address => uint) public balanceOf;
     uint cap = 200000;
     uint totalSupply =0;
     address owner = msg.sender;

     function deposit( uint amount) public {
        balanceOf[msg.sender] = amount;
     }

     function mintFun(address recipient, uint amount) public returns (bool){
    
         require(msg.sender == owner, "Only owner can mint");
         require(amount > 0,"Amount must be greater than zero");
         require(totalSupply <= cap,"Cap reached");

         balanceOf[msg.sender] += amount;
         totalSupply += amount;
     }

     function transfer(address recipient, address sender,uint amount) public returns (bool){
      
        require(balanceOf[sender] >= amount, "Not enough balance");
        require(recipient !=address(0), "Zero address detected");
        balanceOf[sender]  -= amount;
        balanceOf[recipient] += amount;

        return true;
     }
}
