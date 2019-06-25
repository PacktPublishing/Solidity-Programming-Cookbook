pragma solidity ^0.5.0;
contract HealthInsuranceAgent {
    constructor() public {  
        //do nothing.
    }
    //health insurance calculator.
    int constant base_amount = 100;
    function insuranceAmountCalculator(int age,bool is_smoke, bool is_consume_alcohol,int time_period) internal pure returns (int insurance_amount) { 
         int variable_amount = 0;
         if(is_consume_alcohol){
             variable_amount = variable_amount + 100;
         }
         if(is_smoke){
             variable_amount = variable_amount + 100;
         }
         return ((base_amount + variable_amount + (age + 50)) - time_period); //randon logic to calculate insurance amount based on age,time_period,alcohol state and smoke state.
    }

    function checkEligibility(int age, int time_period) internal  pure returns (bool is_insurance_possible) { 
         //random logic for insurance eligibility. you can make your own :)
         if (age > 60 || time_period > 40) { //health insurance not allow for person above 60 age and if asking for term period greater than 40.
             return false;
         }else{
             return true;
         }
    }
}

