pragma solidity ^0.5.1;
contract Math {

    function isDivisibleBy(uint dividend, uint divisor ) external pure  returns( bool ){
        if((dividend % divisor) == 0){
            return true;
     }
     else {
            return false;
     }
    }
}
contract MathUser {
    uint balance = 5;
    Math util = new Math();
    function outputOfisDivisibleBy() public view returns(bool){
        return util.isDivisibleBy(45,5);
    }
}
