/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.0;
contract Contract3{
    uint result;
    /*will raise "LogicalError.devide errored: VM error: invalid opcode"
      if num1 is 0. Divide by Zero.
    */
    function devide(uint num, uint num1) public returns (uint) {
        result = num/num1;
        return result;
    }
}