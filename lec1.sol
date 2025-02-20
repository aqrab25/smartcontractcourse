// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract lecture {

     int a;
     int  b = 5;
     int  c = 12;
  

     bool tony = false;

    string message="hello world";
    string newString;


   function concat(string memory str1, string memory str2) public returns (string memory)
       {
        newString = string(abi.encodePacked(str1,str2));
        return newString;
       }
   




    function checkEvenOdd(int a ) public pure returns (string memory){
        string memory num= "";
        if (a%2==0)
            { num="even";
            }
            else {
                num="odd";
            }
             return num;
    }

    function toggle() public  returns (bool){
        if (tony) {
         tony=false;
        }
        else {
         tony=true;
        }

        return tony;
    }


    function increament() public  returns (int){
        return ++c;
    }

     function decreament() public returns (int){
        return --c;
    }


    function addition() public view returns (int) {
        return a+b;
    }
   
   function subtract() public view returns (int) {
        return a-b;
    }

     function multiplication() public view returns (int) {
        return a*b;
    }

    function division() public view returns (int) {
        return a/b;
    }




    function showMessage() public view returns (string memory) {
        return message;
    }
}
