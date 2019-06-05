/* 
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
// !!!!!! Some exception handling has done here. It is just for demonstration purpose.
//Insurer company contract that calculate premium amount based on age,time_period,alcohol state and smoke state.
contract InsurerCompany {
    //this method has defined payable only because we can show how we can pass gas while calling it.
    function insuranceAmountCalculator(int age,bool is_smoke, bool is_consume_alcohol,int time_period) external payable returns (int insurance_amount) { 
         int variable_amount = 0;
         require(age >= 0, "age should be non zero."); 
         require(time_period >= 0, "time period should be non-zero.");
         
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
        bool is_insured;
        int premium_amount;
        uint commence_timestamp;
        bool claim_settlement_done;
    }
    //Save user record. Test data to test on Remix - ("U123",20,"Jon",true,true,10,false)
    function saveUserDetails(string memory unique_identification, int age, string memory name, bool is_smoke, bool is_consume_alcohol, int time_period, bool claim_settlement_done) public payable  {
        //user input error and exception handling
        require(age >= 0, "age should be non zero."); 
        require(time_period >= 0, "time period should be non-zero.");
        require(claim_settlement_done == false,"claim settlement flag should save with false");
    
        bool is_insured = false; //should be zero while user registration
        int premium_amount = 0; //should be zero while user registration
        uint commence_timestamp = block.timestamp; //timestamp of insurance commence.

        userRecordMapping[unique_identification] = userRecord(unique_identification, name, age, is_smoke, is_consume_alcohol, time_period, is_insured, premium_amount, commence_timestamp, claim_settlement_done);
    }
    
    //fetch insurance premium information using third party contract. Test data to test on Remix - ("U123")
    function getInsurancePremium(string memory unique_identification) public payable returns (int){
        /*
        value(msg.value) - send gas in wei unit to destination contract i.e InsurerCompany.
        gas(1000) - Set gas limit modifier.
        */
        return ic.insuranceAmountCalculator.value(msg.value).gas(1000)(userRecordMapping[unique_identification].age, userRecordMapping[unique_identification].is_smoke, userRecordMapping[unique_identification].is_consume_alcohol, userRecordMapping[unique_identification].time_period);
    }
    
    //Test data to test on Remix - ("U123")
    function doInsurance(string memory unique_identification) public payable{
        userRecordMapping[unique_identification].is_insured = true;
        userRecordMapping[unique_identification].premium_amount = getInsurancePremium(unique_identification);
    }
    
    //Test data to test on Remix - ("U123",true,true)
    function claimInsurance(string memory unique_identification, bool is_smoke, bool is_consume_alcohol) public payable {
        if(is_smoke != userRecordMapping[unique_identification].is_smoke || is_consume_alcohol != userRecordMapping[unique_identification].is_consume_alcohol){
            revert("Provided information while claim is different from our recorded information that we got while registering for insurance.");
        }
        assert(userRecordMapping[unique_identification].claim_settlement_done != true); //if already claimed before then lose all gas (panelty)
        /*
        ...Some claim process will execute here like like transfer claim amount to claimer account. 
        */
        userRecordMapping[unique_identification].claim_settlement_done = true; //congratulation claim settlement is done.
    }
}