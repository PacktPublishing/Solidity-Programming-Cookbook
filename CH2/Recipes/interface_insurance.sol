/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;

/**
 * @title Insurance interface
 */
interface IInsurance {
    function approveInsurance(bytes32 policyId, address sender) external returns (bool);
    function calculatePremium() external pure returns (string memory);
   // function registerClaim(bytes32 policyId, bytes32 coverageCondition,address reporter) external returns (bool);
   // function claimRelease(bytes32 policyId, address sender) external returns (bool);
    
    
    event Approval(address indexed owner,bytes32 policyId);
}