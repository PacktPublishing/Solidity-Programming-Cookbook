pragma solidity ^0.5.0;
import "./HealthInsuranceAgent.sol";
contract GeneralAgent is HealthInsuranceAgent {
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
        bool has_health_insurance;
        int health_insurance_amount;
    }
    //Save user record. Test data to test on Remix - ("U123",20,"Jon",true,true,10,false,0)
    function saveUserDetails(string memory unique_identification, int age, string memory name, bool is_smoke, bool is_consume_alcohol, int time_period, bool has_health_insurance, int health_insurance_amount) public  {
        userRecordMapping[unique_identification] = userRecord(unique_identification, name, age, is_smoke, is_consume_alcohol, time_period, has_health_insurance, health_insurance_amount);
    }

    //responsible to perform health insurance for given user.Test data to test on Remix - ("U123")
    function doHealthInsurance(string memory unique_identification) public payable returns (bool) { 
         if(checkEligibility(userRecordMapping[unique_identification].age, userRecordMapping[unique_identification].time_period)){ //function from parent contract
             //function from parent contract
             int insurance_amount = insuranceAmountCalculator(userRecordMapping[unique_identification].age,userRecordMapping[unique_identification].is_smoke, userRecordMapping[unique_identification].is_consume_alcohol,userRecordMapping[unique_identification].time_period);
             require(insurance_amount > 0); //should be possitive number.
             userRecordMapping[unique_identification].health_insurance_amount = insurance_amount;
             userRecordMapping[unique_identification].has_health_insurance = true;
             return true;
         }else{
             return false;
         }
    }
    //get user health insurance details - Test data to test on Remix - ("U123")
    function getUserDetails(string memory unique_identification) public view returns(bool has_health_insurance, int health_insurance_amount){
        return (userRecordMapping[unique_identification].has_health_insurance, userRecordMapping[unique_identification].health_insurance_amount);
    }
}