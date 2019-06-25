/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
//Changed Business logic contract for insurance company to calculate insurance premium.
pragma solidity ^0.5.1;
import './UpgradeableContract.sol';
//Calculate insurance premium amount. Use test data - ("20",true,true,"9")
contract InsurancePremiumV1 {
    function Calculator(int age,bool is_smoke, bool is_consume_alcohol,int time_period) public pure returns (int) { 
         int variable_amount = 10;
         if(is_consume_alcohol){
             variable_amount = variable_amount + 100;
         }
         if(is_smoke){
             variable_amount = variable_amount + 100;
         }
         return ((variable_amount + (age + 50)) - time_period); //randon logic to calculate insurance amount based on age,time_period,alcohol state and smoke state.
    }
    
}
