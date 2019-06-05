/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.0;
contract Contract2{
    string private value;
    //EVM rejects execution and return out of gas.
    function method1(string memory _value) public{
        while(true){ //infinite loop cause out of gas.
          value = _value;
        }
    }
}