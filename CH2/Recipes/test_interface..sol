/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
import "./interface.sol";
/**
 * @title Insurance interface
 */
contract Insurance is IInsurance {
    function approveInsurance() external returns (bool){
        return true;
    }
}