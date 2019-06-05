/* 
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.0;
contract UserRecordKeeper {
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
        string add1;
        string add2;
        string add3;
        string phone;
        string fax;
        bool is_house_owner;
        bool is_farm_owner;
        bool is_pet_owner;
        bool is_businessman;
    }
    //this method will throw "stack to deep" error.Because of more number of argument in function. If we remove one argument from function then it will work.
    function saveUserDetails(string memory unique_identification, int age, string memory name, bool is_smoke, bool is_consume_alcohol, int time_period,string memory add1, string memory add2, string memory add3, string memory phone,string memory fax, bool is_house_owner, bool is_farm_owner, bool is_pet_owner, bool is_businessman) public payable  {
        userRecordMapping[unique_identification] = userRecord(unique_identification, name, age, is_smoke, is_consume_alcohol, time_period, add1, add2, add3, phone,fax, is_house_owner, is_farm_owner, is_pet_owner, is_businessman);
    }
}