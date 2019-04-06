/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;  
  
contract FundTransferer {  
      
    function Fundtransferer(address payable _address, uint amount) public {  //try argument (0x14723a09acff6d2a60dcdf7aa4aff308fddc160c,100)
        _address.transfer(amount);  //use of transfer is preferred because throws an exception and stop the execution
    }  
      
    function FundSender(address payable _address, uint amount) public returns(bool){ //try argument (0x14723a09acff6d2a60dcdf7aa4aff308fddc160c,100)  
        _address.send(amount);  //send returns false on error.
    }  
}  
