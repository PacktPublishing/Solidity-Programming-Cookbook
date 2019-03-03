pragma solidity ^0.5.1;  
contract FundTransferer {  
    function Fundtransferer(address payable _address, uint amount) public {  
        address myAddress = address(this); //contract address
        if (_address.balance < 10 && myAddress.balance >= 10) { //check balance of sender and receiver(contract address) and then transfer to contract address.
        _address.transfer(amount);
    }   
} 
} 