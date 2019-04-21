/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;

import "./insurance_company.sol";
import "./Ownable.sol";

/*
import statement for Ownable.sol contract is from opensource code source openzeppelin-solidity. 
You need to create a file with name "Ownable.sol" in same folder i.e "CH2" by copying code from https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/ownership/Ownable.sol
*/
contract companyB is InsuranceCompany, Ownable {
    
    
    function calculatePremium() external pure returns (string memory){
        return "calculate from companyA contract";
    }
}