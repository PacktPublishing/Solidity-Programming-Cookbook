/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
//This contract is responsible to delegate calls to a target contract with delegate-call opcode.
pragma solidity ^0.5.1;

import './ProxyContractManager.sol';
import './UpgradeableContract.sol';

contract ProxyRegistry is ProxyContractManager {
    //Firstly instantiate Proxy contract with first destination contract address and emit event.
    constructor(address _destinationAddr) public {
        delegateTo(_destinationAddr);
    }

    //Delegate the contract to a different destination contract.
    function delegateTo(address _destinationAddr) public {
        assert(destinationAddr != _destinationAddr);
        address olddestinationAddr = _destinationAddr;
        destinationAddr = _destinationAddr;
        emit EventaddrUpgrade(_destinationAddr, olddestinationAddr, msg.sender);
    }
    
    //Fallback function that use the delegatecall opcode to call buisness logic from business logic contract and retain proxyRegistry contract states.
    function () payable external {
        bytes memory msgData = msg.data;
        address target = destinationAddr;
        assembly {
            let ptr := mload(0x40)
            let size := returndatasize
            returndatacopy(ptr, 0, size)
            let result := delegatecall(gas, target, add(msgData, 0x20), mload(msgData), 0, 0)
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
}