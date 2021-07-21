# Proxy-Contract
Upgradable smart contract with the help of proxy contract architecture.

## Overview
Standing by the principle of **immutability**, it's not possible to upgrade already deployed contracts. But it's possible to set-up proxy contract architecture that will enable the deployment of new contract if there is a need of some sort of upgrade.

Proxy contract stores the address of latest deployed functional contract and redirects calls to functional contract. Proxy contract uses the functionality of functional contract 
under its own scope.

## Prerequisites
To run this project you need to have Truffle installed on your machine. I've intergrated this project by using latest versions. To check truffle version run the below command in your 
terminal.
> truffle version
```
Truffle  v5.4.1 (core: 5.4.1)
Solidity  - 0.8.0 (solc-js)
Node  v14.15.3
Web3.js  v1.4.0
```
## Project Setup
After the installation of truffle, open Visual Studio IDE to run the project. Open your working directory and then open your bash terminal to run initial commands to see the working project.
```
$ npm init
$ truffle init
$ git clone https://github.com/tagupta/Proxy-Contract.git
```
Now open your command prompt terminal in the working directory to run the below commands 
```
truffle compile
truffle develop
migrate
```
## Disclaimer
Use this repo for study purpose.

## Enjoy
Play around with the code :)


