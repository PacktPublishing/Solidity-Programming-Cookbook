/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
//This contract is parent of proxyContract and UpgradeableContract. It manages methods, states, events for upgradable contracts
contract ProxyContractManager {
  address public destinationAddr;
  event EventaddrUpgrade(address indexed newdestinationAddr, address indexed olddestinationAddr, address sender);
  function delegateTo(address _destinationAddr) public;
}