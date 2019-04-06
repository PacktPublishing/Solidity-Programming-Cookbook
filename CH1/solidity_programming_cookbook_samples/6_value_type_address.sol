/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;  
contract AddressGetter {  
    function getCallerAddresses() public view returns (address caller, address contract1) {  //no arguments needed.
        caller = msg.sender;  //get caller address
        contract1 = address(this); //get contract address  
        return (caller,contract1);
    }  
}



