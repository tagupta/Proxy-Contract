// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage{
    mapping(string => uint) _uintStorage;
    mapping(string => address) _addressStorage;
    mapping(string => string) _stringStorage;
    mapping(string => bool) _boolStorage;
    mapping(string => bytes4) _bytesStorage;
    address public owner;
    bool public _initialized;
}