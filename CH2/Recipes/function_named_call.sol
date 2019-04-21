/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
// !!!!!! No exception handling has done here. It is just for demonstration purpose.
//Insurer company contract that calculate premium amount based on age,time_period,alcohol state and smoke state.
contract InsurerCompany {
    int constant base_amount = 100;
    function insuranceAmountCalculator(int age,bool is_smoke, bool is_consume_alcohol,int time_period) external payable returns (int insurance_amount) { 
         int variable_amount = 0;
         if(is_consume_alcohol){
             variable_amount = variable_amount + 100;
         }
         if(is_smoke){
             variable_amount = variable_amount + 100;
         }
         return ((base_amount + variable_amount + (age + 50)) - time_period); //randon logic to calculate insurance amount based on age,time_period,alcohol state and smoke state.
    }
}

//contract for insurance agent. Insurance agent saving client user info and calculate insurance premium using Insurer company contract.
contract InsuranceAgent {
    InsurerCompany ic;
    constructor(address _ic) public {  
        ic = InsurerCompany(_ic); //assuming we know address of InsurerCompany contract. Initialize third party contract in constructor.
    }
   
    //fetch insurance premium information using third party contract
    function getInsurancePremium() public returns (int){
        return ic.insuranceAmountCalculator.gas(1000)({is_smoke: true, age: 30, time_period: 30, is_consume_alcohol: false});//named parameter calls 
    }
}

