/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;  
contract FundTransferer {  
    function Fundtransferer(address payable _address, uint amount) public { //try argument (0x14723a09acff6d2a60dcdf7aa4aff308fddc160c,100)
        address myAddress = address(this); //contract address
        if (_address.balance < 10 && myAddress.balance >= 10) { //check balance of sender and receiver(contract address) and then transfer to contract address.
        _address.transfer(amount);
    }   
} 
} 
