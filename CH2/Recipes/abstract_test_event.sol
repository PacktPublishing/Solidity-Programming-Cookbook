/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;

/**
 * @title Insurance interface
 */

 //this interface has only one function and one event.
contract IInsurance {
    function approveInsurance(bytes32 policyId, address sender) external returns (bool);
    
    event Approval(address indexed owner,bytes32 policyId); //event to log event after approval.
}