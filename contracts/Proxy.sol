// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import './Storage.sol';

contract ProxyDogs is Storage{
  
  address currentAddress;

  constructor(address _address){
     currentAddress = _address;
  }

  function upgrade(address _address) public {
      currentAddress = _address;
  }
  
  receive() payable external{}

  fallback() payable external{
    address implementation = currentAddress;
    require(currentAddress != address(0),"Contract address is zero");
    bytes memory data = msg.data;
    assembly{
        let result := delegatecall(gas(),implementation,add(data,0x20),mload(data),0,0)
        let size := returndatasize()
        let ptr := mload(0x40)
        returndatacopy(ptr,0,size)
        switch result
        case 0 {revert(ptr,size)}
        default {return(ptr,size)}
    }
  }
}