// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import './Storage.sol';

contract Dogs is Storage{
   
   modifier onlyOwner(){
       require(owner == msg.sender,"Accessible to owners only");
       _;
   }
   constructor(){
       owner = msg.sender;
   }
   function getNumberOfDogs() public view returns(uint){
       return _uintStorage["Dogs"];
   }

   function setNumberOfDogs(uint _dogs) public virtual{
       _uintStorage["Dogs"] = _dogs;
   }
}