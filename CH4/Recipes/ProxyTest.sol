/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;

import './ProxyRegistry.sol';
import './InsurancePremium.sol';
import './InsurancePremiumV1.sol';

/*this contract is to demonstrate the deligatiion of business logic from ProxyRegistry contract. Proxy registry will execute insurance
businesslogic from the contract whose address is stored in destinationAddr field.

*/
contract ProxyTest {
    ProxyRegistry pr;
    InsurancePremium ip;
    constructor(address payable _pr) public {
         pr = ProxyRegistry(_pr);
    }
    
    //Calculate insurance premium amount. Use test data - ("20",true,true,"9")
    function getInsurancePremium(int age,bool is_smoke, bool is_consume_alcohol,int time_period) public payable returns(int){
        ip = InsurancePremium(pr.destinationAddr()); //business logic will depend on current destinationAddr that ProxyRegistry contract have.
        return ip.Calculator(age,is_smoke, is_consume_alcohol,time_period); //Call .
    }
}
