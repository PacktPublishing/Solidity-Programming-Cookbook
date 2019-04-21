/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;

/**
 * @title Insurerance Contract
 */
import "./interface_insurance.sol";
contract InsuranceCompany is IInsurance{
    mapping(address => bytes32) createdPolicies;
    
    //create dummy policies. Test data - ("0x12",0xca35b7d915458ef540ade6068dfe2f44e8fa733c)
    function createPolicies(bytes32 policyId, address sender) external {
        createdPolicies[sender] = policyId;
    }
    
    //Approve policies. Test data - ("0x12",0xca35b7d915458ef540ade6068dfe2f44e8fa733c)
    function approveInsurance(bytes32 policyId, address sender) external returns (bool){
        _approveInsurance(policyId,sender);
        return true;
    }
    function calculatePremium() external pure returns (string memory){
        return "calculate from Insurance contract";
    }
    
    function registerClaim(bytes32 policyId, bytes32 coverageCondition,address reporter) external returns (bool);
    function claimRelease(bytes32 policyId, address sender) external returns (bool);
    
    
    event Approval(address indexed owner);
    
    function _approveInsurance(bytes32 policyId, address sender) internal returns (bool)
    {
        require(createdPolicies[sender] == policyId);
        emit Approval(sender, policyId);
    }
}