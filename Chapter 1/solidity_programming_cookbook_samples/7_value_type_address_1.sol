pragma solidity ^0.5.1;  
  
contract FundTransferer {  
      
    function Fundtransferer(address payable _address, uint amount) public {  
        _address.transfer(amount);  //use of transfer is prefferd because throws an exception and stop the execution
    }  
      
    function FundSender(address payable _address, uint amount) public returns(bool){  
        _address.send(amount);  //send returns false on error.
    }  
}  