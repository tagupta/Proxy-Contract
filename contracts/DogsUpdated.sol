// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import './Dogs.sol';

contract DogsUpdated is Dogs{
   
   constructor(){
       initialize(msg.sender);
   }
   
   function initialize(address _owner) public{
       require(_initialized == false, 'State already initialized');
       owner  = _owner;
       _initialized = true;
   }

   function setNumberOfDogs(uint _dogs) public override onlyOwner{
       _uintStorage["Dogs"] = _dogs;
   }
}