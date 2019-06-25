/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
//any upgradeable contract will import this contract to use proxy contract delegateTo method.
pragma solidity ^0.5.1;
import './ProxyContractManager.sol';
contract UpgradeableContract is ProxyContractManager {
    function delegateTo(address) public {
        assert(false);
    }
}