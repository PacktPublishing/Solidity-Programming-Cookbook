/* 
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
// !!!!!! No exception handling has done here. It is just for demonstration purpose.
//Insurer company contract that calculate premium amount based on age,time_period,alcohol state and smoke state.
contract InsurerCompany {
    //this method has defined payable only because we can show how we can pass gas while calling it.
    function insuranceAmountCalculator(int age,bool is_smoke, bool is_consume_alcohol,int time_period) external payable returns (int insurance_amount) { 
         int variable_amount = 0;
         if(is_consume_alcohol){
             variable_amount = variable_amount + 100;
         }
         if(is_smoke){
             variable_amount = variable_amount + 100;
         }
         return ((variable_amount + (age + 50)) - time_period); //randon logic to calculate insurance amount based on age,time_period,alcohol state and smoke state.
    }
    
}

//contract for insurance agent. Insurance agent saving client user info and calculate insurance premium using Insurer company contract.
contract InsuranceAgent {
    InsurerCompany ic;
    constructor(address _ic) public {  
        ic = InsurerCompany(_ic); //assuming we know address of InsurerCompany contract. Initialize third party contract in constructor.
    }
    //define mapping to store key-value pairs.
    mapping(string => userRecord) userRecordMapping;
    
    //organize user records using struct
    struct userRecord
    {
        string unique_identification;
        string name;
        int age;
        bool is_smoke;
        bool is_consume_alcohol;
        int time_period;
    }
    //Save user record. Test data to test on Remix - ("U123",20,"Jon",true,true,10)
    function saveUserDetails(string memory unique_identification, int age, string memory name, bool is_smoke, bool is_consume_alcohol, int time_period) public payable  {
        userRecordMapping[unique_identification] = userRecord(unique_identification, name, age, is_smoke, is_consume_alcohol, time_period);
    }
    
    //fetch insurance premium information using third party contract. Test data to test on Remix - ("U123")
    function getInsurancePremium(string memory unique_identification) public payable returns (int){
        /*
        value(msg.value) - send gas in wei unit to destination contract i.e InsurerCompany.
        gas(1000) - Set gas limit modifier.
        */
        return ic.insuranceAmountCalculator.value(msg.value).gas(1000)(userRecordMapping[unique_identification].age, userRecordMapping[unique_identification].is_smoke, userRecordMapping[unique_identification].is_consume_alcohol, userRecordMapping[unique_identification].time_period);
    }
}
