/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;

import "./insurance_company.sol";

contract companyA is InsuranceCompany {
    
    function calculatePremium() external pure returns (string memory){
        return "calculate from companyA contract";
    }
}