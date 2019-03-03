pragma solidity ^0.5.1;
contract OperatorsCollection{
    //Arithmatics OperatorsCollection
    uint result;
    function add(uint num, uint num1) public returns (uint) {
        result = num + num1;
        return result;
    }
    function substract(uint num, uint num1) public returns (uint) {
        result = num - num1;
        return result;
    }
    function multiply(uint num, uint num1) public returns (uint) {
        result = num * num1;
        return result;
    }
    function devide(uint num, uint num1) public returns (uint) {
        result = num/num1;
        return result;
    }
    function modulo(uint num, uint num1) public returns (uint) {
        result = num % num1;
        return result;
    }
    function exponentiation(uint num, uint num1) public returns (uint) {
        result = num ** num1;
        return result;
    }
    //Logical OperatorsCollection
    function logicalchecks(uint num, uint num1) public pure returns (bytes32) {
        if(num >= num1){
            return "num is greater and equal to num1";
         }
        if(num <= num1) {
            return "num is less and equal to num1";
         }
        if(num > num1){
            return "num is greater than num1";
         }
        if(num == num1){
            return "num is equal to num1";
         }
        if(num != num1){
            return "num is not equal to num1";
         }
        if(num > num1){
            return "num is greater than num1";
         }
        if(num > 10 && num1 < 10){
            return "follow short-circuiting rule";
         }
        if(num > 10 || num1 < 10){
            return "follow short-circuiting rule.";
         }
    }
    //logical operators
    
    function and(bytes1 num, bytes1 num1) public pure returns (bytes1) {
        return num & num1;
    }
    
    function or(bytes1 num, bytes1 num1) public pure returns (bytes1) {
        return num | num1;
    }
    
    function xor(bytes1 num, bytes1 num1) public pure returns (bytes1) {
        return num ^ num1;
    }
    //shift operators
    function shiftright(uint num, uint num1) public pure returns (uint) {
        return num >> num1; 
    }
    function shifleft(uint num, uint num1) public pure returns (uint) {
        return num << num1;
    }
}