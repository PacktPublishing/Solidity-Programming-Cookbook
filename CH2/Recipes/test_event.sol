/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
import "./interface_test_event.sol";

/**
 * @title Insurance interface
 */
contract InsuranceCompany is IInsurance {
    mapping(address => bytes32) createdPolicies;
    
    //create dummy policies. Test data - ("0x12",0xca35b7d915458ef540ade6068dfe2f44e8fa733c)
    function createPolicies(bytes32 policyId, address sender) external {
        createdPolicies[sender] = policyId;
    }
    
    //Approve policies. Test data - ("0x12",0xca35b7d915458ef540ade6068dfe2f44e8fa733c)
    function approval(bytes32 policyId, address sender) external returns (bool){
        _approveInsurance(policyId,sender);
        return true;
    }
  
    
    function _approveInsurance(bytes32 policyId, address sender) internal returns (bool)
    {
        require(createdPolicies[sender] == policyId);
        emit Approval(sender, policyId); //Emit Parent abstract contract event.
    }
}